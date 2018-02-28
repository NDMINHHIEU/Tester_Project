﻿$(document).ready(function () {
    //btn edit
    $('#data-table-film').on('click', '.btn-edit', function () {
        var id_film = $(this).attr("data-val");
        $.ajax({
            url: "get_info_film",
            type: "post",
            data:{"id_film":id_film},
            success: function (result) {
                console.log(result);
                var a = JSON.parse(result);
                if (a != null) {
                    var string_typefilm = a.id_type_film;
                    var array = string_typefilm.split(',');
                    $('#sl_typefilm').select2("val", array);
                    $('#inp_hidden_id').val(id_film);
                    $('#inp_filmname').val(a.name);
                    $('.modal-title').text("Sửa phim " + a.name);
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
    $('#data-table-film').on('click', '.btn-remove', function () {
        Lobibox.confirm({
            msg: "Bạn có chắc muốn xóa ?",
            callback: function ($this, type, ev) {
                if (type === 'yes') {
                    var id_film = $(this).attr("data-val");
                    $.ajax({
                        url: "delete_film",
                        type: "post",
                        data: { "id_film": id_film },
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
                        }
                    });
                }
            }
        });
    });

    //btn save
    $('#btn_save').click(function () {
        var filename = $('#inp_filmname').val();
        var typefilm = $('#sl_typefilm').val();
        var arr = [];
        for (var i = 0; i < typefilm.length; i++) {
            arr.push(typefilm[i]);
        }
        console.log(arr);
        var id = $('#inp_hidden_id').val();
        $.ajax({
            url: "Save_film",
            type: "post",
            data: { "id_film": id, "name": filename, "type_film": JSON.stringify(arr) },
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
                $('#data-table-film').DataTable().ajax.reload();
            },
            error: function (xhr, ajaxOptions, thrownError) {
                alert(xhr.status);
                alert(thrownError);
            }
        });
    });

});