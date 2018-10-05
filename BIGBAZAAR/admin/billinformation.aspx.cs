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


public partial class admin_billinformation : System.Web.UI.Page
{
    UserADO ado = new UserADO();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["FULLNAME"] == null)
        {
            Response.Redirect("../userLogin.aspx");
        }
        if (!IsPostBack)
        {
            CalendarExtender1.SelectedDate = DateTime.Now;
            CalendarExtender2.SelectedDate = DateTime.Now;
            TextBox2.Text = DateTime.Now.ToString("dd-MMM-yyyy");
            TextBox1.Text = DateTime.Now.ToString("dd-MMM-yyyy");
            datafill();
        }
    }

    public void datafill()
    {
        DataSet ds = new DataSet();
        DateTime dt = new DateTime();

        dt = Convert.ToDateTime(TextBox2.Text);
        DateTime dt1 = dt.AddDays(1);
        ds = ado.Get_DataSet("select o.OId ,u.UserId ,u.FirstName ,o.OderDate from Users u join order_detail o on u.UId=o.UId  where  OderDate between '" + TextBox1.Text + "' and '" + dt1.ToString() + "'");
        GridView1.DataSource = ds;
        GridView1.DataBind();
        ViewState["billdata"] = ds;

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        datafill();
    }

    protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        int i = Convert.ToInt32(e.NewSelectedIndex);
        DataKey dk = GridView1.DataKeys[i];
        string str = dk.Values[0].ToString();
        Response.Redirect("billdetail.aspx?id=" + str + "");
    }
}
