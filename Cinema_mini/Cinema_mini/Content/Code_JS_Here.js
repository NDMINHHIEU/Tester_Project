$(document).ready(function () {
    $('#btn_login').click(function () {
        var usrname = $('#username').val();
        var password = $('#password').val();
        $.ajax({
            url: "GUI/Main/",
            type: "post",
            data: { "urs": usrname, "pass": password },
            success: function (result) {
                window.location.href = "GUI/Main/";
            }
        });
    });
});