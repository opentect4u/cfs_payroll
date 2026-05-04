<script>
function printDiv() {
    var divToPrint = document.getElementById('divToPrint');
    var WindowObject = window.open('', 'Print-Window');
    WindowObject.document.open();
    WindowObject.document.writeln('<!DOCTYPE html>');
    WindowObject.document.writeln('<html><head><title></title><style type="text/css">');
    WindowObject.document.writeln('@media print { .center { text-align: center;}' +
        '                                         .row { display: flex;flex-wrap: wrap; }' +
        '                                         .btmborder { border-bottom: 2px solid black; }' +
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
<!-- <style>
@media print {
    .row {
        display: flex;
        flex-wrap: wrap;
    }
    .col-3, .col-8 {
        flex: 1;
    }
    .col-3 {
        max-width: 25%; /* Since col-3 represents 25% width */
    }
    .col-8 {
        max-width: 75%; /* Since col-8 represents 75% width */
    }
    img {
        max-width: 100%; /* Ensure images fit within their columns */
        height: auto; /* Maintain aspect ratio */
    }
    /* Additional print styles */
    .no-print {
        display: none;
    }
}
</style> -->

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
                    <div class="col-3"><a href="javascript:void()"><img src="<?= base_url() ?>assets/images/<?php 
if (isset($this->session->userdata['loggedin']['logo_path'])) {
    echo $this->session->userdata['loggedin']['logo_path']; 
}
?>" alt="logo" height="100" width="100" /></a></div>
                    <div class="col-9" class="center">
                        <div class="center">
                            <?php include_once('common_report_header.php'); ?>
                            <h4>Salary summary report for the month of
                                <?php echo MONTHS[$this->input->post('sal_month')] . ' ' . $this->input->post('year'); ?>
                            </h4>
                        </div>
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="col-3"><b>Branch Name:</b><?=$barnch_name?></div>

                </div>
                <br>
                <div class="row">
                    <div class="col-12">
                        <div class="table-responsive">
                            <table class="table" style="width:100%">
                                <thead>
                                    <tr>
                                        <th>Employee</th>
                                        <th>Basic</th>

                                        <!-- Earnings -->
                                        <?php foreach ($earnings as $ph) { ?>
                                        <th><?= $ph->pay_head ?></th>
                                        <?php } ?>
                                        <th>Gross</th>

                                        <!-- Deductions -->
                                        <?php foreach ($deductions as $ph) { ?>
                                        <th><?= $ph->pay_head ?></th>
                                        <?php } ?>
                                        <th>Total Deduction</th>

                                        <th>Net Salary</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach ($report as $emp) { 

                                        $basic = $this->Report_Process->getempsalryd(
                                            $emp['emp_code'], $sal_month, $year, $bank_id, 0
                                        );

                                        $gross = $basic;
                                        $total_deduction = 0;
                                    ?>
                                    <tr>
                                        <td><?= $emp['emp_name'] ?></td>

                                        <!-- Basic -->
                                        <td><?= $basic ?></td>

                                        <!-- Earnings -->
                                        <?php foreach ($earnings as $ph) { 
                            $val = isset($emp['payheads'][$ph->sl_no]) 
                                    ? $emp['payheads'][$ph->sl_no] 
                                    : 0;
                            $gross += $val;
                                ?>
                                        <td><?= $val ?></td>
                                        <?php } ?>

                                        <!-- Gross -->
                                        <td><b><?= $gross ?></b></td>

                                        <!-- Deductions -->
                                        <?php foreach ($deductions as $ph) { 
                            $val = isset($emp['payheads'][$ph->sl_no]) 
                                    ? $emp['payheads'][$ph->sl_no] 
                                    : 0;
                            $total_deduction += $val;
                        ?>
                                        <td><?= $val ?></td>
                                        <?php } ?>

                                        <!-- Total Deduction -->
                                        <td><b><?= $total_deduction ?></b></td>

                                        <!-- Net Salary -->
                                        <td>
                                            <b><?= $gross - $total_deduction ?></b>
                                        </td>
                                    </tr>
                                    <?php } ?>
                                </tbody>
                            </table>

                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">

                        <div class="" style="margin-top:50px">
                            <p style="display: inline;">Prepared By</p>
                            <p style="display: inline; margin-left: 8%;"></p>
                            <p style="display: inline; margin-left: 8%;"></p>
                            <p style="display: inline; margin-left: 8%;">Chief Executive officer</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <input type='button' id='btn' value='Print' onclick='printDiv();'>
                </div>
            </div>

        </div>
    </div>



    <?php
} else if ($_SERVER['REQUEST_METHOD'] == 'GET') {

    ?>
    <div class="main-panel">
        <div class="content-wrapper">
            <div class="card">
                <div class="card-body">
                    <h3>Employee Salary Statement Report</h3>
                    <div class="row">
                        <div class="col-12 grid-margin stretch-card">
                            <div class="card">
                                <div class="card-body">
                                    <form method="POST" id="form"
                                        action="<?php echo site_url("reports/payhead_data_emp"); ?>">
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-3">
                                                    <label for="exampleInputName1">Branch:</label>
                                                    <select class="form-control" name="branch_id" id="branch_id"
                                                        required>
                                                        <option value="">Select Branch</option>
                                                        <option value="0">All Branch</option>
                                                        <?php foreach ($branchlist as $m_list) { ?>
                                                        <option value="<?php echo $m_list->id ?>">
                                                            <?php echo $m_list->branch_name; ?></option>
                                                        <?php
                                                            }
                                                            ?>
                                                    </select>
                                                </div>
                                                <div class="col-3">
                                                    <label for="exampleInputName1">Input Year:</label>
                                                    <input type="text" class="form-control" name="year" id="year"
                                                        value="<?php echo date('Y'); ?>" required />
                                                </div>
                                                <div class="col-3">
                                                    <label for="exampleInputName1">Select Month:</label>
                                                    <select class="form-control" name="sal_month" id="sal_month"
                                                        required>
                                                        <option value="">Select Month</option>
                                                        <?php foreach ($month_list as $m_list) { ?>

                                                        <option value="<?php echo $m_list->id ?>">
                                                            <?php echo $m_list->month_name; ?></option>

                                                        <?php
                                                            }
                                                            ?>

                                                    </select>

                                                </div>
                                                <div class="col-3">
                                                    <label for="exampleInputName1">Category:</label>
                                                    <select class="form-control required" name="category" id="category"
                                                        required>

                                                        <option value="">Select Category</option>

                                                        <?php foreach ($category as $c_list) { ?>

                                                        <option value="<?php echo $c_list->id; ?>">
                                                            <?php echo $c_list->category; ?></option>

                                                        <?php
                                                            }
                                                            ?>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>

                                        <input type="submit" class="btn btn-info" value="Proceed"
                                            onclick="return checkVal();" />
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