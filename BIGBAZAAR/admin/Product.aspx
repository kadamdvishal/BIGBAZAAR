<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMaster.master" AutoEventWireup="true"
    CodeFile="Product.aspx.cs" Inherits="admin_Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table width="100%" border="0" cellpadding="4" cellspacing="0" id="tabs">
                <tr>
                    <td colspan="2" style="height: 27px">
                    </td>
                    <td colspan="2" class="text">
                        Insert Category Item
                    </td>
                </tr>
                <tr>
                    <td style="width: 15%" rowspan="6">
                    </td>
                    <td style="width: 30%; height: 27px;" class="left">
                        Product
                    </td>
                    <td style="width: 30%;" class="right">
                          <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                        <asp:TextBox ID="txtProductName" runat="server"></asp:TextBox>
                        </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                    <td style="width: 25%" class="error1">
                    </td>
                </tr>
                <tr>
                    <td class="left">
                        Discription
                    </td>
                    <td class="right">
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>
                                <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine"></asp:TextBox>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                    <td class="error1">
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="error">
                        <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                            <ContentTemplate>
                                <asp:Label ID="lblMessage" runat="server"></asp:Label>
                           </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr>
                    <td class="left">
                    </td>
                    <td class="right">
                         <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                            <ContentTemplate>
                                <asp:Button ID="btnSubmit" runat="server" Height="24px" Text="Submit" OnClick="Submit_Click" />
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
            </table>
            <table width="100%" border="0" cellpadding="4" cellspacing="0" id="Table1">
                <tr>
                    <td align="center">
                        <asp:UpdatePanel ID="up2" runat="server">
                            <ContentTemplate>
                                <asp:GridView ID="gvProduct" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                    ForeColor="#333333" GridLines="None" DataKeyNames="PId" AllowPaging="true"
                                    onrowdeleting="gvProduct_RowDeleting" onrowediting="gvProduct_RowEditing" 
                                    onpageindexchanging="gvProduct_PageIndexChanging">
                                    <Columns>
                                        <asp:TemplateField HeaderText="S.No">
                                            <ItemTemplate>
                                                <%# Container.DataItemIndex+1 %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Product Name">
                                            <ItemTemplate>
                                                <%#Eval("PName") %>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Description">
                                            <ItemTemplate>
                                                <%#Eval("PDescription") %>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" />
                                        </asp:TemplateField>
                                       
                                       <asp:TemplateField HeaderText="Edit">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkEdit" runat="server" Text="Edit" CommandName="Edit" ForeColor="red">
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        
                                        <asp:TemplateField HeaderText="Delete">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkDelete" runat="server" Text="Delete" CommandName="Delete" OnClientClick="javascript:return confirm('Are you sure to delete?');" ForeColor="red">
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                    <EditRowStyle BackColor="Pink" />
                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                </asp:GridView>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
            </table>
            
</asp:Content>
