using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;

/// <summary>
/// Common 的摘要说明
/// </summary>
public class Common
{
    public Common()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }   


    // 网络端数据库SQL
    public SqlConnection GetSQLConn()
    {
        string sqlconn = "Server=bds257367202.my3w.com;User Id=bds257367202;Pwd=dl439353;DataBase=bds257367202_db";
        SqlConnection conn = new SqlConnection(sqlconn);
        conn.Open();
        if (conn.State.ToString() == "Open")
        {
            //conn.Close();
            return conn;
        }
        else
        {
            //conn.Close();
            return null;
        }
    }

    //string acpath =  System.Web.HttpContext.Current.Server.MapPath("~/App_Data/test.accdb");
    //string sqlconn = "Provider=Microsoft.Ace.OLEDB.12.0;Data Source='"+acpath+"'";

    //数据库用配置文件加密 web.config
    private static string path = ConfigurationManager.AppSettings["OledbPath"].ToString();
    private static string provide = ConfigurationManager.AppSettings["OledbConn"].ToString();

    // 本地ACCESS数据库
    public OleDbConnection GetOLEDBConn()
    {
        string sqlconn = provide + System.Web.HttpContext.Current.Server.MapPath(path);
        OleDbConnection conn = new OleDbConnection(sqlconn);
        conn.Open();
        if (conn.State.ToString() == "Open")
        {
            //conn.Close();
            return conn;
        }
        else
        {
            //conn.Close();
            return null;
        }
    }

    /// <summary>
    /// JS弹出对话框
    /// </summary>
    /// <param name="指定页面"></param>
    /// <param name="弹出内容"></param>
    public void ShowMessage(System.Web.UI.Page page, string str)
    {
        ScriptManager.RegisterClientScriptBlock(page, this.GetType(), "click", "alert('" + str + "')", true);
    }

    /// <summary>
    /// 控制台输出
    /// </summary>
    /// <param name="指定页面"></param>
    /// <param name="输出内容"></param>
    public void ShowConsole(System.Web.UI.Page page, string str)
    {
        ScriptManager.RegisterClientScriptBlock(page, this.GetType(), "click", "console.log('" + str + "')", true);
    }

    /// <summary>
    /// 重名检测
    /// </summary>
    /// <param name="name">用户名</param>
    /// <returns>是否重名</returns>
    public bool ReName(string name)
    {
        string sqlconn = provide + System.Web.HttpContext.Current.Server.MapPath(path);
        OleDbConnection conn = new OleDbConnection(sqlconn);
        conn.Open();
        string sel = "select * from tbUser where UserID='" + name + "'";
        OleDbCommand cmd = new OleDbCommand(sel, conn);
        OleDbDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            return false;
        }
        else
        {
            return true;
        }
    }

    ///// <summary>
    ///// 新增操作日志
    ///// </summary>
    //public void AddOPLOG(DBControl NewControl, string name, string log)
    //{
    //    ItemOperatingLog newLog = new ItemOperatingLog();
    //    newLog.UserID = name;
    //    newLog.Time = DateTime.Now;
    //    newLog.Log = log;
    //    ACOperatingLog.Add(NewControl, newLog);
    //}

    ///// <summary>
    ///// 新增系统日志
    ///// </summary>
    //public void AddSYSLOG(DBControl NewControl, string name, string log)
    //{
    //    ItemSystemLog newLog = new ItemSystemLog();
    //    newLog.Module = name;
    //    newLog.Time = DateTime.Now;
    //    newLog.Log = log;
    //    ACSystemLog.Add(NewControl, newLog);
    //}

}
}
}