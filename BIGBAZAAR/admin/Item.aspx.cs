using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class admin_Item : System.Web.UI.Page
{
    Utility utils = new Utility();
    UserADO ado = new UserADO();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["FULLNAME"] == null)
        {
            Response.Redirect("../userLogin.aspx");
        }

        if (!IsPostBack)
        {
            utils.SetCSS(Master, "adMenu3", "current");
            utils.BindDropDownList("select pid,pname from product", "pname", "pid", ddlProduct);
            ddlSubProduct.Items.Insert(0, new ListItem("<-SELECT->", "0"));
           
            if (Request.QueryString["ID"] != null)
            {
                btnSubmit.Text = "Update";
                DataSet ds = new DataSet();
                ds = ado.Get_DataSet("select i.*,p.pid from ITEM i inner join subproduct s on i.sid=s.sid inner join product p on s.pid=p.pid where i.iid=" + Request.QueryString["ID"].ToString());
                if (ds.Tables[0].Rows.Count > 0)
                {
                    ddlProduct.SelectedValue = ds.Tables[0].Rows[0]["pid"].ToString();
                    utils.BindDropDownList("select sid,sname from subproduct where pid=" + ddlProduct.SelectedValue, "sname", "sid", ddlSubProduct);
                    ddlSubProduct.SelectedValue = ds.Tables[0].Rows[0]["sid"].ToString();
                    txtItem.Text = ds.Tables[0].Rows[0]["Iname"].ToString();
                    txtDescription.Text = ds.Tables[0].Rows[0]["Idescription"].ToString();
                    txtMPrice.Text = ds.Tables[0].Rows[0]["mrp"].ToString();
                    txtPrice.Text = ds.Tables[0].Rows[0]["iprice"].ToString();
                    txtQuantity.Text = ds.Tables[0].Rows[0]["qty"].ToString();
                    //img1.ImageUrl= ds.Tables[0].Rows[0]["iimage"].ToString();
                }
            }
        }
    }
    protected void ddlProduct_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlProduct.SelectedIndex > 0)
        {
            utils.BindDropDownList("select sid,sname from subproduct where pid="+ddlProduct.SelectedValue, "sname", "sid", ddlSubProduct);
        }
        else
        {
            ddlSubProduct.Items.Clear();
            ddlSubProduct.Items.Insert(0, new ListItem("<-SELECT->", "0"));
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        int result = 0;
        try
        {
            string ppath =@"~\picture\"+ Path.GetFileName(FileUpload1.PostedFile.FileName);
            //string str = @"~\picture\" + ppath;
            int flag = 0;
            if (btnSubmit.Text.ToLower() == "submit")
            {
                SqlParameter[] Param ={
                    new SqlParameter("@IID","0"),
                    new SqlParameter("@SID",ddlSubProduct.SelectedValue),
                    new SqlParameter("@INAME",txtItem.Text.Trim()),
                    new SqlParameter("IDESCRIPTION",txtDescription.Text.Trim()),
                    new SqlParameter("@MRP",txtMPrice.Text.Trim()),
                    new SqlParameter("@IPRICE",txtPrice.Text.Trim()),
                    new SqlParameter("@IIMAGE", ppath ),
                    new SqlParameter("@QTY",txtQuantity.Text.Trim())
                };
                SqlParameter[] OutputParam ={
                    new SqlParameter("@RETURNVALUE",SqlDbType.Int)
                };

                if (File.Exists(Server.MapPath(ppath)) == true)
                {
                    smsLable.Text = "Image already exist";
                }
                else
                {
                    FileUpload1.PostedFile.SaveAs(Server.MapPath(ppath));
                    //utils.Insert(Query);
                    result = ado.Return_Parameter_NonExecuteQuery("ITEM_INS_UPDATE", Param, OutputParam);
                    flag = 1;
                }
            }
            else
            {
                int flagupdate = 0;
                if (ppath == @"~\picture\")
                {
                    ppath = ado.Get_DataSet("select iimage from item where iid=" + Request.QueryString["ID"].ToString()).Tables[0].Rows[0][0].ToString();
                    flagupdate = 1;
                }
                    SqlParameter[] Param ={
                    new SqlParameter("@IID",Request.QueryString["ID"].ToString()),
                    new SqlParameter("@SID",ddlSubProduct.SelectedValue),
                    new SqlParameter("@INAME",txtItem.Text.Trim()),
                    new SqlParameter("IDESCRIPTION",txtDescription.Text.Trim()),
                    new SqlParameter("@MRP",txtMPrice.Text.Trim()),
                    new SqlParameter("@IPRICE",txtPrice.Text.Trim()),
                    new SqlParameter("@IIMAGE", ppath ),
                    new SqlParameter("@QTY",txtQuantity.Text.Trim())
                };
                    SqlParameter[] OutputParam ={
                    new SqlParameter("@RETURNVALUE",SqlDbType.Int)
                };

                if (File.Exists(Server.MapPath(ppath)) == true)
                {
                    if (flagupdate == 1)
                    {
                        result = ado.Return_Parameter_NonExecuteQuery("ITEM_INS_UPDATE", Param, OutputParam);
                        flag = 1;
                    }
                    else
                        smsLable.Text = "Image already exist";
                }
                else
                {
                    FileUpload1.PostedFile.SaveAs(Server.MapPath(ppath));
                    result = ado.Return_Parameter_NonExecuteQuery("ITEM_INS_UPDATE", Param, OutputParam);
                    flag = 1;
                }
            }


            if (flag == 1)
            {
                if(result==1)
                    smsLable.Text = "<font color=green>Item saved successfully.</font>";
                else if (result == 2)
                {
                    smsLable.Text = "<font color=green>Item updated successfully.</font>";
                    Response.Redirect("EditItem.aspx");
                }
                else
                    smsLable.Text = "<font color=red>Some error has occurred.</font>";
            }
            else
            {
                smsLable.Text = "<font color=red>Some error has occurred.</font>";
            }
        }
        catch (Exception ex)
        {
            smsLable.Text = "<font color=red>"+ex.Message+".</font>";
        }
    }
}
