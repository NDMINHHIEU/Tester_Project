$(document).ready(function () {
    //btn edit
    $('#data-table-staff').on('click', '.btn-edit', function () {
        var id_staff = $(this).attr("data-val");
        $.ajax({
            url: "get_info_staff",
            type: "post",
            data: { "id_staff": id_staff },
            success: function (result) {
                console.log(result);
                var a = JSON.parse(result);
                if (a != null) {
                    var string_typestaff = a.type_staff;
                    $('#sl_typestaff').select2("val", string_typestaff);
                    $('#inp_hidden_id').val(id_staff);
                    $('#inp_staffname').val(a.name);
                    $('#inp_phone').val(a.phone);
                    $('#inp_address').val(a.address);
                    $('.modal-title').text("Sửa thông tin nhân viên  " + a.name);
                    $('#myModal').modal('show');
                }
                else {
                    Lobibox.notify('error', {
                        msg: "Không tìm thấy dữ liệu nào phù hợp"
                    });
                }
            }
        });
    });
    
    //btn delete
    $('#data-table-staff').on('click', '.btn-remove', function () {
        var id_staff = $(this).attr("data-val");
        Lobibox.confirm({
            msg: "Bạn có chắc muốn xóa ?",
            callback: function ($this, type, ev) {
                if (type === 'yes') {
                    $.ajax({
                        url: "delete_staff",
                        type: "post",
                        data: { "id_staff": id_staff },
                        success: function (result) {
                            var a = JSON.parse(result);
                            if (a.code == 0) {
                                Lobibox.notify('success', {
                                    msg: a.msg
                                });
                            }
                            else {
                                Lobibox.notify('error', {
                                    msg: a.msg
                                });
                            }
                            $('#data-table-staff').DataTable().ajax.reload();
                        }
                    });
                }
            }
        });
    });

    //btn save
    $('#btn_save').click(function () {
        var staffname = $('#inp_staffname').val();
        var typestaff = $('#sl_typestaff').val();
        var phone = $('#inp_phone').val();
        var address = $('#inp_address').val();
        if (staffname === "" || typestaff === null) {
            Lobibox.alert('warning', { msg: "Vui lòng không để thông tin phim trống" });
            return;
        }
        var id = $('#inp_hidden_id').val();
        if (id === "") {
            id = 0;
        }
        $.ajax({
            url: "Save_staff",
            type: "post",
            data: { "id_staff": id, "name": staffname, "type_staff": typestaff, "phone": phone, "address": address },
            success: function (result) {
                var a = JSON.parse(result);
                console.log(a.msg);
                if (a.code == 1) {
                    Lobibox.notify('success', {
                        msg: a.msg
                    });
                }
                else {
                    Lobibox.notify('error', {
                        msg: a.msg
                    });
                }
                $('#myModal').modal('hide');
                $('#modal1').on('hidden.bs.modal', function (e) {
                    $(this)
                      .find("input,textarea,select")
                         .val('')
                         .end()
                      .find("input[type=checkbox], input[type=radio]")
                         .prop("checked", "")
                         .end();
                });
                $("#sl_typestaff").select2("val", "");
                $('#data-table-staff').DataTable().ajax.reload();
            },
            error: function (xhr, ajaxOptions, thrownError) {
                alert(xhr.status);
                alert(thrownError);
            }
        });
    });

    //btn add
    $('#btn_add').click(function () {
        $('#myModal').modal('show');
    })
})