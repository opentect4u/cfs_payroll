<table id="order-listing" class="table stripe row-border order-column" style="width:100%">
    <thead>
    <tr>
        <th>Emp code</th>
        <th>Name</th>
        <th>Category</th>
        <th>Designation</th>
        <th>Branch </th>
        <th>Mobile</th>
        <th>Aadhaar No</th>
        <th>PAN No</th>
        <th>PF No</th>
        <th>Basic</th>
        <th class="not-export">Edit</th>
        <!-- <th>Delete</th> -->
    </tr>
    </thead>
    <tbody>
    <?php
    if ($employee_dtls) {
        $i = 0 ;
        foreach ($employee_dtls as $e_dtls) {
    ?>
        <tr>
            <td><?php if (strlen($e_dtls->prefix_emp_cd) > 0) echo $e_dtls->prefix_emp_cd; ?><?= $e_dtls->emp_code; ?></td>
            <td><?= $e_dtls->emp_name; ?></td>
            <td><?= $e_dtls->category; ?></td>
            <td><?= $e_dtls->designation; ?></td>
            <td><?= $e_dtls->branch_name; ?></td>
            <td><?= $e_dtls->phn_no; ?></td>
            <td><?= $e_dtls->aadhar_no; ?></td>
            <td><?= $e_dtls->pan_no; ?></td>
            <td><?= $e_dtls->UAN; ?></td>
            <td><?= $e_dtls->basic_pay; ?></td>
            <td>
            <a href="estem?emp_code=<?= $e_dtls->emp_code; ?>" data-toggle="tooltip" data-placement="bottom" title="Edit">
                <i class="fa fa-edit fa-2x" style="color: #007bff"></i>
            </a>
            </td>
            <!-- <td>
            <a type="button" class="delete" id="" data-toggle="tooltip" data-placement="bottom" title="Delete">
                <i class="fa fa-trash fa-2x"></i>
            </a>
            </td> -->
        </tr>
    <?php
        }
    } else {
        echo "<tr><td colspan='11' style='text-align: center;'>No data Found</td></tr>";
    }
    ?>
    </tbody>
</table>