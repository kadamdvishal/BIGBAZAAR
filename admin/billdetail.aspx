<%@ Page Language="C#" AutoEventWireup="true" CodeFile="billdetail.aspx.cs" Inherits="admin_billdetail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Bill</title>
    <link href="admin.css" rel="Stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div id="vbill">
            <div id="head">
                <div id="img">
                    <img src="images/logo.gif" alt="" /></div>
            </div>
            
            <p class="bada">
                Bill Information</p>
                
            <div class="vb-box">
                <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Style="position: relative;
                    left: -2px; top: -5px;" Width="600px" CellPadding="4" GridLines="Horizontal"
                    BackColor="White" BorderColor="#336666" BorderStyle="Double" 
                    BorderWidth="3px" onpageindexchanging="DetailsView1_PageIndexChanging">
                    <FooterStyle BackColor="White" ForeColor="#333333" />
                    <EditRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="White" ForeColor="#333333" />
                    <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                </asp:DetailsView>
            </div>
            <div class="vb-box">
                <asp:DetailsView ID="DetailsView2" runat="server" BackColor="White" BorderColor="#336666"
                    BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal"
                    Height="50px" Width="600px">
                    <FooterStyle BackColor="White" ForeColor="#333333" />
                    <EditRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="White" ForeColor="#333333" />
                    <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                </asp:DetailsView>
            </div>
            <div class="vb-box">
                <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#336666"
                    BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal"
                    Width="600px">
                    <FooterStyle BackColor="White" ForeColor="#333333" />
                    <RowStyle BackColor="White" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                </asp:GridView>
            </div>
            <div class="vb-box">
                <a href="javascript:history.back();">Back to Bill Info</a> | <a href="javascript:void(0);"
                    onclick="window.print();">Print Bill</a>
            </div>
        &nbsp;
    </form>
</body>
</html>
