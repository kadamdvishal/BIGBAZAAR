<%@ Application Language="C#" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e) 
    {
        // Code that runs on application startup

    }
    
    void Application_End(object sender, EventArgs e) 
    {
        //  Code that runs on application shutdown

    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
        // Code that runs when an unhandled error occurs
        // At this point we have information about the error
        //HttpContext ctx = HttpContext.Current;

        //Exception exception = ctx.Server.GetLastError();

        //string errorInfo =
        //   "<br/><br/>Offending URL: " + ctx.Request.Url.ToString() +
        //   "<br/><br/>Source: " + exception.Source +
        //   "<br/><br/>Message: " + exception.Message +
        //   "<br/><br/>Stack trace: " + exception.StackTrace;

        //ClassError err = new ClassError();
        //err.GetError = errorInfo;
        ////ctx.Response.Write(errorInfo);

        //// --------------------------------------------------
        //// To let the page finish running we clear the error
        //// --------------------------------------------------
        //ctx.Server.ClearError();

    }

    void Session_Start(object sender, EventArgs e) 
    {
        // Code that runs when a new session is started

    }

    void Session_End(object sender, EventArgs e) 
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }
       
</script>
