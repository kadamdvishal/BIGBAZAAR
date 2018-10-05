<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="ShowAddtocart.aspx.cs" Inherits="user_ShowAddtocart" Title="View Your Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="d-top">
        View Cart</div>
    <div id="v-cart">
        <asp:UpdatePanel ID="up1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:GridView ID="GridView1" runat="server" CellPadding="3" AutoGenerateColumns="False"
                    BackColor="White" OnRowDeleting="GridView1_RowDeleting" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" Width="700px">
                    <Columns>
                        <asp:BoundField DataField="IName" HeaderText="Product Name" />
                        <asp:TemplateField HeaderText="Quantity">
                            <ItemTemplate>
                                <asp:TextBox ID="tb1" Text='<%#Eval("Qty") %>' Width="20px" runat="server" AutoPostBack="true" OnTextChanged="tb1_TextChanged"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Market Price">
                            <ItemTemplate>
                            <del>
                                <asp:Label ID="label2" runat="server" Text='<%#Eval("MRP") %>'></asp:Label>
                                </del>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Offer Price">
                            <ItemTemplate>
                                <asp:Label ID="lblOffer" Text='<%#Eval("Iprice") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Total">
                            <ItemTemplate>
                                <asp:Label ID="Label1" Text='<%#Eval("total") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderText="Delete">
                            <ItemTemplate>
                                <asp:Button ID="btnDelete" runat="server" Text="Delete" CommandName="Delete" CommandArgument='<%Eval("IId") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <RowStyle ForeColor="#000066" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                </asp:GridView>
            </ContentTemplate>
        </asp:UpdatePanel>
        <div id="finish">
            <div id="f-total">
                <asp:UpdatePanel ID="tot" runat="server">
                    <ContentTemplate>
                        <asp:Label ID="lbltotal" runat="server"></asp:Label>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <div id="f-btn"><asp:Button ID="Button1" runat="server" Text="Check Out" 
                    onclick="Button1_Click" /></div>
        </div>
    </div>
</asp:Content>
