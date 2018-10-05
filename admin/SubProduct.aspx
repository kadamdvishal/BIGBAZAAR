<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMaster.master" AutoEventWireup="true"
    CodeFile="SubProduct.aspx.cs" Inherits="SubProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
    <table width="100%" border="0" cellpadding="4" cellspacing="0" id="tabs">
        <tr>
            <td colspan="2" style="height: 27px">
            </td>
            <td colspan="2" class="text">
                Insert Sub Category
            </td>
           
        </tr>
        <tr>
            <td style="width: 15%" rowspan="6">
            </td>
            <td style="width: 30%; height: 27px;" class="left">
                Select Product
            </td>
            <td style="width: 30%;" class="right">
                <asp:DropDownList ID="ddlProduct" runat="server">
                </asp:DropDownList>
            </td>
            <td style="width: 25%" class="error1">
            </td>
        </tr>
        <tr>
            <td class="left">
                Sub Product
            </td>
            <td class="right">
                <asp:TextBox ID="txtSubProduct" runat="server"></asp:TextBox>
            </td>
            <td class="error1">
            </td>
        </tr>
        <tr>
            <td class="left">
                Description
            </td>
            <td class="right">
                <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine"></asp:TextBox>
            </td>
            <td class="error1">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" class="error">
                <asp:Label ID="lblMessage" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="left">
            </td>
            <td class="right">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" 
                    onclick="btnSubmit_Click" />
            </td>
        </tr>
    </table>
    </ContentTemplate>
                </asp:UpdatePanel>
    <table width="100%" border="0" cellpadding="4" cellspacing="0" id="Table1">
        <tr>
            <td align="center">
                <asp:UpdatePanel ID="up2" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="gvSubProduct" runat="server" AutoGenerateColumns="False" CellPadding="4"
                            ForeColor="#333333" GridLines="None" DataKeyNames="sId" AllowPaging="true" onrowdeleting="gvSubProduct_RowDeleting"
                            onpageindexchanging="gvSubProduct_PageIndexChanging" OnRowEditing="gvSubProduct_RowEditing">
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
                                <asp:TemplateField HeaderText="Sub Product">
                                    <ItemTemplate>
                                        <%#Eval("Sname") %>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                
                                <asp:TemplateField HeaderText="Sub Product Desc">
                                    <ItemTemplate>
                                        <%#Eval("Sdescription") %>
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
