<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="FrontStage_Search" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>搜索页面</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="TextBox1" runat="server" ></asp:TextBox>
            <p>提示信息: <span id="txtHint"></span></p>
        </div>
    </form>
</body>
    <script>
        var bt = document.getElementById("TextBox1");
        bt.onkeydown = search();
        function search() {
            var str=bt.value;
            var xmlhttp;
            if (str.length === 0) {
                document.getElementById("txtHint").innerHTML = "";
                return;
            }

            if (window.XMLHttpRequest) {
                //IE7+,Firefox,Chrome,Opera,Safari
                xmlhttp = new XMLHttpRequest();
            }
            else {
                //IE6,IE5
                xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
            }
            xmlhttp.onreadystatechange = function () {
                if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
                    document.getElementById("txtHint").innerHTML = xmlhttp.responseText;
                }
            }
            xmlhttp.open("GET", "Search.ashx?key=" + str, true);

            //var result = PinYin.GetFirstLetter(bt.value);
            //console.log(result);
        }
    </script>
</html>
