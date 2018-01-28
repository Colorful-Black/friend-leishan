using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// DataBase 的摘要说明
/// </summary>
public class DataBase
{
    public DataBase()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }


    // 网络端数据库SQL
    public SqlConnection GetSQLConn()
    {
        try
        {
            //数据库用配置文件加密 web.config
            string sqlconn = ConfigurationManager.AppSettings["SqlConnect"].ToString();
            return new SqlConnection(sqlconn);
        }
        catch (Exception ex)
        {
            return null;
        }
    }

    public bool GetDataSel(string sql)
    {
        try
        {
            SqlConnection conn = GetSQLConn();
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            return cmd.ExecuteNonQuery()>0;
        }
        catch (Exception)
        {
            return false;
        }
    }

    /// <summary>
    /// 数据库执行结果
    /// </summary>
    /// <param sql="执行语句"></param>
    /// <param TableName="数据集名称"></param>
    /// <returns></returns>
    public DataSet GetDataSet(string sql, string TableName)
    {
        try
        {
            SqlConnection conn = GetSQLConn();
            conn.Open();
            SqlDataAdapter adapt = new SqlDataAdapter(sql, conn);
            DataSet ds = new DataSet();
            adapt.Fill(ds, TableName);
            conn.Close();
            return ds;
        }
        catch (Exception)
        {
            return null;
        }
    }


    /// <summary>
    /// 重名检测
    /// </summary>
    /// <param name="name">用户名</param>
    /// <returns>是否重名</returns>
    public bool ReName(string name)
    {
        SqlConnection conn = GetSQLConn();
        string sel = "select userid from tbUser where name='" + name + "'";
        SqlCommand sqlcmd = new SqlCommand(sel, conn);
        SqlDataReader dr = sqlcmd.ExecuteReader();
        if (dr.Read())
        {
            conn.Close();
            return false;
        }
        else
        {
            conn.Close();
            return true;
        }
    }


}