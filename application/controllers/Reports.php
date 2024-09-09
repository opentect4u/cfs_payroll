<?php

class Reports extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        if(!isset($this->session->userdata['loggedin']['user_id'])){
            redirect(base_url());
        }
        $this->load->model('Login_Process');
        $this->load->model('Report_Process');
        $this->load->model('Admin_Process');
        $this->load->helper('paddyrate_helper');
        $this->load->model('Salary_Process');
    }

    //Category wise 

    public function salarycatgreport()
    {

        if ($_SERVER['REQUEST_METHOD'] == "POST") {
            //Employee Ids for Salary List
            $select     =   array("emp_code");
            $where      =   array(
                "emp_catg"  =>  $this->input->post('category')
            );

            $emp_id     =   $this->Report_Process->f_get_particulars("md_employee", $select, $where, 0);
            //Temp variable for emp_list
            $eid_list   =   [];
            for ($i = 0; $i < count($emp_id); $i++) {
                array_push($eid_list, $emp_id[$i]->emp_code);
            }

            //List of Salary Category wise
            unset($where);
            $where = array(
                "m.emp_code = t.emp_no" =>  NULL,
                "t.sal_month"     =>  $this->input->post('sal_month'),
                "t.sal_year"      =>  $this->input->post('year')
            );

            $salary['list']               =   $this->Report_Process->f_get_particulars_in("md_employee m,td_pay_slip t", $eid_list, $where);

            // $salary['attendance_dtls']    =   $this->Report_Process->f_get_attendance();

            //Employee Group Count
            unset($select);
            unset($where);

            $select =   array(
                "m.emp_code",  "COUNT(m.emp_code) count", "m.emp_name"
            );

            $where  =   array(
                "t.sal_month"     =>  $this->input->post('sal_month'),
                "t.sal_year = '" . $this->input->post('year') . "' GROUP BY m.emp_code,m.emp_name"      =>  NULL
            );

            $salary['count']              =   $this->Report_Process->f_get_particulars("md_employee m,td_pay_slip t", $select, $where, 0);
            // f_get_particulars("md_employee m, td_pay_slip t", $select, $where, 0);
            // echo $this->db->last_query();
            // die();

            $this->load->view('post_login/payroll_main');
            $this->load->view("reports/salary", $salary);
            $this->load->view('post_login/footer');
        } else {

            //Month List
            $salary['month_list'] =   $this->Report_Process->f_get_particulars("md_month", NULL, NULL, 0);
            //For Current Date
            $salary['sys_date']   =   $_SESSION['sys_date'];
            //Category List
            $salary['category']   =   $this->Report_Process->f_get_particulars("md_category", NULL, null, 0);

            $this->load->view('post_login/payroll_main');
            $this->load->view("reports/salary", $salary);
            $this->load->view('post_login/footer');
        }
    }

    //For Salary Statement

    public function paystatementreport()
    {

        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
          
            $month = $this->input->post('sal_month');
            $year = $this->input->post('year');
            $catg_id = $this->input->post('category');
            $bank_id = $this->session->userdata('loggedin')['bank_id'];

            $statement['sal_list']   =   $this->Report_Process->sal_emp_amt($month,$year,$catg_id,$bank_id);
           
            $this->load->view('post_login/payroll_main');
            $this->load->view("reports/statement", $statement);
            $this->load->view('post_login/footer');
        } else {

            //Month List
            $statement['month_list'] =   $this->Report_Process->f_get_particulars("md_month", NULL, NULL, 0);
            //Category List
            $statement['category']   =   $this->Report_Process->f_get_particulars("md_category", NULL, null, 0);
            $this->load->view('post_login/payroll_main');
            $this->load->view("reports/statement", $statement);
            $this->load->view('post_login/footer');
        }
    }
    //Total Deduction Report

    public function totaldeduction()
    {

        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            $totaldeduction['total_deduct'] =   $this->Report_Process->f_get_totaldeduction($this->input->post('from_date'), $this->input->post('to_date'));
            //Current Year
            $totaldeduction['year']  =   $this->Report_Process->f_get_particulars("md_parameters", array('param_value'), array('sl_no' => 15), 1);

            $this->load->view('post_login/payroll_main');
            $this->load->view("reports/totaldeduction", $totaldeduction);
            $this->load->view('post_login/footer');
        } else {
            //Month List
            $totaldeduction['month_list'] =   $this->Report_Process->f_get_particulars("md_month", NULL, NULL, 0);
            //For Current Date
            $totaldeduction['sys_date']   =   $_SESSION['sys_date'];

            $this->load->view('post_login/payroll_main');
            $this->load->view("reports/totaldeduction", $totaldeduction);
            $this->load->view('post_login/footer');
        }
    }

    public function totalearning()
    {

        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            $totalearning['total_ear'] =   $this->Report_Process->f_get_totalearning($this->input->post('from_date'), $this->input->post('to_date'));
            //Current Year
            $totalearning['year']  =   $this->Report_Process->f_get_particulars("md_parameters", array('param_value'), array('sl_no' => 15), 1);

            $this->load->view('post_login/payroll_main');
            $this->load->view("reports/totalearning", $totalearning);
            $this->load->view('post_login/footer');
        } else {
            //Month List
            $totalearning['month_list'] =   $this->Report_Process->f_get_particulars("md_month", NULL, NULL, 0);
            //For Current Date
            $totalearning['sys_date']   =   $_SESSION['sys_date'];

            $this->load->view('post_login/payroll_main');
            $this->load->view("reports/totalearning", $totalearning);
            $this->load->view('post_login/footer');
        }
    }

    public function payslipreport()
    {

        if ($_SERVER['REQUEST_METHOD'] == "POST") {

            //Payslip
            $empno     =  $this->input->post('emp_cd');
            $sal_month  = $this->input->post('sal_month');
            $sal_yr     = $this->input->post('year');

            // $where  =   array(
            //     "emp_code"            =>  $this->input->post('emp_cd'),
            //     "sal_month"         =>  $this->input->post('sal_month'),
            //     "sal_year"          =>  $this->input->post('year'),
            //     "approval_status"   =>  'U'
            // );
			
			$emp_whr = array(
                "a.emp_code" =>  $this->input->post('emp_cd'),
                "a.designation = b.sl_no" => null,
                "a.bank_id" =>  $this->session->userdata['loggedin']['bank_id']
            );
            $emp_select = 'a.*,b.designation';

            $payslip['emp_dtls']    =   $this->Report_Process->f_get_particulars("md_employee a,md_designation b", $emp_select, $emp_whr, 1);
           
            $where = array(
                'a.bank_id' => $this->session->userdata['loggedin']['bank_id'],
                "a.trans_date = b.trans_dt" =>  NULL,
                "a.trans_no = b.trans_no" =>  NULL,
                "a.sal_month = b.sal_month" =>  NULL,
                "a.sal_year = b.sal_year" =>  NULL,
                "a.bank_id = b.bank_id" =>  NULL,
                "a.catg_cd = b.catg_id" =>  NULL,
                "b.pay_head_id = c.sl_no" =>  NULL,
                "a.approval_status"        =>  'A',
                "b.emp_code"            =>  $empno,
                "b.sal_month"           =>  $sal_month,
                "b.sal_year"            =>  $sal_yr,
            );
            $payslip['payslip_dtls']  = $this->Report_Process->f_get_particulars("td_salary a,td_pay_slip b , md_pay_head c", array('b.*','c.pay_head'), $where, 0);
            $this->load->view('post_login/payroll_main');
            $this->load->view("reports/payslip", $payslip);
            $this->load->view('post_login/footer');
        } else {

            //Month List
            $payslip['month_list'] =   $this->Report_Process->f_get_particulars("md_month", NULL, NULL, 0);
            //For Current Date
            $payslip['sys_date']   =   $_SESSION['sys_date'];

            //Employee List
            unset($select);
            $select = array("emp_code", "emp_name");
            $payslip['emp_list']   =   $this->Report_Process->f_get_particulars("md_employee", $select, array("emp_catg IN (1,2,3)" => NULL,"bank_id"=>$this->session->userdata['loggedin']['bank_id']), 0);
            $this->load->view('post_login/payroll_main');
            $this->load->view("reports/payslip", $payslip);
            $this->load->view('post_login/footer');
        }
    }
    public function empeardedu()
    {
       
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
          
            $month = $this->input->post('sal_month');
            $year = $this->input->post('year');
            $catg_id = $this->input->post('category');
            $bank_id = $this->session->userdata('loggedin')['bank_id'];
           

            $statement['emp_list']   = $this->Report_Process->get_emp_list($catg_id,$month,$year,$bank_id);
          //  $statement['saldetail']  = $this->Report_Process->get_emp_saldetail($catg_id,$month,$year,$bank_id);
            $this->load->view('post_login/payroll_main');
            $this->load->view("reports/empeardedu", $statement);
            $this->load->view('post_login/footer');
        } else {

            //Month List
            $statement['month_list'] =   $this->Report_Process->f_get_particulars("md_month", NULL, NULL, 0);
            //Category List
            $statement['category']   =   $this->Report_Process->f_get_particulars("md_category", NULL, null, 0);
            $this->load->view('post_login/payroll_main');
            $this->load->view("reports/empeardedu", $statement);
            $this->load->view('post_login/footer');
        }
    }
    public function empeardedudd()
    {
       
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
          
            $month = $this->input->post('sal_month');
            $year = $this->input->post('year');
            $catg_id = $this->input->post('category');
            $branch_id = $this->input->post('branch_id');
            $bank_id = $this->session->userdata('loggedin')['bank_id'];
            $statement['branchname'] = '';
            $statement['emp_list']   = $this->Report_Process->get_emp_list($branch_id,$catg_id,$month,$year,$bank_id);
            $statement['sal_month'] = $this->input->post('sal_month');
            $statement['year'] = $this->input->post('year');
            $statement['bank_id'] = $this->session->userdata('loggedin')['bank_id'];
            if($branch_id > 0 ){
                $statem =   $this->Report_Process->f_get_particulars("md_branch", NULL, array('id'=>$branch_id), 1);
                $statement['barnch_name'] = $statem->branch_name;
            }else{
                $statement['barnch_name'] = 'ALL';
            }

          //  $statement['saldetail']  = $this->Report_Process->get_emp_saldetail($catg_id,$month,$year,$bank_id);
            $this->load->view('post_login/payroll_main');
            $this->load->view("reports/empeardedudd", $statement);
            $this->load->view('post_login/footer');
        } else {
            //Month List
            $statement['month_list'] =   $this->Report_Process->f_get_particulars("md_month", NULL, NULL, 0);
            $where = array('bank_id'=>$this->session->userdata('loggedin')['bank_id']);
            $statement['branchlist']   =   $this->Report_Process->f_get_particulars("md_branch", NULL,$where, 0);
            $statement['category']   =   $this->Report_Process->f_get_particulars("md_category", NULL, null, 0);
            $this->load->view('post_login/payroll_main');
            $this->load->view("reports/empeardedudd", $statement);
            $this->load->view('post_login/footer');
        }
    }
}
