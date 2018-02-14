$(document).ready(function () {
    $('#login_form').validate({
        rules: {
            username: {
                required: true
            },
            password: {
                required: true,
                minlength: 2
            }
        },
        messages: {
            username: {
                required: "Vui lòng nhập tài khoản"
            },
            password: {
                required: "Mật khẩu không được để trống",
                minlength: "Mật khẩu phải có ít nhất 2 ký tự"
            }
        },
        submitHandler: function (form) {
            var username = $('#username').val();
            var pass = $('#password').val();
            $.ajax({
                 url: "/GUI/Check_login",
                 type: "post",
                 data: {"urs": username, "pass":pass},
                 success: function (result) {
                     var r = JSON.parse(result);
                     if (r.code == 1) {
                         window.location.href = "/GUI/Main?u=" + username;
                     }
                     else if (r.code == 0) {
                         alert(r.msg);
                     }
                 }
            });
        }
    });
});