using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


public class SignIn :CommonFunctions
{
    string _UID,_LoginID,_FullName;

	public SignIn()
	{
		
	}

    public string UID
    {
        get { return _UID; }
        set { _UID = value; }
    }

    public string LoginID
    {
        get { return _LoginID; }
        set { _LoginID = value; }
    }

    public string FullName
    {
        get { return _FullName; }
        set { _FullName = value; }
    }
}
