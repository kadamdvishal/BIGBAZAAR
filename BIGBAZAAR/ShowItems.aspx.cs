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

public partial class user_ShowItems : System.Web.UI.Page
{
    UserADO ado = new UserADO();
    Utility utils = new Utility();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
	    ViewState["CPage"] = "0";
            Bind(Request.QueryString["var"].ToString());
            
        }
    }

    public void Bind( string ID)
    {
        DataSet ds = new DataSet();
        ds = ado.Get_DataSet("select * from item where sid=" + ID);
        
        PagedDataSource obj = new PagedDataSource();
        obj.AllowPaging = true;
        obj.DataSource = ds.Tables[0].DefaultView;
        obj.PageSize = 6;
        obj.CurrentPageIndex = Convert.ToInt16(ViewState["CPage"]);
        lnkPrevious.Enabled = !obj.IsFirstPage;
        lnkNext.Enabled = !obj.IsLastPage;
        DataList1.DataSource = obj;
        DataList1.DataBind();
    }


    protected void lnkPrevious_Click(object sender, EventArgs e)
    {
        ViewState["CPage"] = (Convert.ToInt16(ViewState["CPage"]) - 1);
        Bind(Request.QueryString["var"].ToString());
    }
    protected void lnkNext_Click(object sender, EventArgs e)
    {
        ViewState["CPage"] = (Convert.ToInt16(ViewState["CPage"]) + 1);
        Bind(Request.QueryString["var"].ToString());
    }
}
