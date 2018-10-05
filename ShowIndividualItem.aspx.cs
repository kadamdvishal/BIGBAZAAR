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

public partial class user_ShowIndividualItem : System.Web.UI.Page
{
    UserADO ado = new UserADO();
    Utility utils = new Utility();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Bind(Request.QueryString["var1"].ToString());
            ViewState["CPage"] = "0";
        }
    }

    public void Bind(string ID)
    {
        DataSet ds = new DataSet();
        ds = ado.Get_DataSet("select * from item where iid=" + ID);

        //PagedDataSource obj = new PagedDataSource();
       // obj.AllowPaging = true;
        //obj.DataSource = ds.Tables[0].DefaultView;
        //obj.PageSize = 6;
        //obj.CurrentPageIndex = Convert.ToInt16(ViewState["CPage"]);
        //lnkPrevious.Enabled = !obj.IsFirstPage;
        //lnkNext.Enabled = !obj.IsLastPage;
        //FormView1.DataSource = obj;
	FormView1.DataSource = ds;
        FormView1.DataBind();
    }

    protected void btnAddToCart_Click(object sender, EventArgs e)
    {
        Response.Redirect("ShowAddtocart.aspx?var2=" + Request.QueryString["var1"].ToString());
    }
}
