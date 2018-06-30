<%@ WebHandler Language="C#" Class="upload_file" %>

using System;
using System.Web;
using System.Web.Script.Serialization;

public class upload_file : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        try
        {
            // stupid git
            context.Response.ContentType = "text/text";//ContentType设置成text，方便前台接收参数，判断  
            HttpServerUtility server = context.Server;
            HttpRequest request = context.Request;
            HttpResponse response = context.Response;

            HttpPostedFile file = context.Request.Files["file"];//注意索引越界？这里file指前台name='file'的input  
            if ((file.ContentType == "image/gif" || file.ContentType == "image/jpg" || file.ContentType == "image/jpeg" || file.ContentType == "image/png") && file.ContentLength < 5 * 1024 * 1024)
            {
                string fileName = file.FileName;
                /*获取文件名： C:\Documents and Settings\Administrator\桌面\123.jpg*/
                //int a = fileName.LastIndexOf("\\") + 1;
                //int b = fileName.Length - a;
                //string fileName1 = fileName.Substring(a, b);
                //string suffix = fileName.Substring(fileName.LastIndexOf(".") + 1).ToLower();/*获取后缀名并转为小写： jpg*/
                //string time = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");//发布时间  
                string path = "Upload/";
                System.IO.DirectoryInfo dir = new System.IO.DirectoryInfo(HttpContext.Current.Server.MapPath(path));
                if(!dir.Exists)
                {
                    dir.Create();
                }

                string filePath = "Upload/" + DateTime.Now.ToString("yyyy-MM-dd") + fileName;
                //文件路径，用于a标签链接下载  
                //int bytes = file.ContentLength;//获取文件的字节大小    
                //string filter = ".xls|.xlsx"; //允许上传的格式  
                //if (!filter.Contains(suffix))
                //    ResponseWriteEnd(context, "2"); //只能允许的文件格式  
                //if (bytes > 1024 * 1024)
                //    ResponseWriteEnd(context, "3"); //文件不能大于1M    
                file.SaveAs(HttpContext.Current.Server.MapPath(filePath));
                //保存图片文件到指定路径  
                //ResponseWriteEnd(context, "0"); //上传成功    
                var serializer = new JavaScriptSerializer();
                string json = serializer.Serialize(new { errno = "0", data = new string[] { filePath } });
                context.Response.Write(json);
            }
            else
            {
                var serializer = new JavaScriptSerializer();
                string json = serializer.Serialize(new { errno = "1", data = file.FileName });
                ResponseWriteEnd(context, json);//4请选择要上传的文件    
            }
        }
        catch (Exception ex)
        {
            var serializer = new JavaScriptSerializer();
            string json = serializer.Serialize(new { errno = "1", data = "" });
            ResponseWriteEnd(context, json);
        }
    }
    private void ResponseWriteEnd(HttpContext context, string msg)
    {
        context.Response.Write(msg);
        context.Response.End();
    }
    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}