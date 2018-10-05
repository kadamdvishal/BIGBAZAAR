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

public partial class user_UserForgetPassword : System.Web.UI.Page
{
    UserADO ado = new UserADO();
    Utility utils = new Utility();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            utils.SetCSS(this.Master, "B3", "current");
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        DataSet ds = new DataSet();
        ds = ado.Get_DataSet("select password from users where userid='" + txtUID.Text.Trim()+"' and mailid='"+txtEmail.Text.Trim()+"'");

        if (ds.Tables[0].Rows.Count > 0)
        {
            smslabel1.Text = "<font color=green>Your password is :<font color=red>"+ds.Tables[0].Rows[0][0].ToString()+"</font></font>";
        }
        else
        {
            smslabel1.Text = "<font color=red>Invalid User ID/Email ID</font>";
        }
    }
}
