<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>雷山县&nbsp&nbsp国家税务局</title>
    <link href="CSS/main.css" rel="stylesheet" />
    <link href="Bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <script src="JS/jquery-3.1.1.min.js"></script>
    <script>
        window.onload = function load() {
            var _offset = sessionStorage.getItem("offsetTop");
            $(document).scrollTop(_offset);
        }
        $(window).scroll(function () {
            if ($(document).scrollTop() != 0) {
                sessionStorage.setItem("offsetTop", $(window).scrollTop());//保存滚动位置
            }
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="fath">
            <div id="head">
                <div id="logo">雷山县&nbsp国家税务局</div>
                <div id="search">
                    <div class="form-search">
                        <input type="text" placeholder="Type something…" class="input-medium search-query" />
                        <button type="submit" class="btn">Search</button>
                    </div>
                </div>
                <div id="login"><a href="FrontStage/Login.aspx">登录</a></div>
                <div id="menu">
                    <ul>
                        <li><a href="">通告信息</a></li>
                        <li><a href="">税务要闻</a></li>
                        <li><a href="">政治实务</a></li>
                        <li><a href="">党建动态</a></li>
                        <li><a href="">法律准则</a></li>
                        <li><a href="">国税家庭</a></li>
                    </ul>
                </div>
            </div>
            <div id="gif">滚动图片区</div>
            <div id="tongao">
                <div id="tglogo"><a href="">通告栏</a></div>
                <div id="tgtop"></div>
                <div class="tgdiv">
                    <ul>
                        <li class="tgleft"><a href=""><i class="icon-chevron-right"></i>&nbsp测试用测试用测试用测试用测试用测试用测试用测试用</a>&nbsp&nbsp&nbsp&nbsp&nbsp<a href="">2017-10-10</a></li>
                    </ul>
                </div>
                <div class="tgdiv">
                    <ul>
                        <li class="tgleft"><a href=""><i class="icon-chevron-right"></i>&nbsp测试用测试用测试用测试用测试用测试用测试用测试用</a>&nbsp&nbsp&nbsp&nbsp&nbsp<a href="">2017-10-10</a></li>
                    </ul>
                </div>
                <div class="tgdiv">
                    <ul>
                        <li class="tgleft"><a href=""><i class="icon-chevron-right"></i>&nbsp测试用测试用测试用测试用测试用测试用测试用测试用</a>&nbsp&nbsp&nbsp&nbsp&nbsp<a href="">2017-10-10</a></li>
                    </ul>
                </div>
                <div class="tgdiv">
                    <ul>
                        <li class="tgleft"><a href=""><i class="icon-chevron-right"></i>&nbsp测试用测试用测试用测试用测试用测试用测试用测试用</a>&nbsp&nbsp&nbsp&nbsp&nbsp<a href="">2017-10-10</a></li>
                    </ul>
                </div>
                <div class="tgdiv">
                    <ul>
                        <li class="tgleft"><a href=""><i class="icon-chevron-right"></i>&nbsp测试用测试用测试用测试用测试用测试用测试用测试用</a>&nbsp&nbsp&nbsp&nbsp&nbsp<a href="">2017-10-10</a></li>
                    </ul>
                </div>
            </div>

            <div id="two">
                <div id="twologo"><a href="">税务要闻</a></div>
                <div id="tgtop1"></div>
            </div>
            <div id="three">
                <div id="threelogo"><a href="">政务党建</a></div>
                <div id="tgtop2"></div>
            </div>
            <div id="four"></div>
            <div id="bottom"></div>
        </div>
    </form>
</body>
</html>
