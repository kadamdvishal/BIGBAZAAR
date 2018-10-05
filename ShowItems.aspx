<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="ShowItems.aspx.cs" Inherits="user_ShowItems" Title="View Items" %>

<asp:Content ID="ShowItem" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="feature">
        Featured Products</div>
    <asp:DataList ID="DataList1" runat="server" RepeatColumns="2" RepeatDirection="Horizontal">
        <ItemTemplate>
            <div id="itemp">
                <div id="itleft">
                    <a href="ShowIndividualItem.aspx?var1=<%#Eval("IID") %>">
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("IImage") %>' Width="100"
                            Height="100" />
                    </a>
                </div>
                <div id="itright">
                    <div id="iname">
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("IName") %>'></asp:Label>
                    </div>
                    <div id="detail">
                        <a href="ShowIndividualItem.aspx?var1=<%#Eval("IID") %>">
                            <img src="images/detail.jpg" alt="" /></a><br />
                        <br />
                        <a href="ShowIndividualItem.aspx?var1=<%#Eval("IID") %>">
                            <img src="images/addcart.jpg" alt="" /></a>
                    </div>
                </div>
            </div>
        </ItemTemplate>
        
    </asp:DataList>
    <div id="last">
        <ul>
            <li>
                <asp:LinkButton ID="lnkPrevious" runat="server" onclick="lnkPrevious_Click">Previous</asp:LinkButton></li>
            <li>
                <asp:LinkButton ID="lnkNext" runat="server" onclick="lnkNext_Click">Next</asp:LinkButton></li>
        </ul>
    </div>
</asp:Content>
