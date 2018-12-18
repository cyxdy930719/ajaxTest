<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2018/12/17
  Time: 23:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form>
    用户名：<input type="text"name="username" id="uname" class="ajaxcla"><span id="message"></span><br>
    密码：<input type="password" name="pwd" id="password" placeholder="6-18位数字或字母"><br>
    确认密码：<input type="password" name="pwds" placeholder="6-18位数字或字母" id="passwords" class="ajaxcla"><span id="pwds"></span><br>
    电话：<input type="text" id="tele"><br>
    <input type="button" value="注册" disabled="disabled" id="btn"><a href="login">已有账号，返回登陆</a>
</form>
    <script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript">
        $(function(){
            var un;
            var pwd;
            var pwds;
            var tele;
            $(".ajaxcla").blur(function(){
                un = $("#uname").val();
                pwd = $("#password").val();
                pwds = $("#passwords").val();
                tele = $("#tele").val();
                $.ajax({
                    url:"doregister",
                    type:"post",
                    data:{"username":un,"pwd":pwd,"pwds":pwds,"tele":tele},
                    success:function(result){
                        console.log(result)
                        if(result=="1"){
                            $("#message").text("可以使用")
                        }
                        if (result=="0"){
                            $("#message").text("请输入正确用户名")
                        }
                        if (result=="13"){
                            $("#message").text("可以使用");
                            $("#pwds").text("√");
                            $("#btn").attr("disabled",false)
                        }
                        if (result=="2"){
                            $("#message").text("已存在");
                        }
                        if(result=="14"){
                            $("#message").text("可以使用");
                            $("#pwds").text("输入有误")
                        }
                    }
                })
            })
        });
</script>
</body>
</html>
