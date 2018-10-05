using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class Product : CommonFunctions
{
    int _Product_ID;
    string _Product_Name, _Description;

    public Product()
    {

    }

    public string ProductName
    {
        get { return _Product_Name; }
        set { _Product_Name = value; }
    }

    public string Description
    {
        get { return _Description; }
        set { _Description = value; }
    }

    public int ProductID
    {
        get { return _Product_ID; }
        set { _Product_ID = value; }
    }
}
