<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ArticleAdd.aspx.cs" ValidateRequest="false" Inherits="FrontStage_ArticleAdd" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="../CSS/main.css" rel="stylesheet" />
    <link rel="stylesheet" href="KindEditor/themes/default/default.css" />
	<link rel="stylesheet" href="KindEditor/plugins/code/prettify.css" />
    <script src="KindEditor/kindeditor-all.js" type="text/javascript"></script>
    <script charset="utf-8" src="KindEditor/lang/zh-CN.js"></script>
    <script charset="utf-8" src="KindEditor/plugins/code/prettify.js"></script>
    <script>
        KindEditor.options.filterMode = false;
        KindEditor.ready(function (K) {
            var editor1 = K.create('#tbContent', {
                cssPath: 'KindEditor/plugins/code/prettify.css',
                uploadJson: 'upload_json.ashx',
                fileManagerJson: 'file_manager_json.ashx',
                allowFileManager: true,
                afterCreate: function () {
                    var self = this;
                    K.ctrl(document, 13, function () {
                        self.sync();
                        K('form[name=example]')[0].submit();
                    });
                    K.ctrl(self.edit.doc, 13, function () {
                        self.sync();
                        K('form[name=example]')[0].submit();
                    });
                }
            });
            prettyPrint();
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div>
               <%-- 类型：<br /><asp:DropDownList ID="ddlCategory" runat="server">
                </asp:DropDownList>--%>
                <br />
                标题：<asp:TextBox ID="tbTitle" runat="server" CssClass="textInput"></asp:TextBox><br />
                <br />
                缩略图：<asp:FileUpload ID="fuImage" runat="server" /><asp:Image Width="200" ID="imgText" runat="server" /><br />
                <br />
                内容：<br />
                <!-- 富文本吧编辑器 -->
                <asp:TextBox ID="tbContent" runat="server" TextMode="MultiLine" CssClass="contentInput"></asp:TextBox>
                <br />
            </div>
            <br />
            <asp:Button ID="BtSumbit" runat="server" Text="提交" CssClass="btn" OnClick="BtSumbit_Click" />
            <asp:HiddenField ID="hdTextID" runat="server" />
            <asp:HiddenField ID="hdImageID" runat="server" />
        </div>
    </form>
</body>
</html>
