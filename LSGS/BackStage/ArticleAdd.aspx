<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ArticleAdd.aspx.cs" Inherits="BackStage_ArticleAdd" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>文章添加</title>
    <script src="../JS/wangEditor.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <button id="btn1">获取html</button>
        <button id="btn2">获取text</button><br />
        <div id="ShowEditor"></div>
        <div id="Editor">
            <p>请开始输入内容</p>
        </div>
        <script>
            var E = window.wangEditor;
            var editor = new E('#Editor');
            //var editor = new E( document.getElementById('Editor') )
            //stupid git
            // 关闭粘贴样式的过滤
            editor.customConfig.pasteFilterStyle = false
            // 忽略粘贴内容中的图片
            editor.customConfig.pasteIgnoreImg = true
            // 自定义处理粘贴的文本内容
            editor.customConfig.pasteTextHandle = function (content) {
                // content 即粘贴过来的内容（html 或 纯文本），可进行自定义处理然后返回
                return content + '<p>在粘贴内容后面追加一行</p>'
            }
            editor.customConfig.debug = true;
             // editor.customConfig.uploadImgShowBase64 = true   // 使用 base64 保存图片
            editor.customConfig.uploadImgServer = 'upload_file.ashx'  // 上传图片到服务器处理的php脚本
            editor.customConfig.uploadFileName = 'file'
            editor.customConfig.uploadImgMaxLength = 10

            editor.customConfig.uploadImgHooks = {
                before: function (xhr, editor, files) {
                },
                success: function (xhr, editor, result) {
                    // 图片上传并返回结果，图片插入成功之后触发
                    // xhr 是 XMLHttpRequst 对象，editor 是编辑器对象，result 是服务器端返回的结果
                    alert("图片上传成功！");
                },
                fail: function (xhr, editor, result) {
                    // 图片上传并返回结果，但图片插入错误时触发
                    // xhr 是 XMLHttpRequst 对象，editor 是编辑器对象，result 是服务器端返回的结果
                },
                error: function (xhr, editor) {
                    // 图片上传出错时触发
                    // xhr 是 XMLHttpRequst 对象，editor 是编辑器对象
                },
                timeout: function (xhr, editor) {
                    // 图片上传超时时触发
                    // xhr 是 XMLHttpRequst 对象，editor 是编辑器对象
                }
            }

            editor.create();

            document.getElementById('btn1').addEventListener('click', function () {
                // 读取 html
                //alert(editor.txt.html())
                document.getElementById("ShowEditor").appendChild(editor.txt.html());
            }, false)

            document.getElementById('btn2').addEventListener('click', function () {
                // 读取 text
                alert(editor.txt.text())
            }, false)
        </script>
    </form>
</body>
</html>
