<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="UserForgetPassword.aspx.cs" Inherits="user_UserForgetPassword" Title="Forget Password" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="d-top">
        Password Recovery
    </div>
    <div id="usr-log">
        <table cellpadding="0" cellspacing="0" style="width: 400px;" id="u-log">
            <tr>
                <td class="ul-left">
                    Enter your User ID</td>
                <td class="ul-right">
                    <asp:TextBox ID="txtUID" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator"
                        ControlToValidate="txtUID">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="ul-left">
                    Enter Your E-Mail Id</td>
                <td class="ul-right">
                    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator"
                        Style="position: relative" ControlToValidate="txtEmail">*</asp:RequiredFieldValidator>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center;">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail"
                        ErrorMessage="RegularExpressionValidator" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">* please enter e-mail Id in correct format</asp:RegularExpressionValidator></td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center;">
                    <div id="pardeep" style="display: block;">
                        <asp:Label ID="smslabel1" runat="server"></asp:Label>
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="2" class="log-right">
                    <div class="kalla">
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" Width="100px" OnClick="btnSubmit_Click" /></div>
                </td>
            </tr>
            <tr>
                <td colspan="2" class="log-right">
                    <div class="kalla">
                        <a href="userLogin.aspx">Back to Login</a></div>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
