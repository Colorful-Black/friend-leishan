using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FrontStage_ArticleAdd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
		//this.FreeTextBox1.AutoConfigure = FreeTextBoxControls.AutoConfigure.EnableAll;
		if (!this.IsPostBack)
		{
			if (Request.QueryString["id"] != null)
			{
				DataBase db = new DataBase();
				this.hdTextID.Value = Request.QueryString["id"].Trim();
				SqlParameter p = new SqlParameter("@TextID", Request.QueryString["id"].Trim());

				DataSet ds = new DataSet() ;// db.GetDataSet(("select [Text].*,ImageID,FileDirectory from [Text] left join [Image] on [Image].RelatedID=[Text].TextID where TextID=@TextID", new SqlParameter[] { p }),"Text");
				if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
				{
					this.tbTitle.Text = ds.Tables[0].Rows[0]["Title"].ToString();
					this.imgText.ImageUrl = "image/" + ds.Tables[0].Rows[0]["FileDirectory"].ToString();
					this.tbContent.Text = ds.Tables[0].Rows[0]["Details"].ToString();
					this.hdImageID.Value = ds.Tables[0].Rows[0]["ImageID"].ToString();
				}
			}
		}
	}

    protected void BtSumbit_Click(object sender, EventArgs e)
    {
        Common common = new Common();
        common.ShowMessage(this.Page, tbContent.Text);
    }
}