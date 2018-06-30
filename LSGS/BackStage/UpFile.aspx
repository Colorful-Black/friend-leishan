<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UpFile.aspx.cs" Inherits="BackStage_UpFile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>文件上传</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h3><i>目前文件上传大小限制为100M</i></h3>
            <asp:FileUpload ID="FileUpload1" onchange="fileChange(this)" runat="server" />
            <asp:Button ID="BtUpFile" runat="server" Text="上传" OnClick="BtUpFile_Click" />
        </div>
    </form>
    <script>
        var isIE = /msie/i.test(navigator.userAgent) && !window.opera; 
        function fileChange(target) {
            var fileSize = 0;
            if (isIE && !target.files) {
                var filePath = target.value;
                var fileSystem = new ActiveXObject("Scripting.FileSystemObject");
                var file = fileSystem.GetFile(filePath);
                fileSize = file.Size;
            } else {
                fileSize = target.files[0].size;
            }
            var size = fileSize / 1024;
            if (size > 2000) {
                alert("附件不能大于200M");
                target.value = "";
                return
            }

            var name = target.value;
            var fileName = name.substring(name.lastIndexOf(".") + 1).toLowerCase();
            if (fileName != "jpg" && fileName != "jpeg" && fileName != "pdf" && fileName != "png" && fileName != "dwg" && fileName != "gif") {
                alert("请选择规定内的文件上传！");
                target.value = "";
                return
            }
        } 
    </script>
</body>
</html>
