    <div class="main-panel">
        <div class="content-wrapper">
          <div class="card">
            <div class="card-body">
              <h3>Payhead Add</h3>
              <div class="row">
                <div class="col-12 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                        <form method="POST" id="form" action="<?php echo base_url();?>index.php/salary/eardeduadd" >
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-4">
                                    <label for="exampleInputName1">Employee Name:</label>
                                     <select name="emp_cd" class="form-control" id="emp_cd" >
                                         <option value="">Select Employee</option>
                                         <?php foreach($emps as $emps) { ?>
                                         <option value="<?=$emps->emp_code?>"><?=$emps->emp_name?></option>
                                         <?php } ?>
                                     </select>
                                    </div>
                                    <div class="col-4">
                                    <label for="exampleInputName1">Basic:</label>
                                    <input type="number" name="basic" value="" class="form-control" id="basic" required/>
                                    </div>
                                    <div class="col-4">
                                    <label for="exampleInputName1">Effective Date:</label>
                                    <input type="date" name="effective_dt" value="" class="form-control" required />
                                    </div>
                                </div>
                            </div>
                            <div class="row"  style="text-align: center;">
                              <div class="col-6">
                                    <h3 style="color:green">Earning</h3>
                              </div>
                              <div class="col-6">
                                      <h3 style="color:red">Deduction</h3>
                              </div>
                            </div>
                            <div class="row">
                              <div class="col-6 grid-margin">
                                <table id="debit_vau_tab">
                                  <thead>
                                      <tr>
                                          <th width="40%">Pay Head Type</th>
                                          <th width="40%">Amount</th>
                                          <th>
                                            <button class="btn btn-success" type="button" id="debitnewrow"><i class="fa fa-arrow-circle-down" aria-hidden="true"></i></button>
                                          </th>
                                      </tr>
                                  </thead>
                                <tbody id="debitadd">
                                  <tr>
                                    <td style="padding: 0px 5px 0px 5px"> 
                                      <select name="epay_cd[]" id="epay_cd_1" class="form-control" onchange="set_grDebit(1)">
                                            <option value="">Select Payhead</option>
                                            <?php foreach($epayhead as $key) { ?>
                                            <option value="<?=$key->sl_no?>"><?=$key->pay_head?></option>
                                            <?php } ?>
                                        </select> 
                                    </td>
                                    <td>
                                      <input type="number" title="" class="form-control eamount" id="eamount_1" name="eamount[]" value="0.00" required>
                                    </td>
                                    </tr>
                                  </tbody>
                                </table>
                               </div>
                              <div class="col-6 grid-margin">
                                  <table id="vau_tab">
                                    <thead>
                                        <tr>
                                              <th width="40%">Pay Head Type</th>
                                              <th width="40%">Amount</th>
                                            <th>
                                            <button class="btn btn-success" type="button" id="newrow"><i class="fa fa-arrow-circle-down" aria-hidden="true"></i></button>
                                            
                                            </th>
                                        </tr>
                                    </thead>
                                  <tbody id="add">
                                    <tr>
                                      <td style="padding: 0px 5px 0px 5px">
                                        <select name="dpay_cd[]" class="form-control" id="dpay_cd_1" onchange="set_grded(1)">
                                              <option value="">Select Payhead</option>
                                              <?php foreach($dpayhead as $key) { ?>
                                              <option value="<?=$key->sl_no?>"><?=$key->pay_head?></option>
                                              <?php } ?>
                                          </select> 
                                      </td>
                                      <td>
                                        <input type="number" title="" class="form-control" id="" name="damount[]"  value="0.00">
                                      </td>
                                      </tr>
                                    </tbody>
                                  </table>
                              </div>
                            </div>
                            <div class="row">
                                <div class="col-6 grid-margin">
                                  <div class="row">
                                          <div class="col-md-6" style="padding: 0px 0px 0px 22px">
                                            Total  Earning
                                          </div>
                                          <div class="col-md-6" id="tot_earning">
                                            
                                         </div>
                                  </div>       
                                </div> 
                                <div class="col-6 grid-margin">
                                   <div class="row">
                                      <div class="col-6 grid-margin">
                                        Total Deduction
                                      </div>
                                      <div class="col-6 " id="tot_earning">
                                        500
                                      </div>
                                    </div> 
                                </div> 
                            </div>
                            <button type="submit" class="btn btn-primary mr-2">Submit</button>
                            <button class="btn btn-light">Cancel</button>
                        </form>
                        </div>
                    </div>
                </div>
              </div>
            </div>
          </div>
    </div>


    <script>
    $(document).ready(function() {
        var tot_amt = 0;
        $("#debitnewrow").click(function() {
            if ($('#v_type').val() != '') {
                var tr_len = $('#debit_vau_tab #debitadd>tr').length;
                var x = tr_len + 1;
                
                $("#debitadd").append('<tr class="mb-2"><td><select id="epay_cd_' + x + '" name="epay_cd[]" class="form-control eamount" onchange="set_grDebit(' + x + ')" required><option value="">Select</option>' +
                    "<?php
                        foreach ($epayhead as $key) {
							   
                            echo "<option value='" . $key->sl_no . "'>" . $key->pay_head . "</option>";
							 
                        }
                        ?>" + '</select></td>' +'<td><input type="number" class="form-control"  id="eamount_' + x + '" name="eamount[]"  value="0.00" required ></td>' + '<td><button type = "button" class = "btn btn-danger" id = "removeRow_Debit"> <i class = "fa fa-undo" aria-hidden = "true" > </i></button> </td></tr> ');
			     //  $( ".select2" ).select2();

            } else {
                alert('Please Select Voucher Type First');
                return false;
            }
        });
    });

    $("#debitadd").on('click', '#removeRow_Debit', function() {
            $(this).parent().parent().remove();
            $('.amount_cls_Debit').change();
        });


        var tot_amt = 0;
        $("#newrow").click(function() {
            if ($('#v_type').val() != '') {
                var tr_len = $('#vau_tab #add>tr').length;
                var x = tr_len + 1;

                $("#add").append('<tr class="mb-2"><td><select id="dpay_cd_' + x + '" name="dpay_cd[]" class="form-control"  onchange="set_grded(' + x + ')" required><option value="">Select</option>' +
                    "<?php
                        foreach ($dpayhead as $value) {
							   
                            echo "<option value='" . $value->sl_no . "'>" . $value->pay_head . "</option>";
							 
                        }
                        ?>" + '</select></td>'+'<td><input type="text" class="form-control"  id="damount_' + x + '" name="damount[]" oninput="validate(this)" required value="0.00"></td>' +  '<td><button type = "button" class = "btn btn-danger" id = "removeRow"> <i class = "fa fa-undo" aria-hidden = "true" > </i></button> </td></tr> ');
			  $( ".select2" ).select2();

            } else {
                alert('Please Select Voucher Type First');
                return false;
            }
        });

        $("#add").on('click', '#removeRow', function() {
            $(this).parent().parent().remove();
            //$('.preferenceSelect').change();
            $('.amount_cls').change();
        });

        $('#emp_cd').on('change', function() {
            var emp_cd = $(this).val()
            $.ajax({
                type: "GET",
                url: "<?= site_url() ?>/salary/get_basic",
                data: {"emp_cd": emp_cd},
                success: function(result) {
                    if (result) {
                        $('#basic').val(result);
                    } else {
                        $('#submit').removeAttr('disabled')
                    }
                }
            });
        })

      function set_grDebit(id) {
        var pre_val = '';
        var pre_id = id - 1;
        var basic = $('#basic').val();
        var tot   = 0.00;
        var inputValue = 0.00;
        var total = 0.00;
        if(basic > 0 ) {
        $.ajax({
            type: "GET",
            url: "<?php echo site_url('salary/paytype_detail'); ?>",
            data: {
              epay_cd: $('#epay_cd_' + id).val()
            },
        //    dataType: 'html',
            success: function(result) {
                var result = $.parseJSON(result);
                var input_flag = result.input_flag;
                if (id > 1) {
                    pre_val = $('#epay_cd_' + pre_id).val();
                    if (pre_val == $('#epay_cd_' + id).val()) {
                        alert('Pay Head Can Not Be Same');
                        $('#epay_cd_' + id).val('');
                    } else {
                       if(input_flag == 'A'){
                        tot = basic*(result.percentage/100);
                        $('#eamount_' + id).val(tot.toFixed());
                        $('.eamount').each(function() {
                          // Parse the value as a float and add to total
                          var inputValue = parseFloat($(this).val());
                          total += isNaN(inputValue) ? 0 : inputValue;

                      });
                      total  +=parseFloat(basic);
                      $('#tot_earning').html(total.toFixed());
                    
                       }
                       
                    }
                } else {
                  if(input_flag == 'A'){
                    tot = basic*(result.percentage/100);
                    $('#eamount_1').val(tot.toFixed());
                    $('.eamount').each(function() {
                          var inputValue = parseFloat($(this).val());
                          total += isNaN(inputValue) ? 0 : inputValue;

                      });
                      total  +=parseFloat(basic);
                      $('#tot_earning').html(total.toFixed());
                    
                  }
                }
            }
        });

        }else{
          alert('Please Check basic Value');
        }
      }
      function set_grded(id) {
        var pre_val = '';
        var pre_id = id - 1;
        var basic = $('#basic').val();
        var tot   = 0.00;
        $.ajax({
            type: "GET",
            url: "<?php echo site_url('salary/paytype_detail'); ?>",
            data: {
              epay_cd: $('#dpay_cd_' + id).val()
            },
        //    dataType: 'html',
            success: function(result) {
                var result = $.parseJSON(result);
                var input_flag = result.input_flag;
                if (id > 1) {
                    pre_val = $('#dpay_cd_' + pre_id).val();
                    if (pre_val == $('#dpay_cd_' + id).val()) {
                        alert('Pay Head Can Not Be Same');
                        $('#dpay_cd_' + id).val('');
                    } else {
                       if(input_flag == 'A'){
                        tot = basic*(result.percentage/100);
                        $('#damount_' + id).val(tot.toFixed());
                       }
                    }
                } else {
                  if(input_flag == 'A'){
                    tot = basic*(result.percentage/100);
                    $('#damount_1').val(tot.toFixed());
                  }
                }
            }
        });
      }
</script>