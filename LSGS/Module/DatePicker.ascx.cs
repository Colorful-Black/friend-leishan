using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class Module_DatePicker : System.Web.UI.UserControl
{
    /// <summary>
    /// 获取或设置日期值
    /// </summary>
    public string DateValue
    {
        get { return this.tbDate.Text.Trim(); }
        set { this.tbDate.Text = value; }
    }

    public int width;
    public int height;
    public int PercentW;
    public bool ReadOnly;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (width > 0)
            this.tbDate.Width = Unit.Pixel(width);
        if (height > 0)
            this.tbDate.Height = Unit.Pixel(height);
        if (PercentW > 0)
            this.tbDate.Width = Unit.Percentage(PercentW);
        this.tbDate.ReadOnly = ReadOnly;
    }
    protected void Date_PreRender(object sender, EventArgs e)
    {
        this.tbDate.Attributes.Add("onfocus", "new WdatePicker(" + (this.ReadOnly ? "{readOnly:true,lang:zh-tw}" : "") + ")");
    }
}
