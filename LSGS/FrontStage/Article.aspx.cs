using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FrontStage_Article : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.dgTopNews.DataSource = (new NetCore.DataBase("")).SelectData("select top 6 TextID,Title,CreateDate from [Text]"
               + " where [Text].PositionIndex='6842DB0C-8A95-412E-B63C-351480479C1F' order by CreateDate desc").Tables[0];
            this.dgTopNews.DataBind();

            if (Request["id"] != null)
            {
                System.Data.SqlClient.SqlParameter p = new System.Data.SqlClient.SqlParameter("@TextID", Request["id"].ToString());
                DataTable tab = (new NetCore.DataBase("")).SelectByParameter("select * from [Text] where TextID=@TextID"
                    , new System.Data.SqlClient.SqlParameter[] { p }).Tables[0];
                pTitle.InnerHtml = tab.Rows[0]["title"].ToString();
                pContent.InnerHtml = tab.Rows[0]["Details"].ToString();
                spanDate.InnerHtml = tab.Rows[0]["CreateDate"].ToString();
            }
            else
            {
                pContent.InnerHtml = "The news you scan is not exist!";
            }
        }
    }
}