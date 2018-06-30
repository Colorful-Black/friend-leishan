using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
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


    //js脚本
    /// <summary>
    /// JS弹出对话框
    /// </summary>
    /// <param name="指定页面"></param>
    /// <param name="弹出内容"></param>
    public void ShowMessage(System.Web.UI.Page page, string str)
    {
        ScriptManager.RegisterClientScriptBlock(page, this.GetType(), "click", "alert('" + str + "')", true);
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

    #region Oledb数据库 暂时用不上了
    //数据库用配置文件加密 web.config
    private string path = ConfigurationManager.AppSettings["OledbPath"].ToString();
    private string provide = ConfigurationManager.AppSettings["OledbConn"].ToString();

    // 本地ACCESS数据库
    public OleDbConnection GetOLEDBConn()
    {
        string oledbconn = provide + System.Web.HttpContext.Current.Server.MapPath(path);
        OleDbConnection conn = new OleDbConnection(oledbconn);
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
    #endregion

}