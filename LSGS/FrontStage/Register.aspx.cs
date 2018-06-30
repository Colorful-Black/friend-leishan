using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

public partial class UserManage_Register : System.Web.UI.Page
{
    //UserManage usermanage = new UserManage();
    //ImageManage imagemanage = new ImageManage();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            
        }
    }
    protected void btnTest_Click(object sender, EventArgs e)
    {
        if (txtName.Text == string.Empty)
        {
            Response.Write("<script language=javascript>alert('用户名不能为空！')</script>");
		}
		else
		{
			Common myclass = new Common();
			string UserName = txtName.Text;
			DataBase db = new DataBase();
			if (db.ReName(UserName))
			{
				myclass.ShowMessage(this.Page, "该用户已经存在！");
				txtName.Text = string.Empty;
				txtName.Focus();
			}
			else
			{
				myclass.ShowMessage(this.Page, "该用户尚未注册，可以使用.");
			}
		}
	}
    protected void btnSelDate_Click(object sender, EventArgs e)
    {
        //calDate.Visible = true;
    }
    protected void calDate_SelectionChanged(object sender, EventArgs e)
    {
        //txtBirthday.Text = calDate.SelectedDate.ToShortDateString();
        //calDate.Visible = false;
    }
    protected void btnReg_Click(object sender, EventArgs e)
    {
        if (txtName.Text == string.Empty)
        {
            Response.Write("<script language=javascript>alert('用户名不能为空！')</script>");
        }
		else
		{
			DataBase db = new DataBase();
			Common myclass = new Common();
			SqlParameter p1 = new SqlParameter("@userid", Guid.NewGuid().ToString());
			SqlParameter p2 = new SqlParameter("@useraccount", this.txtName.Text);
			SqlParameter p3 = new SqlParameter("@userpwd", this.txtSPwd.Text);

			string error = db.UpdateByParameter("INSERT INTO tbuser(userid,useraccount,userpwd,username,grade,isable) VALUES(@userid,@useraccount,@userpwd,@useraccount,1,1)", new SqlParameter[] { p1, p2, p3 });
			if(error == "")
			{
				myclass.ShowMessage(this.Page, "添加成功,完成注册");
			}
			else
			{
				myclass.ShowMessage(this.Page, "注册失败,原因:" + error);
			}
		}
    }
    protected void ddlPhoto_SelectedIndexChanged(object sender, EventArgs e)
    {
        //imagemanage.PhotoID = ddlPhoto.SelectedValue;
        //imgPhoto.ImageUrl = imagemanage.FindPhotoByID(imagemanage, "tb_Image").Tables[0].Rows[0][1].ToString();
    }
}
