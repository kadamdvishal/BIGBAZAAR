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
using System.Web.Configuration;

public partial class user_ShowAddtocart : System.Web.UI.Page
{
    UserADO ado = new UserADO();
    DataTable dt;
    Utility utils = new Utility();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            utils.SetCSS(this.Master, "A4", "current");
            if (Request.QueryString["var2"] != null)
                BindGrid();
            else
            {
                GridView1.DataSource = (DataTable)Session["addtocart"];
                GridView1.DataBind();

                double sum = 0.00;
                foreach (GridViewRow dr in GridView1.Rows)
                {
                    TextBox lb = (TextBox)dr.Cells[1].FindControl("tb1");
                    Label lbOff = (Label)dr.Cells[3].FindControl("lblOffer");
                    Label lTotal = (Label)dr.Cells[4].FindControl("Label1");

                    sum = sum + Convert.ToDouble(lTotal.Text);
                }
                lbltotal.Text = "Total Amount - Rs." + sum.ToString();
            }
        }
    }

    public void BindGrid()
    {
        SqlDataReader reader;
        reader = ado.GetDataReaderByQuery("select IId,IName,MRP,Iprice from Item where IId=" + Request.QueryString["var2"].ToString());
        reader.Read();
        dt = new DataTable();
        dt.Columns.Add("IName");
        dt.Columns.Add("Qty");
        dt.Columns.Add("MRP");
        dt.Columns.Add("Iprice");
        dt.Columns.Add("total");
        dt.Columns.Add("IID");

        if (Session["addtocart"] == null)
        {
            DataRow dr = dt.NewRow();
            dr[0] = reader["IName"].ToString();
            dr[1] = 1;
            dr[2] = reader["MRP"].ToString();
            dr[3] = reader["Iprice"].ToString();
            dr[4] = reader["Iprice"].ToString();
            dt.Rows.Add(dr);
            Session["addtocart"] = dt;
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        else
        {
            dt = (DataTable)Session["addtocart"];
            DataRow dr = dt.NewRow();
            dr[0] = reader["IName"].ToString();
            dr[1] = 1;
            dr[2] = reader["MRP"].ToString();
            dr[3] = reader["Iprice"].ToString();
            dr[4] = reader["Iprice"].ToString();
            dt.Rows.Add(dr);
            Session["addtocart"] = dt;
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
	Session["ITEMS"] = dt.Rows.Count;
        //gettotal();
    }
  
    public void gettotal()
    {
        double sum = 0.00;
        int index = 0;
        dt = (DataTable)Session["addtocart"];
        foreach (GridViewRow dr in GridView1.Rows)
        {
            TextBox lb = (TextBox)dr.Cells[1].FindControl("tb1");
            Label lbOff = (Label)dr.Cells[3].FindControl("lblOffer");
            Label lTotal = (Label)dr.Cells[4].FindControl("Label1");
            lTotal.Text = (Convert.ToDouble(lb.Text) * Convert.ToDouble(lbOff.Text.Trim())).ToString();

            sum = sum + Convert.ToDouble(lTotal.Text.Trim());

            dt.Rows[index]["Qty"] = lb.Text;
            dt.Rows[index]["Total"] = lTotal.Text;
            index++;
        }
        Session["addtocart"] = dt;
        Session["ITEMS"] = dt.Rows.Count;
        GridView1.DataSource = dt;
        GridView1.DataBind();
        
        lbltotal.Text = "Total Amount - Rs." + sum.ToString();
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
        Response.Redirect("ShowAddtocart.aspx");
    }

    protected void tb1_TextChanged(object sender, EventArgs e)
    {
        gettotal();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Session["FULLNAME"] == null)
        {
            Response.Redirect("userLogin.aspx?q=1");
        }
        else
        {
            Response.Redirect("ShippingDetails.aspx");
        }
    }
}
