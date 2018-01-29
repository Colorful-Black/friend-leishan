using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FrontStage_ArticleAdd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //this.FreeTextBox1.AutoConfigure = FreeTextBoxControls.AutoConfigure.EnableAll;
    }

    protected void BtSumbit_Click(object sender, EventArgs e)
    {
        Common common = new Common();
        common.ShowMessage(this.Page, tbContent.Text);
    }
}