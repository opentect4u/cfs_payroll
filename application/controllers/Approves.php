<?php
defined('BASEPATH') or exit('No direct script access allowed');
class Approves extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        if(!isset($this->session->userdata['loggedin']['user_id'])){
            redirect(base_url());
        }
        $this->load->model('Login_Process');
        $this->load->model('Salary_Process');
        $this->load->model('Admin_Process');
        $this->load->helper('pdf_helper');
        $this->load->library('email');
    }


    /**********************For Approve Screen**********************/

    public function payapprove()
    {
        $api_end_point = unserialize(API_END_POINTS);
        ini_set('max_execution_time', 600);
        // ini_set('memory_limit', '2048M');
        if ($this->input->get('trans_no')) {
            $bank_id = $this->session->userdata['loggedin']['bank_id'];
            $data_array     =   array(
                "approval_status"   => 'A',
                "approved_by"       => $this->session->userdata['loggedin']['user_id'],
                "approved_dt"       => date('Y-m-d')
            );
            $where = array(
                "bank_id" => $bank_id,
                "trans_no" => $this->input->get('trans_no'),
                "trans_date" => $this->input->get('trans_date'),
                "sal_month" => $this->input->get('month'),
                "sal_year" => $this->input->get('year'),
                "catg_cd" => $this->input->get('catg_cd')
            );

            $this->Salary_Process->f_edit("td_salary", $data_array, $where);
            $basic_code = $bank_id == 1 ? 0 : 101;
            $where1 = array(
                "a.bank_id=b.sl_no AND IF(a.pay_head_id > 0, a.pay_head_id, $basic_code)=c.sl_no AND a.bank_id=c.bank_id AND a.emp_code=d.emp_code AND a.bank_id=d.bank_id" => null,
                "a.sal_month" => $this->input->get('month'),
                "a.sal_year" => $this->input->get('year'),
                "a.catg_id" => $this->input->get('catg_cd'),
            );
             
            $paySel = 'a.bank_id, b.bank_name, a.trans_dt, a.sal_month, a.sal_year, a.emp_code, a.pay_head_id, c.pay_head, c.acc_cd, a.pay_head_type, a.amount, d.bank_ac_no, a.created_by, d.branch_id';
            $erning_dt = $this->Admin_Process->f_get_particulars("td_pay_slip a, md_bank b, md_pay_head c, md_employee d", $paySel, $where1, 0);
            
            // echo $this->db->last_query();exit;

            $chunkSize = 50;
            $chunks = array_chunk($erning_dt, $chunkSize);
            // var_dump($chunks);exit;

            $allProcessed = $this->sendChunksToAPI($chunks, "https://restaurantapi.opentech4u.co.in/sal/".$api_end_point[$bank_id]);

            if ($allProcessed) {
                $this->session->set_flashdata('msg', 'Successfully Approved!');
                // echo "All data inserted successfully!";
            } else {
                $this->session->set_flashdata('msg', 'Data not updated in server');
                // echo "Failed to insert all data.";
            }
            redirect('payapprv');
        }

        //Unapprove List of Salary
        $approve['unapprove_tot_dtls'] = $this->Salary_Process->generate_slip($trans_dt = null, $month = null, $year = null, $catg_id = null, $trans_no = null, 0);
        $this->load->view('post_login/payroll_main');
        $this->load->view("approve/dashboard", $approve);
        $this->load->view('post_login/footer');
    }
	
	function sendChunksToAPI($chunks, $url) {
        $multiHandle = curl_multi_init();
        $curlHandles = [];
    
        foreach ($chunks as $i => $chunk) {
            $ch = curl_init();
            curl_setopt($ch, CURLOPT_URL, $url);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
            curl_setopt($ch, CURLOPT_POST, 1);
            curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($chunk));
            curl_setopt($ch, CURLOPT_HTTPHEADER, ['Content-Type: application/json']);
            curl_multi_add_handle($multiHandle, $ch);
            $curlHandles[$i] = $ch;
        }
    
        $running = null;
        do {
            curl_multi_exec($multiHandle, $running);
        } while ($running);
    
        $allProcessed = true;
        foreach ($curlHandles as $ch) {
            $response = curl_multi_getcontent($ch);
            $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
            if ($httpCode != 200) {
                $allProcessed = false;
            }
            curl_multi_remove_handle($multiHandle, $ch);
            curl_close($ch);
        }
    
        curl_multi_close($multiHandle);
    
        return $allProcessed;
    }

    function save_sal_slip($data)
    {
        $url = 'https://restaurantapi.opentech4u.co.in';
        $curl = curl_init();

        curl_setopt_array($curl, array(
            CURLOPT_URL => $url . '/sal/save_ghatal_ardb',
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => '',
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 0,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => 'POST',
            CURLOPT_POSTFIELDS => json_encode($data),
            CURLOPT_HTTPHEADER => array(
                'Content-Type: application/json'
            ),
        ));

        $response = curl_exec($curl);

        curl_close($curl);
        return $response;
        exit;
        // exit;
    }

    //Creating individual payslip PDF
    public function f_pdf($emp_dtls = NULL)
    {

        $data['payslip_dtls'] = $emp_dtls;

        $this->load->view('reports/pdfreport', $data);

        $file_name  = $emp_dtls->emp_no . $emp_dtls->sal_year . $emp_dtls->sal_month;

        $email_addr = $emp_dtls->email;

        chmod(FCPATH . "payslip/" . $file_name . ".pdf", 0766);
    }

    //Send Mail to the invidual email account
    public function f_email($file_name, $email_addr)
    {

        $this->email->clear(TRUE);
        $this->email->from('confedwb.org@gmail.com', 'Payslip');

        $this->email->to($email_addr);

        $this->email->subject('Payslip for the month of ' . date("F", strtotime(date('Y-m-d'))));
        $this->email->message('');
        $this->email->attach(FCPATH . 'payslip/' . $file_name . '.pdf');
        $this->email->send();

        unlink(FCPATH . 'payslip/' . $file_name . '.pdf');
    }
}
