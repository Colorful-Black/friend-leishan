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
	public string error = "";
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
			return new SqlConnection(ConfigurationManager.AppSettings["SqlConnect"].ToString());
		}
		catch (Exception ex)
		{
			return null;
		}
	}

	public bool GetDataSel(string sql)
	{
		SqlConnection conn = GetSQLConn();
		try
		{
			conn.Open();
			SqlCommand cmd = new SqlCommand(sql, conn);
			return (int)cmd.ExecuteScalar() > 0;
		}
		catch (Exception)
		{
			return false;
		}
		finally
		{
			conn.Close();
			conn.Dispose();
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
		SqlConnection conn = GetSQLConn();
		try
		{
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
		finally
		{
			conn.Close();
			conn.Dispose();
		}
	}


	/// <summary>a
	/// 重名检测
	/// </summary>
	/// <param name="name">用户名</param>
	/// <returns>是否重名</returns>
	public bool ReName(string name)
	{
		SqlConnection conn = GetSQLConn();
		try
		{
			conn.Open();
			string sel = "select userid from tbUser where name='" + name + "'";
			SqlCommand sqlcmd = new SqlCommand(sel, conn);
			SqlDataReader dr = sqlcmd.ExecuteReader();
			if (dr.Read())
			{
				return false;
			}
			else
			{
				return true;
			}
		}
		catch (Exception ex)
		{
			return false;
		}
		finally
		{
			conn.Close();
			conn.Dispose();
		}
	}

	/// <summary>
	/// 执行带参数的SQL更新语句
	/// </summary>
	/// <param name="OperationSQL">待执行SQL语句</param>
	/// <param name="ps">参数对象数组</param>
	/// <returns>错误信息</returns>
	public string UpdateByParameter(string OperationSQL, SqlParameter[] ps)
	{
		SqlConnection con = GetSQLConn();
		con.Open();
		SqlTransaction st = con.BeginTransaction();
		try
		{
			SqlCommand cmd = new SqlCommand(OperationSQL, con);
			foreach (SqlParameter p in ps)
			{
				cmd.Parameters.Add(p);
			}
			cmd.Transaction = st;
			cmd.ExecuteNonQuery();
			st.Commit();
			cmd.Dispose();
			return "";
		}
		catch (Exception ex)
		{
			st.Rollback();
			return ex.Message.ToString().Replace("\r\n", "").Replace("'", "");
		}
		finally
		{
			con.Close();
			con.Dispose();
		}
	}

	/// <summary>
	/// 执行带参数的SQL查询语句
	/// </summary>
	/// <param name="SelectSQL">待执行SQL语句</param>
	/// <param name="ps">参数对象数组</param>
	/// <returns></returns>
	public DataSet SelectByParameter(string SelectSQL, SqlParameter[] ps)
	{
		SqlConnection con = GetSQLConn();
		con.Open();
		try
		{
			SqlCommand cmd = new SqlCommand(SelectSQL, con);
			foreach (SqlParameter p in ps)
			{
				cmd.Parameters.Add(p);
			}
			SqlDataAdapter sda = new SqlDataAdapter(cmd);
			DataSet ds = new DataSet();
			sda.Fill(ds);
			return ds;
		}
		catch (Exception ex)
		{
			error = ex.ToString();
			return null;
		}
		finally
		{
			con.Close();
			con.Dispose();
		}
	}
}