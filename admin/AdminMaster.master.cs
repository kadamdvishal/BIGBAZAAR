using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["FULLNAME"] == null)
        {
            Response.Redirect("../userlogin.aspx");
        }
        
        if(!IsPostBack)
        {
            lblUser.Text = "<font color=green>Welcome :" + Session["FULLNAME"].ToString() + "</font>";
        }
    }

    protected void lnkLog_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Session.Clear();
        Response.Redirect("../index.aspx");
    }
}
