<%@ WebHandler Language="C#" Class="Search" %>

using System;
using System.Web;

public class Search : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        try
        {
            if (!string.IsNullOrEmpty(context.Request.Params["key"].ToString()))
            {
                context.Response.ContentType = "text/plain";
                context.Response.Write(new PinYin().GetFirstLetter(context.Request.Params["key"].ToString()));
            }
        }
        catch (Exception)
        {
           
        }
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}