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

public partial class user_billgeneration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataTable dt = new DataTable();
            dt = (DataTable)Session["addtocart"];
            GridView1.DataSource = dt;
            GridView1.DataBind();
            string str = Convert.ToString(Session["userlogin"]);
               string str1 = Session["FULLNAME"].ToString();
            Label1.Text = str1;
            lblqty.Text = Session["qty"].ToString();
            lbltot.Text = Session["total"].ToString();
            o_date.Text = Session["currentdate"].ToString();
            p_card.Text = Session["cardnumber"].ToString();
            p_mode.Text = Session["paymentmode"].ToString();
            p_exp.Text = Session["xpirydate"].ToString();
            s_address.Text = Session["ship_add1"].ToString();
            b_num.Text = Session["billnum"].ToString();

        }
    }

   
}
