$(document).ready(function () {
    //btn edit
    $('#data-table-pop').on('click', '.btn-edit', function () {
        var id_pop = $(this).attr("data-val");
        $.ajax({
            url: "get_info_pop",
            type: "post",
            data: { "id_pop": id_pop },
            success: function (result) {
                console.log(result);
                var a = JSON.parse(result);
                if (a != null) {
                    $('#inp_hidden_id').val(id_pop);
                    $('#inp_popname').val(a.name);
                    $('#inp_popammount').val(a.ammount);
                    $('#txt_des').val(a.description);
                    $('.modal-title').text("Sửa thực phẩm " + a.name);
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
    $('#data-table-pop').on('click', '.btn-remove', function () {
        var id_pop = $(this).attr('data-val');
        console.log(id_pop);
        Lobibox.confirm({
            msg: "Bạn có chắc muốn xóa ?",
            callback: function ($this, type, ev) {
                if (type === 'yes') {
                    $.ajax({
                        url: "delete_pop",
                        type: "post",
                        data: { "id_pop": id_pop },
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
                            $('#data-table-pop').DataTable().ajax.reload();
                        }
                    });
                }
            }
        });
    });

    //btn save
    $('#btn_save').click(function () {
        var popname = $('#inp_popname').val();
        var ammount = $('#inp_popammount').val();
        var desc = $('#txt_des').val();
        if (popname === "") {
            Lobibox.alert('warning', { msg: "Vui lòng không để thông tin trống" });
            return;
        }
        var id = $('#inp_hidden_id').val();
        if (id === "") {
            id = 0;
        }
        $.ajax({
            url: "Save_pop",
            type: "post",
            data: { "id_pop": id, "name": popname, "des": desc, "amm": ammount },
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
                $('#data-table-pop').DataTable().ajax.reload();
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