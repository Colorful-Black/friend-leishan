using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BackStage_UpFile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void BtUpFile_Click(object sender, EventArgs e)
    {
        try
        {
            Common myclass = new Common();
            if (FileUpload1.HasFile)
            {
                string filepath = Server.MapPath("~/Images//test/");
                string filename = DateTime.Now.ToString("yyyy-MM-dd") + FileUpload1.PostedFile.FileName;

                FileUpload1.SaveAs(filepath + filename);
                
                myclass.ShowMessage(this.Page,"上传成功!");
            }
            else
            {
                myclass.ShowMessage(this.Page, "还未选择上传文件!");
            }

        }
        catch (Exception ex)
        {
            Response.Write("error: "+ ex.Message);
        }
    }
}