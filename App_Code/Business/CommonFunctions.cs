using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

public class CommonFunctions 
{
    UserADO ado = new UserADO();
	public CommonFunctions()
	{
		
	}

    public int Save(string Query)
    {
        return ado.ExecuteNonQueryByQuery(Query);
    }

    public int Delete(string Query)
    {
        return ado.ExecuteNonQueryByQuery(Query);
    }

    public int Update(string Query)
    {
        return ado.ExecuteNonQueryByQuery(Query);
    }

    public DataSet Select(string Query)
    {
        return ado.Get_DataSet(Query);
    }


}

public class ClassError
{
    string ErrorStr;
    public string GetError
    {

        get { return ErrorStr; }
        set { ErrorStr = value; }

    }
}