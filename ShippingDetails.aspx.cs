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
using System.Data.SqlClient;

public partial class user_ShippingDetails : System.Web.UI.Page
{
    DataTable dt;
    UserADO ado = new UserADO();
    Utility utils = new Utility();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GridView1.DataSource = (DataTable)Session["addtocart"];
            GridView1.DataBind();

            gettotal();
            BindDetail();
        }
    }

    public void BindDetail()
    {
        string Query = "select * from users where uid=" + Session["UID"].ToString();
        DataSet ds = new DataSet();
        ds = utils.Select(Query);

        txtFname.Text=ds.Tables[0].Rows[0]["firstname"].ToString();
        txtLname.Text=ds.Tables[0].Rows[0]["lastname"].ToString();
        txtemail.Text=ds.Tables[0].Rows[0]["mailid"].ToString();
        txtPhone.Text=ds.Tables[0].Rows[0]["phone"].ToString();
        txtMobile.Text=ds.Tables[0].Rows[0]["mobile"].ToString();
        txtAddress.Text=ds.Tables[0].Rows[0]["address"].ToString();
        
    }

    public void gettotal()
    {
        double sum = 0.00;
        int tot = 0, index=0;
        dt = (DataTable)Session["addtocart"];
        foreach (GridViewRow dr in GridView1.Rows)
        {
            TextBox lb = (TextBox)dr.Cells[1].FindControl("tb1");
            Label lbOff = (Label)dr.Cells[3].FindControl("lblOffer");
            Label lTotal = (Label)dr.Cells[4].FindControl("Label1");

            lTotal.Text = (Convert.ToDouble(lb.Text) * Convert.ToDouble(lbOff.Text.Trim())).ToString();

            sum = sum + Convert.ToDouble(lTotal.Text);
            tot = tot + Convert.ToInt16(lb.Text);

            dt.Rows[index]["Qty"] = lb.Text;
            dt.Rows[index]["Total"] = lTotal.Text;
            index++;
        }
        Session["qty"] = tot.ToString();
        Session["total"] = sum.ToString();
        lblqty.Text = "<font color=red>" + tot.ToString() + "</font>";
        lbltotal.Text = "<font color=red>" + sum.ToString() + "</font>";
    }
    protected void tb1_TextChanged(object sender, EventArgs e)
    {
        gettotal();
    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        dt = (DataTable)Session["addtocart"];
        dt.Rows[e.RowIndex].Delete();
        GridView1.DataSource = dt;
        GridView1.DataBind();
        Session["ITEMS"] = dt.Rows.Count;
        Session["addtocart"] = dt;
        gettotal();
        Response.Redirect("ShippingDetails.aspx");
    }

    
    protected void Button1_Click(object sender, EventArgs e)
    {
        string str = String.Empty;
        str = txtFname.Text + " " + txtLname.Text + ",Address : " + txtAddress.Text + ",City : " + txtCity.Text + ",State : " + txtState.Text + ",Pin Code : " + txtpincode.Text + ",Country : " + txtCountry.Text + ",E-MailId : " + txtemail.Text + ",Phone No. : " + txtPhone.Text + ",Mobile : " + txtMobile.Text;

        string str1 = String.Empty;
        str1 = txtFname.Text + " " + txtLname.Text + "<br />Address : " + txtAddress.Text + "<br />City : " + txtCity.Text + "<br />State : " + txtState.Text + "<br />Pin Code : " + txtpincode.Text + "<br />Country : " + txtCountry.Text;
        Session["ship_add1"] = str1;

        Session["shippingaddress"] = str;
        Response.Redirect("ShowPaymentDetails.aspx");

        txtFname.Text = ""; txtLname.Text = ""; txtemail.Text = ""; txtCountry.Text = ""; txtCity.Text = ""; txtAddress.Text = "";
        txtMobile.Text = ""; txtPhone.Text = ""; txtpincode.Text = ""; txtState.Text = "";

    }
}
