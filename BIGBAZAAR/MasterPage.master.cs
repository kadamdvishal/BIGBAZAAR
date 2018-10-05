using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Web.Configuration;

public partial class MasterPage : System.Web.UI.MasterPage
{
    MenuItem ChildItem;
    SqlConnection MyCon = new SqlConnection(WebConfigurationManager.ConnectionStrings["myConn"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            try
            {
                string cmd1 = "select PId,Pname from Product";
                string cmd2 = "select SId,SName,PId from SubProduct";
                SqlDataAdapter ad = new SqlDataAdapter(cmd1, MyCon);
                DataSet ds = new DataSet();
                ad.Fill(ds, "Product");
                ad.SelectCommand.CommandText = cmd2;
                ad.Fill(ds, "SubProduct");

                DataRelation relation = new DataRelation("ParentChild", ds.Tables[0].Columns["PId"], ds.Tables[1].Columns["PId"], true);
                ds.Relations.Add(relation);

                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    MenuItem MainItem = new MenuItem(row["PName"].ToString(), row["PId"].ToString());
                    Menu1.Items.Add(MainItem);
                    DataRow[] ChildRows = row.GetChildRows(relation);

                    foreach (DataRow ChildRow in ChildRows)
                    {
                        ChildItem = new MenuItem(ChildRow["SName"].ToString(), ChildRow["SId"].ToString());
                        MainItem.ChildItems.Add(ChildItem);
                    }
                }
            }
            catch (Exception ex)
            {
                lblErr.Text = "<font color=red>" + ex.Message + "</font>";
            }
        }
        
    }

    protected void Menu1_MenuItemClick1(object sender, MenuEventArgs e)
    {
        string str = e.Item.Value.ToString();
        Response.Redirect("~/ShowItems.aspx?var=" + str + "");
    }

    protected void lnkOut_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        
        Session.Clear();
        lblItems.Text = "0";
        Response.Redirect("index.aspx");
    }

    
}
