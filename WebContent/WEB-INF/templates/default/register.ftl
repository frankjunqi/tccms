<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>AdminLTE 2 | Registration Page</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.5 -->
    <link rel="stylesheet" href="${Domain.base}/bootstrap/css/bootstrap.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="${Domain.base}/dist/css/AdminLTE.min.css">
    <!-- iCheck -->
    <link rel="stylesheet" href="${Domain.base}/plugins/iCheck/square/blue.css">
    <!-- jQuery 2.1.4 -->
    <script src="${Domain.base}/plugins/jQuery/jQuery-2.1.4.min.js"></script>
    <!-- Bootstrap 3.3.5 -->
    <script src="${Domain.base}/bootstrap/js/bootstrap.min.js"></script>
    <!-- iCheck -->
    <script src="${Domain.base}/plugins/iCheck/icheck.min.js"></script>
</head>
<body class="hold-transition register-page">
<div class="register-box">
    <div class="register-logo">
        <a><b>TC-PDC</b>为极致而生</a>
    </div>

    <div class="register-box-body">
        <p class="login-box-msg">Register a new membership</p>

        <form id="registeradd" action="" method="post" role="form">
            <div class="form-group has-feedback">
                <input id="account" name="account" type="text" class="form-control" placeholder="Full name">
                <span class="glyphicon glyphicon-user form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input id="email" name="email" type="email" class="form-control" placeholder="Email">
                <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input id="password" name="password" type="password" class="form-control" placeholder="Password">
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input id="repassword" type="password" class="form-control" placeholder="Retype password">
                <span class="glyphicon glyphicon-log-in form-control-feedback"></span>
            </div>
            <div class="row">
                <div class="col-xs-8">
                    <div class="checkbox icheck">
                        <label>
                            <input type="checkbox"> I agree to the <a href="#">terms</a>
                        </label>
                    </div>
                </div>
                <!-- /.col -->
                <div class="col-xs-4">
                    <button type="button" class="btn btn-primary btn-block btn-flat"
                            onclick='submitUser("${Domain.base}/client/register/add")'>Register
                    </button>
                </div>
                <!-- /.col -->
            </div>
        </form>

        <a href="${Domain.base}/client/login" class="text-center">I already have a membership</a>
    </div>
    <!-- /.form-box -->
</div>
<!-- /.register-box -->
<script>
    $(function () {
        $('input').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%' // optional
        });
    });

    // 做表单的验证
    function checkInput() {
        if ($("#account").val() == "") {
            alert("用户名不能为null");
            return false;
        }
        if ($("#email").val() == "") {
            alert("邮箱不能为null");
            return false;
        }
        if ($("#password").val() == "") {
            alert("密码不能为null");
            return false;
        }
        if ($("#repassword").val() == "") {
            alert("密码不能为null");
            return false;
        }
        if ($("#password").val() != $("#repassword").val()) {
            alert("密码不一致，请仔细检查.");
            return false;
        }
        return true;
    }

    function submitUser(actionname) {
        if (!checkInput()) {
            return;
        }
        // 提示框
        var result = confirm('默认权限只能是update & insert，无delete权限，如需开通，请联系俞锦星.');
        if (result) {
            // 执行action
            $("#registeradd").attr("action", actionname).submit();
        } else {

        }

    }

</script>
</body>
</html>
