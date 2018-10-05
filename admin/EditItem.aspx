<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/admin/AdminMaster.master"
    CodeFile="EditItem.aspx.cs" Inherits="admin_ItemUpdateCont" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table width="100%" border="0" cellpadding="4" cellspacing="0" id="tabs">
        <tr>
            <td colspan="2" style="height: 27px">
            </td>
            <td colspan="2" class="text">
                Update Item
            </td>
        </tr>
        <tr>
            <td style="width: 15%" rowspan="6">
            </td>
            <td style="width: 30%; height: 27px;" class="left">
                Select Product
            </td>
            <td style="width: 30%;" class="right">
                <asp:DropDownList ID="ddlProduct" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlProduct_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
            <td style="width: 25%" class="error1">
            </td>
        </tr>
        <tr>
            <td class="left">
                Child Product
            </td>
            <td class="right">
                &nbsp;<asp:DropDownList ID="ddlSubProduct" runat="server" 
                    Style="position: relative" AutoPostBack="true" 
                    onselectedindexchanged="ddlSubProduct_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
            <td class="error1">
            </td>
        </tr>
        <tr>
            <td colspan="2" class="error">
            </td>
        </tr>
    </table>
    <table width="100%" border="0" cellpadding="4" cellspacing="0" id="Table1">
        <tr>
            <td align="center">
                <br />
            </td>
            <td align="center">
                <asp:GridView ID="gvItem" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    ForeColor="#333333" GridLines="Horizontal" DataKeyNames="iId" PageSize="20"
                    AllowPaging="true" onrowediting="gvItem_RowEditing" 
                    OnPageIndexChanging="gvItem_PageIndexChanging" 
                    onrowdeleting="gvItem_RowDeleting" 
                    onselectedindexchanged="gvItem_SelectedIndexChanged">
                    <Columns>
                        <asp:TemplateField HeaderText="S.No">
                            <ItemTemplate>
                                <%# Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Sub Product">
                            <ItemTemplate>
                                <%#Eval("sName") %>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Item Name">
                            <ItemTemplate>
                                <%#Eval("iname") %>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Image">
                            <ItemTemplate>
                                <asp:Image ID="img1" ImageUrl='<%#Eval("iimage") %>' Height="50px" Width="50px" runat="server" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="QTY">
                            <ItemTemplate>
                                <%#Eval("qty") %>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderText="Market Price">
                            <ItemTemplate>
                                <%#Eval("mrp") %>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Selling Price">
                            <ItemTemplate>
                                <%#Eval("iprice") %>
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
                                <asp:LinkButton ID="lnkDelete" runat="server" Text="Delete" CommandName="Delete"
                                    OnClientClick="javascript:return confirm('Are you sure to delete?');" ForeColor="red">
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
                <br />
                <%--<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AllowPaging="true"
                    PageSize="20" DataKeyNames="IId" OnRowEditing="GridView1_RowEditing" OnPageIndexChanging="GridView1_PageIndexChanging">
                    <Columns>
                        <asp:BoundField DataField="IId" HeaderText="Item Id" ReadOnly="True" />
                        <asp:BoundField DataField="SName" HeaderText="SubProduct Name" ReadOnly="True" />
                        <asp:TemplateField HeaderText="Item Name">
                            <ItemTemplate>
                                <%#Eval("IName") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="name" runat="server" TextMode="MultiLine" Rows="3" Columns="8" Text='<%#Eval("IName")%>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="req1" runat="server" Text="* Enter Item Name here"
                                    ControlToValidate="name"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:ImageField DataImageUrlField="IImage" HeaderText="Image" ReadOnly="True">
                            <ControlStyle Height="50px" Width="50px" />
                        </asp:ImageField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:FileUpload ForeColor="DarkGray" runat="server" ID="FileUpload2" Visible="false" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:FileUpload ForeColor="DarkGray" runat="server" ID="FileUpload2" Style="position: relative" />
                            </EditItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="Description">
                                     <ItemTemplate>
                                     
                                  <%#Eval("IDescription") %>
                                    
                                     </ItemTemplate>
                                     <EditItemTemplate>
                                     <asp:TextBox ID="description" runat="server" TextMode="MultiLine" Rows="5" Columns="10" 
                                           Text='<%#Eval("IDescription")%>'></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="req2" runat="server" Text="* Enter description here" ControlToValidate="description"></asp:RequiredFieldValidator>
                                     
                                     </EditItemTemplate>
                                     </asp:TemplateField>
                        <asp:TemplateField HeaderText="Market Price">
                            <ItemTemplate>
                                <%#Eval("MRP") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="mrp" runat="server" TextMode="MultiLine" Text='<%#Eval("MRP")%>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="req3" runat="server" Text="* Enter market Price here"
                                    ControlToValidate="mrp"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Selling Price">
                            <ItemTemplate>
                                <%#Eval("IPrice") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="price" runat="server" Text='<%#Eval("IPrice")%>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="req4" runat="server" Text="* Enter Selling Price here"
                                    ControlToValidate="price"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowEditButton="True">
                            <ControlStyle ForeColor="Red" />
                        </asp:CommandField>
                        <asp:TemplateField HeaderText="Delete">
                            <ItemTemplate>
                                <span onclick="return confirm('Are you sure to Delete the record?')">
                                    <asp:LinkButton ID="lkbt" runat="server" Text="Delete" CommandName="Delete" ForeColor="red">
                                    </asp:LinkButton>
                                </span>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <EditRowStyle BackColor="#999999" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>--%>
            </td>
        </tr>
    </table>
</asp:Content>
