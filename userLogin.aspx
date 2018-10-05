<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="userLogin.aspx.cs" Inherits="user_userLogin" Title="User Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="usr-log">
        <table cellpadding="0" cellspacing="0" style="width: 400px;" id="u-log">
            <tr>
                <td class="ul-left">
                    User Id :</td>
                <td class="ul-right">
                    <asp:TextBox ID="txtUserId" runat="server" Width="150px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUserId"
                        ErrorMessage="name must be required">*</asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td class="ul-left">
                    Password :</td>
                <td class="ul-right">
                    <asp:TextBox ID="txtPassword" runat="server" Width="150px" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword"
                        ErrorMessage="Password field must be required">*</asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <asp:Label ID="lblMessage" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td colspan="2" class="log-right">
                    <div class="kalla">
                        <asp:Button ID="btnSignIn" runat="server"  Text="Sign In" 
                            onclick="btnSignIn_Click" /></div>
                </td>
            </tr>
            <tr>
                <td colspan="2" class="log-right">
                    <div class="kalla">
                        <a href="UserRegistration.aspx">New User - SignUp Now</a></div>
                </td>
            </tr>
            <tr>
                <td colspan="2" class="log-right">
                    <div class="kalla">
                        <a href="UserForgetPassword.aspx">Forget Password</a></div>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
