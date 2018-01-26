﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="FrontStage_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>雷山县&nbsp国家税务局登录页面</title>
    <script>
        function SumbitCheck() {
            var name = document.getElementById("TbName");
            var pwd = document.getElementById("TbPwd");
            if (name.value === "") {
                alert("请输入账号!");
                return false;
            }
            else if (pwd.value === "") {
                alert("请输入密码!");
                return false;
            }
            else {
                if (name.value === "admin" && pwd.value === "admin")
                    return true;
                else {
                    alert("账号或密码错误！");
                }
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="TbName" runat="server"></asp:TextBox><br />
            <asp:TextBox ID="TbPwd" runat="server"></asp:TextBox><br />
            <asp:Button ID="BtLogin" runat="server" Text="登录" OnClientClick="return SumbitCheck()" OnClick="BtLogin_Click" />
            <asp:LinkButton ID="LinkButton1" runat="server"><span style="color:red;">忘记密码</span></asp:LinkButton>
            <a href="../Default.aspx">返回首页</a>
        </div>
    </form>
</body>
</html>
