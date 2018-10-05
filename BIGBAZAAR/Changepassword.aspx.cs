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

public partial class user_Changepassword : System.Web.UI.Page
{
    UserADO ado = new UserADO();
    Utility utils = new Utility();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            utils.SetCSS(this.Master, "B4", "current");
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        DataSet ds = new DataSet();
        ds = ado.Get_DataSet("select uid from users where userid='" + txtUID.Text.Trim() + "' and password='" + txtOldP.Text.Trim() + "'");

        if (ds.Tables[0].Rows.Count > 0)
        {
            ado.ExecuteNonQueryByQuery("update users set password='"+txtNPass.Text.Trim()+"' where uid='"+ds.Tables[0].Rows[0][0].ToString()+"'");
            smslabel.Text = "<font color=green>Your password has been changed successfully.</font>";

        }
        else
        {
            smslabel.Text = "<font color=red>Invalid User ID/Password</font>";
        }
    }
}
