<%@ Page Language="C#" AutoEventWireup="true" CodeFile="billinformation.aspx.cs"
    MasterPageFile="~/admin/AdminMaster.master" Inherits="admin_billinformation" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript">
        function checkDate(sender, args) {
            if (sender._selectedDate > new Date()) {
                alert("You cannot select a day after than today!");
                sender._selectedDate = new Date();
                // set the date back to the current date
                sender._textbox.set_Value(sender._selectedDate.format(sender._format))
            }
        }

    </script>

    <div id="binfo">
        <p>
            To find the bill Transaction , Please Enter the range of date in the Textbox given
            below.</p>
        <div id="bsrch">
            <div class="b-box">
                <div class="bb-l">
                    Date From</div>
                <div class="bb-r">
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/admin/images/cal.jpg"
                        AlternateText="Click here to display calendar" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator"
                        ControlToValidate="TextBox1">* Enter Date here</asp:RequiredFieldValidator>
                    <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="TextBox1"
                        PopupButtonID="ImageButton1" OnClientDateSelectionChanged="checkDate" Format="dd-MMM-yyyy"
                        Animated="False">
                    </cc1:CalendarExtender>
                </div>
                <div class="clear">
                </div>
            </div>
            <div class="b-box">
                <div class="bb-l">
                    Date To</div>
                <div class="bb-r">
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/admin/images/cal.jpg"
                        AlternateText="Click here to display calendar" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2"
                        ErrorMessage="RequiredFieldValidator">* Enter Date here</asp:RequiredFieldValidator>
                    <cc1:CalendarExtender ID="CalendarExtender2" Format="dd-MMM-yyyy" runat="server"
                        TargetControlID="TextBox2" PopupButtonID="ImageButton2" OnClientDateSelectionChanged="checkDate">
                    </cc1:CalendarExtender>
                </div>
                <div class="clear">
                </div>
            </div>
            <div id="bbtn">
                <asp:Button ID="Button1" runat="server" Text="Check Details" OnClick="Button1_Click" /></div>
        </div>
        <div id="b-data">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                GridLines="Horizontal" DataKeyNames="OId" AllowPaging="true" PageSize="8" BackColor="White"
                BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" Width="600px" OnSelectedIndexChanging="GridView1_SelectedIndexChanging">
                <FooterStyle BackColor="White" ForeColor="#333333" />
                <RowStyle BackColor="White" ForeColor="#333333" />
                <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                <Columns>
                    <asp:BoundField DataField="OId" HeaderText="Bill Number" />
                    <asp:BoundField DataField="UserId" HeaderText="Login Id" />
                    <asp:BoundField DataField="FirstName" HeaderText="User Name" />
                    <asp:BoundField DataField="OderDate" HeaderText="Oder Date" />
                    <asp:CommandField ShowSelectButton="True" />
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
