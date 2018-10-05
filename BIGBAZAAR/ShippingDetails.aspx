<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile="ShippingDetails.aspx.cs"
    Inherits="user_ShippingDetails" %>


    <asp:Content ID="ShowItem" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
       <asp:UpdatePanel ID="up" runat="server">
        <ContentTemplate>
        
        <asp:Panel ID="Panel1" runat="server">
            <asp:GridView ID="GridView1" runat="server" Style="position: relative" AutoGenerateColumns="False"
                BackColor="White" BorderColor="#CCCCCC" OnRowDeleting="GridView1_RowDeleting"
                BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="650px">
                <Columns>
                    <asp:BoundField DataField="IName" HeaderText="Product Name" />
                    <asp:TemplateField HeaderText="Quantity">
                        <ItemTemplate>
                            <asp:TextBox ID="tb1" Text='<%#Eval("Qty") %>' Width="20px" runat="server" OnTextChanged="tb1_TextChanged" AutoPostBack="true"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Market Price">
                        <ItemTemplate>
                            <del>
                                <asp:Label ID="label2" runat="server" Text='<%#Eval("MRP") %>'></asp:Label></del>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Market Price">
                        <ItemTemplate>
                            <asp:Label ID="lblOffer" runat="server" Text='<%#Eval("Iprice") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="Total">
                        <ItemTemplate>
                            <asp:Label ID="Label1" Text='<%#Eval("total") %>' runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                  <asp:TemplateField HeaderText="Delete">
                            <ItemTemplate>
                                <asp:Button ID="btnDelete" CausesValidation="false" runat="server" OnClientClick="javascript:return confirm('Are you sure to delete?');" Text="Delete" CommandName="Delete" CommandArgument='<%Eval("IId") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <RowStyle ForeColor="#000066" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            </asp:GridView>
            <table width="100%">
                <tr>
                    <td style="width:50%;text-align:right;color:Green;">Total Quantity :</td>
                    <td style="width:5%;text-align:right;"><asp:Label ID="lblqty" Font-Bold="true" runat="server"></asp:Label></td>
                    <td style="width:45%;">&nbsp;</td>
                </tr>
                <tr>
                    <td style="width:50%;;text-align:right;;color:Green;">Total Amount(Rs) :</td>
                    <td style="width:5%;text-align:right;"><asp:Label ID="lbltotal" Font-Bold="true" runat="server"></asp:Label></td>
                    <td style="width:45%;">&nbsp;</td>
                </tr>
            </table>
        </asp:Panel>
         </ContentTemplate>
       </asp:UpdatePanel>
                  <br />          
        <asp:Panel ID="Panel3" runat="server">
                <table cellpadding="0" cellspacing="0" style="margin:20px;">
                    <tr>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text="First Name"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txtFname" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtLname"
                                ErrorMessage="RequiredFieldValidator" Style="position: relative">*</asp:RequiredFieldValidator></td>
                                
                                
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label2" runat="server" Text="Last Name"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txtLname" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtLname"
                                ErrorMessage="RequiredFieldValidator" Style="position: relative">*</asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label3" runat="server" Text="E-mail Id"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txtemail" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtemail"
                                ErrorMessage="RequiredFieldValidator">*</asp:RequiredFieldValidator>
                                 <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtemail"
                                ErrorMessage="RegularExpressionValidator" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">Enter correct E-mail Id</asp:RegularExpressionValidator>
                                </td>
                    </tr>
                   
                    <tr>
                        <td>
                            <asp:Label ID="Label4" runat="server" Text="Telephone no."></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td >
                            <asp:Label ID="Label5" runat="server" Text="Mobile No."></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txtMobile" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtMobile"
                                ErrorMessage="RequiredFieldValidator">*</asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label6" runat="server" Text="Address"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" Rows="3"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtAddress"
                                ErrorMessage="RequiredFieldValidator">*</asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label7" runat="server" Text="City"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtCity"
                                ErrorMessage="RequiredFieldValidator">*</asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label8" runat="server" Text="State"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txtState" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtState"
                                ErrorMessage="RequiredFieldValidator">*</asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label9" runat="server" Text="Country"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txtCountry" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtCountry"
                                ErrorMessage="RequiredFieldValidator">*</asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label10" runat="server" Text="PinCode"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txtpincode" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtpincode"
                                ErrorMessage="RequiredFieldValidator">*</asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <asp:Button ID="Button1" runat="server" Text="Ship to Above Address" 
                                onclick="Button1_Click" /></td>
                    </tr>
                </table>
            </asp:Panel>
        
    </asp:Content>
 
