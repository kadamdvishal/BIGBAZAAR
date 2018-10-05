<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="ShowIndividualItem.aspx.cs" Inherits="user_ShowIndividualItem" Title="View Detail" %>

<asp:Content ID="ShowIndividualItem" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="feature">
        Featured Products</div>
    <asp:FormView ID="FormView1" runat="server" Height="250px">
        <ItemTemplate>
            <div id="items">
                <div id="it-left">
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("IImage") %>' Width="200"
                        Height="200" CssClass="border-img" /></div>
                <div id="it-right">
                    <div id="it-name">
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("IName") %>'></asp:Label></div>
                    <div id="it-desc">
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("IDescription") %>'></asp:Label></div>
                    <div id="it-mrp">
                        MRP: <span class="red">
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("MRP") %>' Font-Strikeout="True"></asp:Label></span></div>
                    <div id="it-price">
                        Price: <span class="red">
                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("IPrice") %>'></asp:Label></span></div>
                    <div id="addtocart">
                        <asp:Button ID="btnAddToCart" runat="server" CssClass="addcart" OnClick="btnAddToCart_Click" /></div>
                </div>
            </div>
            <div class="clear">
            </div>
        </ItemTemplate>
    </asp:FormView>
</asp:Content>
