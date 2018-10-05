using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.HtmlControls;

public partial class admin_Default : System.Web.UI.Page
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
            utils.SetCSS(Master, "adMenu1", "current");
            BindGrid();
        }

    }

    public void BindGrid()
    {
        gvProduct.DataSource = ado.Get_DataSet("select * from product");
        gvProduct.DataBind();
    }

    protected void Submit_Click(object sender, EventArgs e)
    {
        int result = 0;
        if (btnSubmit.Text.ToLower() == "submit")
        {
            SqlParameter[] Param ={
                    new SqlParameter("@PID","0"),
                    new SqlParameter("@PNAME",txtProductName.Text.Trim()),
                    new SqlParameter("@PDESCRIPTION",txtDescription.Text.Trim())
                };
            SqlParameter[] OutputParam ={
                    new SqlParameter("@RETURNVALUE",SqlDbType.Int)
                };

            result = ado.Return_Parameter_NonExecuteQuery("PRODUCT_INS_UPDATE", Param, OutputParam);
        }
        else if (btnSubmit.Text.ToLower() == "update")
        {
            SqlParameter[] Param ={
                    new SqlParameter("@PID",ViewState["PID"].ToString()),
                    new SqlParameter("@PNAME",txtProductName.Text.Trim()),
                    new SqlParameter("@PDESCRIPTION",txtDescription.Text.Trim())
                };
            SqlParameter[] OutputParam ={
                    new SqlParameter("@RETURNVALUE",SqlDbType.Int)
                };

            result = ado.Return_Parameter_NonExecuteQuery("PRODUCT_INS_UPDATE", Param, OutputParam);
            ViewState["PID"] = null;
            ClearControl();
            btnSubmit.Text = "Submit";
        }
        if (result == 0)
            lblMessage.Text = "<font color=red>Some error has occurred.</font>";
        else if (result == 1)
            lblMessage.Text = "<font color=green>Product saved successfully.</font>";
        else if (result == 2)
            lblMessage.Text = "<font color=green>Product updated successfully.</font>";

        ClearControl();
        BindGrid();
    }

    protected void gvProduct_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string pid = gvProduct.DataKeys[e.RowIndex].Value.ToString();
        ado.ExecuteNonQueryByQuery("delete from product where pid=" + pid);
        BindGrid();
    }

    protected void gvProduct_RowEditing(object sender, GridViewEditEventArgs e)
    {
        try
        {
            gvProduct.EditIndex = e.NewEditIndex;
            DataSet ds = new DataSet();
            string PID = gvProduct.DataKeys[gvProduct.EditIndex].Value.ToString();
            ViewState["PID"] = PID;
            ds = ado.Get_DataSet("select pname,pdescription from product where pid=" + PID);
            if (ds.Tables[0].Rows.Count > 0)
            {
                txtProductName.Text = ds.Tables[0].Rows[0]["pname"].ToString();
                txtDescription.Text = ds.Tables[0].Rows[0]["pdescription"].ToString();
            }
            btnSubmit.Text = "Update";
            BindGrid();
        }
        catch (Exception ex)
        {
            lblMessage.Text = "<font color=red>" + ex.Message + "</font>";
        }
    }

    public void ClearControl()
    {
        txtDescription.Text = "";
        txtProductName.Text = "";
    }

    protected void gvProduct_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvProduct.PageIndex = e.NewPageIndex;
        BindGrid();
    }
}
