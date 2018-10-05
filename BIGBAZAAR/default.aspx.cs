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

public partial class _Default : System.Web.UI.Page
{
    Utility utils = new Utility();
    protected void Page_Load(object sender, EventArgs e)
    {
     //   Label1.Text = Session["abc"].ToString();

        if (!IsPostBack)
        {
            utils.SetCSS(this.Master, "A1", "current");
        }
    }

    

}
