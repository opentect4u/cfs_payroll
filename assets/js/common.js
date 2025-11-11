function _datatable(title, left = 1, right = 1, tbl = 'tbl') {
    $('#' + tbl).DataTable({
        dom: 'lBfrtip',
        processing: true,
        scrollY: '450px',
        scrollX: true,
        scrollCollapse: true,
        paging: false,
        responsive: true,
        stateSave: true,
        colReorder: true,
//        columns: [null, null, null, null, null, {'searchable': false}, {'searchable': false}, {'searchable': false}],
        fixedColumns: {
            left: left,
            right: right
        },
        buttons: [
            {
                extend: 'copy',
                text: 'Copy',
                exportOptions: {
                    columns: ':not(.not-export)'
                }
            },
            {
                extend: 'excel',
                text: 'Excel',
                filename: title.replace(/ /g, '_').toLowerCase() + '_' + $.now(),
                title: title,
                exportOptions: {
                    columns: ':not(.not-export)'
                },
                customize: function (xlsx) {
                    var sheet = xlsx.xl.worksheets['sheet1.xml'];
                    $('row c', sheet).attr('s', '25');
                }
            },
            {
                extend: 'print',
                text: 'Print',
                title: title,
                exportOptions: {
                    columns: ':not(.not-export)'
                },
                customize: function (win) {
                    $(win.document.body)
                            .find('h1').css('text-align', 'center')
                            .css('font-size', '10pt')
                            .prepend(
                                    '<img src="' + baseURL + '/templates/img/top_logo.png" style="position:absolute; top:0; left:0;" />'
                                    );
                    $(win.document.body).find('table')
                            .addClass('compact')
                            .css('font-size', 'inherit')
                            .css('margin', '50px auto');
                }
            }
        ]
    });
}
