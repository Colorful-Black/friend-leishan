<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="UserManage_Register" Debug="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>注册页面</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table style="width: 794px; height: 489px; " class="TableCss" align="center" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td colspan="1" style="font-size: 14pt; width: 226px">
                </td>
                <td colspan="3" style="font-size: 14pt">
                    <br />
                    用户注册</td>
                <td colspan="1" style="font-size: 14pt; width: 210px">
                </td>
            </tr>
            <tr>
                <td style="width: 226px">
                </td>
                <td style="width: 97px">
                    用户名：</td>
                <td>
                    <asp:TextBox ID="txtName" runat="server"></asp:TextBox></td>
                <td>
                    <asp:Button ID="btnTest" runat="server" Text="检测用户名" CssClass="ButtonCss" OnClick="btnTest_Click" CausesValidation="False" /></td>
                <td style="width: 210px">
                </td>
            </tr>
            <tr>
                <td style="width: 226px">
                </td>
                <td style="width: 97px">
                    用户密码：</td>
                <td>
                    <asp:TextBox ID="txtPwd" runat="server" TextMode="Password" Width="149px"></asp:TextBox></td>
                <td>
                </td>
                <td style="width: 210px">
                </td>
            </tr>
            <tr>
                <td style="width: 226px">
                </td>
                <td style="width: 97px">
                    确认密码：</td>
                <td>
                    <asp:TextBox ID="txtSPwd" runat="server" TextMode="Password" Width="149px"></asp:TextBox></td>
                <td>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPwd"
                        ControlToValidate="txtSPwd" ErrorMessage="密码输入不一致"></asp:CompareValidator></td>
                <td style="width: 210px">
                </td>
            </tr>
            <tr>
                <td style="width: 226px">
                </td>
                <td style="width: 97px">
                    真实姓名：</td>
                <td>
                    <asp:TextBox ID="txtTName" runat="server"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvTName" runat="server" ControlToValidate="txtTName"
                        ErrorMessage="真实姓名不能为空"></asp:RequiredFieldValidator></td>
                <td style="width: 210px">
                </td>
            </tr>
            <tr>
                <td style="width: 226px">
                </td>
                <td style="width: 97px">
                    性别：</td>
                <td>
                    <asp:DropDownList ID="ddlSex" runat="server">
                        <asp:ListItem>男</asp:ListItem>
                        <asp:ListItem>女</asp:ListItem>
                        <asp:ListItem>不想透露</asp:ListItem>
                    </asp:DropDownList></td>
                <td>
                </td>
                <td style="width: 210px">
                </td>
            </tr> 
            <tr>
                <td style="width: 226px">
                </td>
                <td style="width: 97px">
                </td>
                <td colspan="2" style="text-align: left">
                    &nbsp; &nbsp; &nbsp;&nbsp;
                    <asp:Button ID="btnReg" runat="server" Text="注册" CssClass="ButtonCss" OnClick="btnReg_Click" />
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
