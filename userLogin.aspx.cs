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
using System.Drawing;

public partial class user_userLogin : System.Web.UI.Page
{
    SignIn sgn = new SignIn();
    Utility utils = new Utility();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            utils.SetCSS(this.Master, "B6", "current");
        }
    }
    protected void btnSignIn_Click(object sender, EventArgs e)
    {
        DataSet ds = new DataSet();
        ds = sgn.Select("select uid,usertype,(firstname+' '+lastname) as fullname from users where userid='" + txtUserId.Text.Trim() + "' and password='" + txtPassword.Text.Trim() + "'");
        if (ds.Tables[0].Rows.Count > 0)
        {
            sgn.UID = ds.Tables[0].Rows[0][0].ToString();
            sgn.LoginID = txtUserId.Text.Trim();
            sgn.FullName = ds.Tables[0].Rows[0][2].ToString();

            Session["UID"] = sgn.UID;
            Session["FULLNAME"] = sgn.FullName;

            if (Request.QueryString["q"] != null)
            {
                if (Request.QueryString["q"].ToString() == "1")
                {
                    Response.Redirect("ShippingDetails.aspx");
                }
            }

            if (ds.Tables[0].Rows[0]["usertype"].ToString() == "0")
            {
                Session["UTYPE"] = "0";
                Response.Redirect("Admin/Product.aspx");
            }
            else
            {
                Session["UTYPE"] = "1";
                Response.Redirect("index.aspx");
            }
        }
        else
        {
            lblMessage.Text = "<font color=red>User Id/Password is wrong.</font>";
        }
    }
}
