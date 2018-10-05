using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Web.UI.HtmlControls;

/// <summary>
/// Summary description for Utility
/// </summary>
public class Utility
{
    private SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["myConn"].ConnectionString);
    //private SqlDataAdapter da;
    //private DataSet ds;
    private SqlCommand cmd;
    private SqlDataReader DataReader;
    public string QueryText = null;
	public Utility()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public void BindDropDownList(string Query, string Display, string Value,DropDownList Combo)
    {
        con.Open();
        cmd = new SqlCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = Query;
        cmd.Connection = con;
        DataReader = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        cmd.Dispose();
        cmd = null;

        Combo.DataSource = DataReader;
        Combo.DataTextField = Display;
        Combo.DataValueField = Value;
        Combo.DataBind();
        Combo.Items.Insert(0, "<-SELECT->");
        Combo.Items[0].Value = "0";
    }

    public void BindDropDownList(DropDownList Combo,string ProcedureName, int ID,string ParameterName,string Display,string Value)
    {
        con.Open();
        cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = ProcedureName;
        cmd.Connection = con;
        cmd.Parameters.Add("@" + ParameterName, SqlDbType.Int, 4).Value = ID;
        DataReader = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        cmd.Dispose();
        cmd = null;

        Combo.DataSource = DataReader;
        Combo.DataTextField = Display;
        Combo.DataValueField = Value;
        Combo.DataBind();
        Combo.Items.Insert(0, "<-SELECT->");
        Combo.Items[0].Value = "0";
    }

    public void BindDropDownList(DropDownList Combo, string ProcedureName, string Display, string Value)
    {
        con.Open();
        cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = ProcedureName;
        cmd.Connection = con;
        DataReader = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        cmd.Dispose();
        cmd = null;

        Combo.DataSource = DataReader;
        Combo.DataTextField = Display;
        Combo.DataValueField = Value;
        Combo.DataBind();
        Combo.Items.Insert(0, "<-SELECT->");
        Combo.Items[0].Value = "0";
    }

    public void BindDropDownList(DropDownList Combo, string ProcedureName, int[] IDs, string[] ParameterNames, string Display, string Value)
    {
        con.Open();
        cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = ProcedureName;
        cmd.Connection = con;

        for (int i = 0; i < IDs.Length; i++)
        {
            cmd.Parameters.Add("@" + ParameterNames[i], SqlDbType.Int, 4).Value = IDs[i];
        }

        DataReader = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        cmd.Dispose();
        cmd = null;

        Combo.DataSource = DataReader;
        Combo.DataTextField = Display;
        Combo.DataValueField = Value;
        Combo.DataBind();
        Combo.Items.Insert(0, new ListItem("<-SELECT->", "0"));
       
    }
    //------------------THIS FUNCTION IS SAME AS ABOVE FUNCTION ONLY DIFFERENCE IS AT ZERO INDEX SELECT AND ALL
    public void BindDropDownList_SEL(DropDownList Combo, string ProcedureName, int[] IDs, string[] ParameterNames, string Display, string Value)
    {
        con.Open();
        cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = ProcedureName;
        cmd.Connection = con;

        for (int i = 0; i < IDs.Length; i++)
        {
            cmd.Parameters.Add("@" + ParameterNames[i], SqlDbType.Int, 4).Value = IDs[i];
        }

        DataReader = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        cmd.Dispose();
        cmd = null;

        Combo.DataSource = DataReader;
        Combo.DataTextField = Display;
        Combo.DataValueField = Value;
        Combo.DataBind();
        Combo.Items.Insert(0, new ListItem("<-SELECT->", "0"));

    }

    public int Insert(string Query)
    {
        con.Open();
        cmd = new SqlCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = Query;
        cmd.Connection = con;
        int flag = cmd.ExecuteNonQuery();
        con.Close();
        return flag;
    }

    public Int64 InsertReturn(SqlCommand cmdobj, string CmdText)
    {
        con.Open();
        cmdobj.CommandType = CommandType.StoredProcedure;
        cmdobj.CommandText = CmdText;
        cmdobj.Connection = con;

        cmdobj.Parameters.Add("@RETURNVALUE", SqlDbType.BigInt);
        cmdobj.Parameters["@RETURNVALUE"].Direction = ParameterDirection.Output;
        cmdobj.ExecuteNonQuery();
        Int64 flag = Convert.ToInt64(cmdobj.Parameters["@RETURNVALUE"].Value);
        con.Close();
        cmd = null;
        con.Close();
        return flag;
    }

    public DataSet Select(string Query)
    {
        SqlDataAdapter da = new SqlDataAdapter(Query, con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        return ds;
    }

    public void BindListBox(ListBox lstBox,string Query,string Display,string ValueField)
    {
        lstBox.DataSource = this.Select(Query);
        lstBox.DataTextField = Display;
        lstBox.DataValueField = ValueField;
        lstBox.DataBind();
    }

   

    public int Delete(string ProcedureName, string ParameterName, int ID)
    {
        int Flag;
        try
        {
            con.Open();
            cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = ProcedureName;
            cmd.Connection = con;
            cmd.Parameters.Add("@" + ParameterName, SqlDbType.Int, 4).Value = ID;
            cmd.Parameters.Add("@RETURNVALUE", SqlDbType.Int, 4);
            cmd.Parameters["@RETURNVALUE"].Direction = ParameterDirection.Output;
            cmd.ExecuteNonQuery();
            Flag = Convert.ToInt32(cmd.Parameters["@RETURNVALUE"].Value);
            cmd = null;
        }
        finally
        {
            con.Close();
        }
        return Flag;
    }

    public void InsertItemDDL(DropDownList ddl, int Number,string FirstText)
    {
        for (int i = 0; i < Number; i++)
        {
            ddl.Items.Insert(i,new ListItem(i.ToString(), i.ToString()));
        }
        ddl.Items.Insert(0, new ListItem(FirstText,"-1"));
        ddl.SelectedIndex = 0;
    }

    public void InsertItemDDL(DropDownList ddl,int StartingNo, int EndNumber, string FirstText)
    {
        for (int i = StartingNo,j=0; i <= EndNumber; i++,j++)
        {
            ddl.Items.Insert(j, new ListItem(i.ToString(), i.ToString()));
        }
        ddl.Items.Insert(0, new ListItem(FirstText, "-1"));
        ddl.SelectedIndex = 0;
    }

    public void InsertItemDDL(DropDownList ddl, int Number, string item,string FirstText)
    {
        for (int i = 0; i < Number; i++)
        {
            //ddl.Items.Insert(i,(i.ToString()+item));
            ddl.Items.Insert(i, new ListItem((i.ToString() + item), i.ToString()));
        }
        ddl.Items.Insert(0, new ListItem(FirstText, "-1"));
        ddl.SelectedIndex = 0;
    }

    public void SetCSS(MasterPage Page,string AnchorID,string ClassName)
    {
        HtmlAnchor a = new HtmlAnchor();
        a = (HtmlAnchor)Page.FindControl(AnchorID);
        a.Attributes.Add("class", ClassName);
    }
}
