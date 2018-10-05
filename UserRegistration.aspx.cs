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

public partial class user_UserRegistration : System.Web.UI.Page
{
    string flag;
    UserADO ado = new UserADO();
    Utility utils = new Utility();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            utils.SetCSS(this.Master, "B5", "current");
            if (Request.QueryString["Change"] != null)
            {
                flag = Request.QueryString["Change"].ToString();
                if (flag == "1")
                {
                    DataSet ds = new DataSet();
                    ds = ado.Get_DataSet("select * from users where uid='" + Session["UID"].ToString() + "'");
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        logDetail.Visible = false;
                        btnSubmit.Text = "Update";
                        txtFirstName.Text = ds.Tables[0].Rows[0]["FirstName"].ToString();
                        txtMName.Text = ds.Tables[0].Rows[0]["MiddleName"].ToString();
                        txtLName.Text = ds.Tables[0].Rows[0]["LastName"].ToString();
                        txtEmail.Text = ds.Tables[0].Rows[0]["mailid"].ToString();
                        txtAEmail.Text = ds.Tables[0].Rows[0]["altmailid"].ToString();

                        txtMobile.Text = ds.Tables[0].Rows[0]["mobile"].ToString();
                        txtPhone.Text = ds.Tables[0].Rows[0]["phone"].ToString();
                        if (ds.Tables[0].Rows[0]["gender"].ToString().Trim().ToLower() == "male")
                            rdGender.SelectedIndex = 0;
                        else if (ds.Tables[0].Rows[0]["gender"].ToString().Trim().ToLower() == "female")
                            rdGender.SelectedIndex = 1;
                        txtAddress.Text = ds.Tables[0].Rows[0]["address"].ToString();
                    }
                }
            }
        }
    }



    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string Gender="Female";
        string Query="";
        int flag = 0;
        if(rdGender.SelectedIndex==0)
            Gender="Male";
        if(Request.QueryString["Change"]==null)
            Query = "insert into users (FirstName,MiddleName,LastName,Gender,UserID,Password,Address,Mobile,Phone,MailId,AltMailID,UserType) "+
            " values('" + txtFirstName.Text.Trim() + "','" + txtMName.Text.Trim() + "','" + txtLName.Text.Trim() + "','" + Gender + "','"+txtUserID.Text.Trim()+"','"+txtPass.Text.Trim()+"','"+txtAddress.Text.Trim()+"','"+txtMobile.Text.Trim()+"','"+txtPhone.Text.Trim()+"','"+txtEmail.Text.Trim()+"','"+txtAEmail.Text.Trim()+"',1)";
        else if (Request.QueryString["Change"].ToString() == "1")
        {
            Query = "update users set FirstName='" + txtFirstName.Text.Trim() + "',MiddleName='" + txtMName.Text.Trim() + "',LastName='" + txtLName.Text.Trim() + "',Gender='" + Gender + "',Address='" + txtAddress.Text.Trim() + "',Mobile='" + txtMobile.Text.Trim() + "',Phone='" + txtPhone.Text.Trim() + "',MailId='" + txtEmail.Text.Trim() + "',AltMailID='" + txtAEmail.Text.Trim() + "' where uid=" + Session["UID"].ToString();
            flag = 1;
        }
        int result= ado.ExecuteNonQueryByQuery(Query);
        if (result > 0)
        {
            if (flag == 0)
            {
                lblMessage.Text = "<font color=green>Your registration has been successfully done.</font>";
            }
            else
            {
                lblMessage.Text = "<font color=green>Your profile has been updated successfully.</font>";
                Response.Redirect("UserProfile.aspx");
            }
            ClearControls();
        }
        else
            lblMessage.Text = "<font color=red>Some error has occurred.</font>";
    }

    protected void ClearControls()
    {
        txtFirstName.Text = "";
        txtMobile.Text = "";
        txtMName.Text = "";
        txtLName.Text = "";
        txtPhone.Text = "";
        txtAddress.Text = "";
        txtAEmail.Text = "";
        txtCPass.Text = "";
        txtEmail.Text = "";
        txtPass.Text = "";
        txtUserID.Text = "";
    }
}
