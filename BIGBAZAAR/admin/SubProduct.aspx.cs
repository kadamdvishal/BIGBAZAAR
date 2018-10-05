using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


public partial class SubProduct : System.Web.UI.Page
{
    UserADO ado = new UserADO();
    Utility utils = new Utility();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["FULLNAME"] == null)
        {
            Response.Redirect("../userLogin.aspx");
        }
        if (!IsPostBack)
        {
            utils.SetCSS(Master, "adMenu2", "current");
            utils.BindDropDownList("select * from product", "pname", "pid", ddlProduct);
            BindGrid();
        }
    }

    public void BindGrid()
    {
        string Query = @"SELECT     dbo.Product.PName, dbo.SubProduct.SId, dbo.SubProduct.PId, dbo.SubProduct.Sname, dbo.SubProduct.SDescription
FROM         dbo.Product INNER JOIN
                      dbo.SubProduct ON dbo.Product.PId = dbo.SubProduct.PId";
        gvSubProduct.DataSource = ado.Get_DataSet(Query);
        gvSubProduct.DataBind();
    }
    protected void gvSubProduct_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvSubProduct.PageIndex = e.NewPageIndex;
        BindGrid();
    }

    protected void gvSubProduct_RowEditing(object sender, GridViewEditEventArgs e)
    {
        try
        {
            gvSubProduct.EditIndex = e.NewEditIndex;
            DataSet ds = new DataSet();
            string PID = gvSubProduct.DataKeys[gvSubProduct.EditIndex].Value.ToString();
            ViewState["SID"] = PID;
            ds = ado.Get_DataSet("select pid,sname,sdescription from subproduct where sid=" + PID);
            if (ds.Tables[0].Rows.Count > 0)
            {
                ddlProduct.SelectedValue = ds.Tables[0].Rows[0]["pid"].ToString();
                txtSubProduct.Text = ds.Tables[0].Rows[0]["sname"].ToString();
                txtDescription.Text = ds.Tables[0].Rows[0]["sdescription"].ToString();
            }
            btnSubmit.Text = "Update";
            BindGrid();
        }
        catch (Exception ex)
        {
            lblMessage.Text = "<font color=red>" + ex.Message + "</font>";
        }
    }

    protected void gvSubProduct_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string pid = gvSubProduct.DataKeys[e.RowIndex].Value.ToString();
        ado.ExecuteNonQueryByQuery("delete from subproduct where sid=" + pid);
        BindGrid();
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        int result = 0;
       
        if (btnSubmit.Text.ToLower() == "submit")
        {
            SqlParameter[] Param ={
                    new SqlParameter("@SID","0"),
                    new SqlParameter("@PID",ddlProduct.SelectedValue.ToString()),
                    new SqlParameter("@SNAME",txtSubProduct.Text.Trim()),
                    new SqlParameter("@SDESCRIPTION",txtDescription.Text.Trim())
                };
            SqlParameter[] OutputParam ={
                    new SqlParameter("@RETURNVALUE",SqlDbType.Int)
                };

            result = ado.Return_Parameter_NonExecuteQuery("SUB_PRODUCT_INS_UPDATE", Param, OutputParam);
            //result = ado.ExecuteNonQueryByQuery("insert into subproduct(pid,sname,sdescription) values(" + ddlProduct.SelectedValue.ToString() + ",'" + txtSubProduct.Text.Trim() + "','" + txtDescription.Text.Trim() + "')");
            //flag = 1;
        }
        else
        {
            SqlParameter[] Param ={
                    new SqlParameter("@SID",ViewState["SID"].ToString()),
                    new SqlParameter("@PID",ddlProduct.SelectedValue.ToString()),
                    new SqlParameter("@SNAME",txtSubProduct.Text.Trim()),
                    new SqlParameter("@SDESCRIPTION",txtDescription.Text.Trim())
                };
            SqlParameter[] OutputParam ={
                    new SqlParameter("@RETURNVALUE",SqlDbType.Int)
                };

            result = ado.Return_Parameter_NonExecuteQuery("SUB_PRODUCT_INS_UPDATE", Param, OutputParam);

            //result = ado.ExecuteNonQueryByQuery("update subproduct set sname='" + txtSubProduct.Text.Trim() + "',sdescription='" + txtDescription.Text.Trim() + "',pid='" + ddlProduct.SelectedValue.Trim() + "' where sid='" + ViewState["SID"].ToString() + "'");
            //flag = 2;
            ViewState["SID"] = null;
            ClearControl();
            btnSubmit.Text = "Submit";
        }
        if (result == 0)
        {
            lblMessage.Text = "<font color=red>Some error has occurred.</font>";
        }
        else if (result == 1)
                lblMessage.Text = "<font color=green>SubProduct saved successfully.</font>";
        else if (result == 2)
                lblMessage.Text = "<font color=green>SubProduct updated successfully.</font>";

        ClearControl();
        BindGrid();
        
    }

    public void ClearControl()
    {
        txtDescription.Text = "";
        txtSubProduct.Text = "";
        ddlProduct.SelectedIndex = 0;
    }
}
