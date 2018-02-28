$(document).ready(function () {
    //add new ticket
    $('#data-table-ticket').on('click', '.btn-remove', function () {
        Lobibox.confirm({
            msg: "Bạn có chắc muốn xóa ?",
            callback: function ($this, type, ev) {
                if (type === 'yes') {
                    var id_tick = $(this).attr("data-val");
                    $.ajax({
                        url: "delete_ticket",
                        type: "post",
                        data: { "id_ticket": id_tick },
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
});