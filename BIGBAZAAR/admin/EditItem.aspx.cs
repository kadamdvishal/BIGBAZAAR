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
using System.IO;

public partial class admin_ItemUpdateCont : System.Web.UI.Page
{
    Utility utils = new Utility();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["FULLNAME"] == null)
        {
            Response.Redirect("../userLogin.aspx");
        }
        
        if (!IsPostBack)
        {
            utils.SetCSS(Master, "adMenu4", "current");
            utils.BindDropDownList("select pid,pname from product", "pname", "pid", ddlProduct);
            ddlSubProduct.Items.Insert(0, new ListItem("<-SELECT->", "0"));
            
            BindGrid();
        }
    }

    public void BindGrid()
    {
        DataSet ds = new DataSet();
        string Query = "select s.IId,s.qty,sp.SName,s.IName,s.IImage,s.IDescription,s.MRP,s.Iprice from Item s inner join SubProduct sp on s.sid=sp.sid";
        ds=utils.Select(Query);

        gvItem.DataSource = ds;
        gvItem.DataBind();
    }

    protected void ddlProduct_SelectedIndexChanged(object sender, EventArgs e)
    {

        if (ddlProduct.SelectedIndex > 0)
        {
            utils.BindDropDownList("select sid,sname from subproduct where pid=" + ddlProduct.SelectedValue, "sname", "sid", ddlSubProduct);
            
        }
        else
        {
            ddlSubProduct.Items.Clear();
            ddlSubProduct.Items.Insert(0, new ListItem("<-SELECT->", "0"));
            string Query = "select s.IId,s.qty,sp.SName,s.IName,s.IImage,s.IDescription,s.MRP,s.Iprice from Item s inner join SubProduct sp on s.sid=sp.sid";
            DataSet ds = new DataSet();
            ds = utils.Select(Query);

            gvItem.DataSource = ds;
            gvItem.DataBind();
        }
        

    }
  
    protected void gvItem_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvItem.PageIndex = e.NewPageIndex;
        BindGrid();
    }
    protected void gvItem_RowEditing(object sender, GridViewEditEventArgs e)
    {
        Response.Redirect("Item.aspx?ID="+gvItem.DataKeys[e.NewEditIndex].Value.ToString());
    }
    protected void ddlSubProduct_SelectedIndexChanged(object sender, EventArgs e)
    {
        string Query = "select s.IId,s.qty,sp.SName,s.IName,s.IImage,s.IDescription,s.MRP,s.Iprice from Item s inner join SubProduct sp on s.sid=sp.sid";
        if (ddlSubProduct.SelectedIndex > 0)
        {
            Query = "select s.IId,s.qty,sp.SName,s.IName,s.IImage,s.IDescription,s.MRP,s.Iprice from Item s inner join SubProduct sp on s.sid=sp.sid where s.sid=" + ddlSubProduct.SelectedValue;
        }
        DataSet ds = new DataSet();
        ds = utils.Select(Query);

        gvItem.DataSource = ds;
        gvItem.DataBind();
    }
    protected void gvItem_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        utils.Insert("delete from item where iid=" + gvItem.DataKeys[e.RowIndex].Value.ToString());
        BindGrid();
    }
}
