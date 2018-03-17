<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Article.aspx.cs" Inherits="FrontStage_Article" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>文章展示页面</title>

    <link rel="stylesheet" href="KindEditor/themes/default/default.css" />
    <link rel="stylesheet" href="KindEditor/plugins/code/prettify.css" />
    <script src="KindEditor/kindeditor-all.js" type="text/javascript"></script>
    <script charset="utf-8" src="KindEditor/lang/zh-CN.js"></script>
    <script charset="utf-8" src="KindEditor/plugins/code/prettify.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="divContent">
            <table cellpadding="0" cellspacing="0" style="width: 90%; vertical-align: top; text-align: left; margin: 0 auto;">
                <tr>
                    <td style="width: auto; padding-top: 25px; height: 400px; vertical-align: top;">
                        <p id="pTitle" style="font-size: 15px; font-weight: bold;" runat="server">
                        </p>
                        <div style="border-bottom: 1px solid #ccc; margin: 10px 0px;">
                        </div>
                        <p id="pContent" class="fontsize" runat="server">
                        </p>
                        <br />
                    </td>
                    <td style="width: 280px; padding-top: 25px; padding-left: 50px; vertical-align: top;">
                        <img src="img/news.png" style="border: none; height: 15px; vertical-align: middle; margin-right: 5px;" /><span style="font-size: 15px;">Recent Posts</span>
                        <br />
                        <asp:DataGrid ID="dgTopNews" runat="server" Width="100%" CellPadding="0" BorderStyle="None"
                            AutoGenerateColumns="False">
                            <Columns>
                                <asp:TemplateColumn>
                                    <ItemTemplate>
                                        <div style="border-bottom: solid #dedede 1px;">
                                            <a href="newsdetails.aspx?id=<%#Eval("TextID") %>" style="color: #7e7e7e; line-height: 180%; font-size: 14px;">
                                                <%#Eval("Title") %></a>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                            </Columns>
                        </asp:DataGrid>
                    </td>
                </tr>
                <tr>
                    <td style="border-bottom: solid 1px #dedede; color: #7e7e7e; border-top: solid 1px #dedede; padding-bottom: 5px; padding-top: 5px; text-align: left;">
                        <span>By Rope&nbsp;|&nbsp;<span id="spanDate" runat="server"></span></span>
                    </td>
                    <td>&nbsp;
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <br />
    </form>
</body>
</html>
