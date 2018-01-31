using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FrontStage_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void BtLogin_Click(object sender, EventArgs e)
    {
        Common common = new Common();
        if(TbName.Text == "admin")
        {
            if(TbPwd.Text == "admin")
            {
                string sql = "select count(*) from tbuser where username='" + TbName.Text + "' and userpwd='" + TbPwd.Text + "'";
                if((new DataBase()).GetDataSel(sql))
                {
                    common.ShowMessage(this.Page, @"友情提示,登录成功!");
                    Response.Redirect("ArticleAdd.aspx");
                }
                else
                {
                    common.ShowMessage(this.Page, "未知原因，登录失败!");
                }
            }
            else
            {
                common.ShowMessage(this.Page, "登录密码错误，实在记不得就找管理员吧。");
            }
        }
    }
}