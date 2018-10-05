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

public partial class admin_billdetail : System.Web.UI.Page
{
    UserADO ado = new UserADO();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["FULLNAME"] == null)
        {
            Response.Redirect("../userLogin.aspx");
        }

        DataSet ds;
        string i = Request.QueryString["id"].ToString();
        ds = new DataSet();
        ds = ado.Get_DataSet("select o.OId BillNumber ,u.FirstName CustomerName ,o.OderDate from Users u join order_detail o on u.UId=o.UId where  o.Oid="+i);
        DetailsView1.DataSource = ds;
        DetailsView1.DataBind();
        ds.Dispose();
        ds = new DataSet();
        ds = ado.Get_DataSet("select PName as Products,Quantity,Total Price from oderdetail where OId=" + i);
        GridView1.DataSource = ds;
        GridView1.DataBind();
        ds.Dispose();
        ds = new DataSet();
        ds = ado.Get_DataSet("select p.Pmode PaymentMode,p.Cardnumber ,p.Xdate CardExpiredDate,s.shippingaddress ShippingAddress from paymentdetail p join shippingdetail s on p.OId=s.OId where p.OId="+i);
        DetailsView2.DataSource = ds;
        DetailsView2.DataBind();
    }
    protected void DetailsView1_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
    {

    }
}
