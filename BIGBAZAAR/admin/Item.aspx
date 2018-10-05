<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMaster.master" AutoEventWireup="true"
    CodeFile="Item.aspx.cs" Inherits="admin_Item" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<%--<asp:UpdatePanel ID="up1" runat="server">
    <ContentTemplate>--%>
    <table width="100%" border="0" cellpadding="4" cellspacing="0" id="tabs">
        <tr>
            <td colspan="2" style="height: 27px">
            </td>
            <td colspan="2" class="text">
                Insert Item
            </td>
        </tr>
        <tr>
            <td style="width: 15%" rowspan="10">
            </td>
            <td style="width: 30%;" class="left">
                Select Product
            </td>
            <td style="width: 30%;" class="right">
                <asp:DropDownList ID="ddlProduct" runat="server" AutoPostBack="True" 
                    onselectedindexchanged="ddlProduct_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
            <td style="width: 25%" class="error1">
            </td>
        </tr>
        <tr>
            <td class="left">
                Select Sub Product
            </td>
            <td class="right" style="width: 362px">
                <asp:DropDownList ID="ddlSubProduct" runat="server">
                </asp:DropDownList>
            </td>
            <td class="error1">
            </td>
        </tr>
        <tr>
            <td class="left">
                Item Name
            </td>
            <td class="right" style="width: 362px">
                <asp:TextBox ID="txtItem" runat="server"></asp:TextBox>
            </td>
            <td class="error1">
            </td>
        </tr>
        <tr>
            <td class="left">
                Description
            </td>
            <td class="right" style="width: 362px">
                <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine"></asp:TextBox>
            </td>
            <td class="error1">
            </td>
        </tr>
        <tr>
            <td class="left">
                MRP
            </td>
            <td class="right" style="width: 362px">
                <asp:TextBox ID="txtMPrice" runat="server"></asp:TextBox>
            </td>
            <td class="error1">
            </td>
        </tr>
        <tr>
            <td class="left" style="height: 8px">
                Price
            </td>
            <td class="right" style="width: 362px; height: 8px">
                <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>
            </td>
            <td class="error1" style="height: 8px">
            </td>
        </tr>
        <tr>
            <td class="left">
                Quantity
            </td>
            <td class="right" style="width: 362px">
                <asp:TextBox ID="txtQuantity" runat="server"></asp:TextBox>
            </td>
            <td class="error1">
            </td>
        </tr>
        <tr>
            <td class="left" style="height: 30px">
                Picture
            </td>
            <td class="right" colspan="2">
                <asp:FileUpload ID="FileUpload1" runat="server" />
                <%--<asp:Image ID="img1" Height="50px" Width="50px" ImageUrl="" runat="server" />--%>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="error">
                <asp:Label ID="smsLable" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="3" align="center">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" 
                    onclick="btnSubmit_Click" />
            </td>
            
        </tr>
    </table>
<%--    </ContentTemplate>
</asp:UpdatePanel>--%>
</asp:Content>
