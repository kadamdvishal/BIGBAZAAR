<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ShowPaymentDetails.aspx.cs"
    Inherits="user_ShowPaymentDetails" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Payment Details</title>
    <link href="bill.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div id="master">
            <div id="body">
                <div id="head">
                    <div id="img">
                        <a href="../index.aspx">
                            <img src="images/logo.gif" alt="" /></a></div>
                </div>
                <div class="ship-data">
                    <asp:Panel ID="Panel1" runat="server" Height="50px" Style="position: relative" Width="714px">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Style="position: relative"
                            BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px"
                            CellPadding="4" Width="650px">
                            <Columns>
                                <asp:BoundField DataField="IName" HeaderText="Product Name" />
                                <asp:BoundField DataField="Qty" HeaderText="Quatity" />
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        <b>Market Price</b>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                       
                                            <asp:Label ID="label2" runat="server" Text='<%#Eval("MRP") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Iprice" HeaderText="Offer Price" />
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" Text='<%#Eval("total") %>' runat="server"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:CommandField ShowCancelButton="False" />
                            </Columns>
                            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                            <RowStyle BackColor="White" ForeColor="#003399" />
                            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                            <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                        </asp:GridView>
                    </asp:Panel>
                </div>
                <div class="ship-data">
                    <asp:Panel ID="Panel2" runat="server">
                        <table cellpadding="0" cellspacing="0" style="width: 500px;" id="sh-log">
                            <tr>
                                <td colspan="2" class="mode">
                                    Payment Mode</td>
                            </tr>
                            <tr>
                                <td class="st-l">
                                    <asp:Label ID="Label4" runat="server" Text="Select Payment Mode"></asp:Label></td>
                                <td class="st-r">
                                    <asp:DropDownList ID="DropDownList1" runat="server" >
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="DropDownList1"
                                        ErrorMessage="RequiredFieldValidator">*</asp:RequiredFieldValidator></td>
                            </tr>
                            <tr>
                                <td colspan="2" class="mode">
                                    Payment Option</td>
                            </tr>
                            <tr>
                                <td class="st-l">
                                    <asp:Label ID="Label6" runat="server" Text="Card Number"></asp:Label><br />
                                    <asp:Label ID="Label7" runat="server" Text="Enter 16 digit card number"></asp:Label></td>
                                <td class="st-r">
                                    <asp:TextBox ID="Txtcardnumber" runat="server" Style="position: relative"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Txtcardnumber"
                                        ErrorMessage="RequiredFieldValidator">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="st-l">
                                    <asp:Label ID="Label8" runat="server" Text="CVV Password"></asp:Label><br />
                                    <asp:Label ID="Label9" runat="server" Text="Enter 4 digit Password"></asp:Label></td>
                                <td class="st-r">
                                    <asp:TextBox ID="Txtpwd" runat="server" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Txtpwd"
                                        ErrorMessage="RequiredFieldValidator">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="st-l">
                                    <asp:Label ID="Label10" runat="server" Text="Expiry Date"></asp:Label></td>
                                <td class="st-r">
                                    <asp:TextBox ID="Txtdate" runat="server"></asp:TextBox>&nbsp;
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="Txtdate"
                                        ErrorMessage="RequiredFieldValidator">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#999999"
                                        Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" Style="position: relative;
                                        top: 0px;" Width="200px"  
                                        CellPadding="4" DayNameFormat="Shortest" 
                                        onselectionchanged="Calendar1_SelectionChanged" OnDayRender="Calendar1_DayRender">
                                        <SelectedDayStyle BackColor="#666666" ForeColor="White" Font-Bold="True" />
                                        <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                                        <OtherMonthDayStyle ForeColor="#808080" />
                                        <NextPrevStyle VerticalAlign="Bottom" />
                                        <DayHeaderStyle Font-Bold="True" Font-Size="7pt" BackColor="#CCCCCC" />
                                        <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                                        <SelectorStyle BackColor="#CCCCCC" />
                                        <WeekendDayStyle BackColor="#FFFFCC" />
                                    </asp:Calendar>
                                </td>
                            </tr>
                            <tr>
                                <td class="st-l">
                                    <asp:Label ID="Label11" runat="server" Text="Order Date"></asp:Label></td>
                                <td class="st-r">
                                    <asp:TextBox ID="txtcurrentdate" runat="server" ></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Label ID="lblMessage" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Button ID="Button1" runat="server"  Text="Proceed to CheckOut" 
                                        onclick="Button1_Click" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </div>
    </form>
</body>
</html>
