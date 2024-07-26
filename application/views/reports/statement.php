<script>
    function printDiv() {

        var divToPrint = document.getElementById('divToPrint');
        var WindowObject = window.open('', 'Print-Window');
        WindowObject.document.open();
        WindowObject.document.writeln('<!DOCTYPE html>');
        WindowObject.document.writeln('<html><head><title></title><style type="text/css">');
        WindowObject.document.writeln('@media print { .center { text-align: center;}' +
            '                                         .inline { display: inline; }' +
            '                                         .underline { text-decoration: underline; }' +
            '                                         .left { margin-left: 315px;} ' +
            '                                         .right { margin-right: 375px; display: inline; }' +
            '                                          table { border-collapse: collapse; }' +
            '                                          th { text-align: center; vertical-align: middle; }' +
            '                                          th, td { border: 1px solid black; border-collapse: collapse; padding: 10px;}' +
            '                                           th, td { }' +
            '                                         .border { border: 1px solid black; } ' +
            '                                         .bottom { bottom: 5px; width: 100%; position: fixed ' +
            '                                       ' +
            '                                   } } </style>');
        WindowObject.document.writeln('</head><body onload="window.print()">');
        WindowObject.document.writeln(divToPrint.innerHTML);
        WindowObject.document.writeln('</body></html>');
        WindowObject.document.close();
        setTimeout(function() {
            WindowObject.close();
        }, 10);
    }
</script>

<style>
    th {
        text-align: center;
        vertical-align: middle !important;
    }
</style>

<?php
if ($_SERVER['REQUEST_METHOD'] == "POST") {
?>
    <div class="main-panel">
        <div class="content-wrapper">
            <div class="card">
                <div class="card-body" id='divToPrint'>
                    <div class="row">
                        <div class="col-2 payslip_logo_Uts"><a href="javascript:void()"><img src="<?= base_url() ?>assets/images/bm_ardb.jpg" alt="logo" height="100" width="100" /></a></div>
                        <div class="col-10">
                            <div style="text-align:center;">
                                 <?php include_once('common_report_header.php'); ?>
                                <h4>Salary summary report for the month of <?php echo MONTHS[$this->input->post('sal_month')] . ' ' . $this->input->post('year'); ?></h4>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <div class="table-responsive">
                                <table id="order-listing" class="table">
                                    <thead>
                                        <tr>
                                            <th>Sl No.</th>
                                            <th>Name</th>
                                            <th>Basic Pay</th>
                                         <!--   <th>S.P.</th>  -->
                                            <th>D.A.</th>
                                            <th>H.R.A.</th>
                                            <th>M.A.</th>
                                            <th>S.A.</th>
                                        <!--    <th>T.A.</th>  -->
                                            <th>Arrear</th>
                                     <!--       <th>O.T.</th>  -->
                                            <th>Income Tax</th>
                                            <th>CON.<br> P.F.</th>
                                      <!--      <th>GPF of<br>GOVT Staff</th> 
                                            <th>GI of<br>GOVT Staff</th> -->
                                            <th>LIC</th>
                                            <th>Festival Adv.</th>
                                      <!--    <th>Group Insurance</th> -->
											<th>S.S.Loan PRIN</th> 
                                            <th>P.T.</th>
                                            <!--<th>ECCS</th>  -->
											<th>S. S. LOAN INTT</th>
                                            <th>SW Loan Prin.</th>
                                            <th>SW Loan Int.</th>
                                            <th>Salary Adv.</th>
                                            <th>Total <br>Deduction</th>
                                            <th>Net Amount</th>
                                            <th>Bank A/C No.</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php
                                        if ($statement) {
                                            $i  =   1;
                                            $tot_net = 0;$tot_basic = $tot_sp = $tot_da =$tot_hra =$tot_ma =$tot_sa=
											$tot_arrear= $tot_it=$tot_cpf=$tot_lic=0;$tot_ssloan =0;$tot_pt=0;$tot_ssloan_int=0;
											$tot_swloan_pr=0;$tot_swloan_int=0;$tot_sal_adv=0;$tot_dedu=0;
                                            foreach ($statement as $s_list) {
                                                
												$tot_basic +=$s_list->basic;
												$tot_sp +=$s_list->sp;
												$tot_da += $s_list->da;
												$tot_hra +=$s_list->hra;
												$tot_ma +=$s_list->ma;
												$tot_sa +=$s_list->sa;
												$tot_arrear +=$s_list->arrear;
												$tot_it  +=$s_list->it;
												$tot_cpf +=$s_list->cpf;
												$tot_lic += $s_list->lpf; 
												$tot_ssloan +=$s_list->gi; 
												$tot_pt +=$s_list->top; 
												$tot_ssloan_int +=$s_list->eccs;
												$tot_swloan_pr +=$s_list->hblp;
												$tot_swloan_int +=$s_list->hbli; 
												$tot_dedu +=$s_list->tot_diduction;
												$tot_net += $s_list->net_sal;
												
                                        ?>
                                                <tr>

                                                    <td><?= $i++; ?></td>
                                                    <td><?= $s_list->emp_name; ?></td>
                                                    <td><?= $s_list->basic; ?></td>
                                            <!--        <td><?= $s_list->sp; ?></td>  -->
                                                    <td><?= $s_list->da; ?></td>
                                                    <td><?= $s_list->hra; ?></td>
                                                    <td><?= $s_list->ma; ?></td>
                                                    <td><?= $s_list->sa; ?></td>
                                             <!--       <td><?= $s_list->ta; ?></td> -->
                                                    <td><?= $s_list->arrear; ?></td>
                                            <!--        <td><?= $s_list->ot; ?></td>  -->
                                                    <td><?= $s_list->it; ?></td>
                                                    <td><?= $s_list->cpf; ?></td>
                                              <!--      <td><?php //echo $s_list->gpf; ?></td> 
                                                    <td><?= $s_list->gigs; ?></td> -->
                                                    <td><?= $s_list->lpf; ?></td>
                                                    <td><?= $s_list->fa; ?></td>
                                                    <td><?= $s_list->gi; ?></td>
                                                    <td><?= $s_list->top; ?></td>
                                                    <td><?= $s_list->eccs; ?></td>
                                                    <td><?= $s_list->hblp; ?></td>
                                                    <td><?= $s_list->hbli; ?></td>
                                                    <td><?= $s_list->s_adv; ?></td>
                                                    <td><?= $s_list->tot_diduction; ?></td>
                                                    <td><?= $s_list->net_sal; ?></td>
                                                    <td><?= $s_list->bank_ac_no; ?></td>

                                                </tr>
                                            <?php
                                            }
                                            ?>
                                            <tr>
                                                <td colspan="2">Total Amount  Rs. </td>
												<td ><?=$tot_basic?></td>
										<!--		<td><?=$tot_sp?></td>  -->
												<td><?=$tot_da?></td>
												<td><?=$tot_hra?></td>
												<td><?=$tot_ma?></td>
												<td><?=$tot_sa?></td>
											<!--	<td>0</td>  -->
												<td><?=$tot_arrear?></td>
												<td><?=$tot_it?></td>
												<td><?=$tot_cpf?></td>
												<td><?=$tot_lic?></td>
												<td>0</td>
												<td><?=$tot_ssloan?></td>
												<td><?=$tot_pt?></td>
												<td><?= $tot_ssloan_int?></td>
												<td><?= $tot_swloan_pr?></td>
												<td><?= $tot_swloan_int?></td>
												<td><?= $tot_sal_adv?></td>
												<td><?= $tot_dedu?></td>
                                                <td><?php echo $tot_net; ?></td>
                                            </tr>
                                        <?php
                                        } else {
                                            echo "<tr><td colspan='32' style='text-align:center;'>No Data Found</td></tr>";
                                        }
                                        ?>
                                    </tbody>
                                </table>
                                <br>
                                <div>
                                    <p>Amount: <?php echo @$tot_net . ' (' . getIndianCurrency(@$tot_net > 0 ? $tot_net : 0.00) . ').'; ?></p>
                                </div>

                                <div class="bottom">
                                    <p style="display: inline;">Prepared By</p>
                                    <p style="display: inline; margin-left: 8%;"></p>
                                    <p style="display: inline; margin-left: 8%;"></p>
                                    <p style="display: inline; margin-left: 8%;">Chief Executive officer</p>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                <input type='button' id='btn' value='Print' onclick='printDiv();'>
            </div>
        </div>



    <?php
} else if ($_SERVER['REQUEST_METHOD'] == 'GET') {

    ?>
        <div class="main-panel">
            <div class="content-wrapper">
                <div class="card">
                    <div class="card-body">
                        <h3>Salary Statement Report</h3>
                        <div class="row">
                            <div class="col-12 grid-margin stretch-card">
                                <div class="card">
                                    <div class="card-body">
                                        <form method="POST" id="form" action="<?php echo site_url("reports/paystatementreport"); ?>">
                                            <div class="form-group">
                                                <div class="row">
                                                    <div class="col-6">
                                                        <label for="exampleInputName1">From Date:</label>
                                                        <input type="date" name="from_date" class="form-control required" id="from_date" value="<?php echo $this->session->userdata('sys_date'); ?>" />
                                                    </div>
                                                    <div class="col-6">
                                                        <label for="exampleInputName1">Select Month:</label>
                                                        <select class="form-control" name="sal_month" id="sal_month" require>
                                                            <option value="">Select Month</option>
                                                            <?php foreach ($month_list as $m_list) { ?>

                                                                <option value="<?php echo $m_list->id ?>"><?php echo $m_list->month_name; ?></option>

                                                            <?php
                                                            }
                                                            ?>

                                                        </select>

                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="row">
                                                    <div class="col-6">
                                                        <label for="exampleInputName1">Input Year:</label>
                                                        <input type="text" class="form-control" name="year" id="year" value="<?php echo date('Y'); ?>" require />
                                                    </div>
                                                    <div class="col-6">
                                                        <label for="exampleInputName1">Category:</label>
                                                        <select class="form-control required" name="category" id="category" require>

                                                            <option value="">Select Category</option>

                                                            <?php foreach ($category as $c_list) { ?>

                                                                <option value="<?php echo $c_list->id; ?>"><?php echo $c_list->category; ?></option>

                                                            <?php
                                                            }
                                                            ?>

                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <input type="submit" class="btn btn-info" value="Proceed" onclick="return checkVal();" />
                                            <button class="btn btn-light">Cancel</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        <?php

    } else {

        echo "<h1 style='text-align: center;'>No Data Found</h1>";
    }

        ?>

        <script>
            function checkVal() {
                var month = $('#sal_month').val();
                var catg_id = $('#category').val();
                if (month > 0 && catg_id > 0) {
                    return true;
                } else {
                    alert('Please fill all fields')
                    return false;
                }
            }
        </script>