using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class UserProfile : System.Web.UI.Page
{
    UserADO ado = new UserADO();
    Utility utils = new Utility();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            utils.SetCSS(this.Master, "A3", "current");
            if (Session["UID"] != null)
                BindDetail(Session["UID"].ToString());
            else
                Response.Redirect("userlogin.aspx");
        }
    }

    protected void BindDetail(string ID)
    {
        DataSet ds = new DataSet();
        ds = ado.Get_DataSet("select * from users where uid="+ID);
        if (ds.Tables[0].Rows.Count > 0)
        {
            lblFName.Text = ds.Tables[0].Rows[0]["firstname"].ToString();
            lblMName.Text = ds.Tables[0].Rows[0]["middlename"].ToString();
            lblLName.Text = ds.Tables[0].Rows[0]["lastname"].ToString();
            lblGender.Text = ds.Tables[0].Rows[0]["gender"].ToString();
            lblMob.Text = ds.Tables[0].Rows[0]["mobile"].ToString();
            lblEmail.Text = ds.Tables[0].Rows[0]["mailid"].ToString();
            lblAEmail.Text = ds.Tables[0].Rows[0]["altmailid"].ToString();
            lblAddress.Text = ds.Tables[0].Rows[0]["Address"].ToString();
            lblPhone.Text = ds.Tables[0].Rows[0]["Phone"].ToString();
        }
    }
    protected void lnkEdit_Click(object sender, EventArgs e)
    {
        Response.Redirect("UserRegistration.aspx?Change=1");
    }
}
