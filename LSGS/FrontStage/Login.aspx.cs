using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class FrontStage_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        

    }

    protected void BtLogin_Click(object sender, EventArgs e)
    {
        Common common = new Common();
        //if(TbName.Text == "admin")
        //{
        //    if(TbPwd.Text == "admin")
        //    {
				DataBase db = new DataBase();
				SqlParameter p1 = new SqlParameter("@useraccount", TbName.Text);
				SqlParameter p2 = new SqlParameter("@userpwd", TbPwd.Text);
				string sql = "select count(*) from tbuser where Username=@useraccount";

				DataTable dt = db.SelectByParameter(sql, new SqlParameter[] { p1 }).Tables[0];

                if(dt.Rows.Count > 0)
                {
                    sql = "select count(*) from tbuser where Username=@useraccount and UserPWD=@userpwd";
                    dt = db.SelectByParameter(sql, new SqlParameter[] { p1, p2 }).Tables[0];
                    if (dt.Rows.Count > 0)
                    {
                        common.ShowMessage(this.Page, @"友情提示,登录成功!");
                        Response.Redirect("ArticleAdd.aspx");
                    }
                }
                else
                {
                    common.ShowMessage(this.Page, "未知原因，登录失败!");
                }
        //    }
        //    else
        //    {
        //        common.ShowMessage(this.Page, "登录密码错误，实在记不得就找管理员吧。");
        //    }
        //}
    }
}