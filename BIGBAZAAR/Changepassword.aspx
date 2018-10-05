<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Changepassword.aspx.cs" Inherits="user_Changepassword" Title="Change Password" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="usr-log">
        <table cellpadding="0" cellspacing="0" style="width: 400px;" id="u-log">
            <tr>
                <td class="ul-left">
                    User ID</td>
                <td class="ul-right">
                    <asp:TextBox ID="txtUID" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator"
                        Style="position: relative" ControlToValidate="txtUID">*</asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td class="ul-left">
                    Old Password</td>
                <td class="ul-right">
                    <asp:TextBox ID="txtOldP" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator"
                        Style="position: relative" ControlToValidate="txtOldP">*</asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td class="ul-left">
                    New Password</td>
                <td class="ul-right">
                    <asp:TextBox ID="txtNPass" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="RequiredFieldValidator"
                        Style="position: relative" ControlToValidate="txtNPass">*</asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td class="ul-left">
                    Confirm Password</td>
                <td class="ul-right">
                    <asp:TextBox ID="txtConfirm" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="RequiredFieldValidator"
                        ControlToValidate="txtConfirm">*</asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center;">
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="CompareValidator"
                        ControlToCompare="txtNPass" ControlToValidate="txtConfirm">Enter correct password</asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center;">
                    <asp:Label ID="smslabel" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td colspan="2" class="log-right">
                    <div class="kalla">
                        <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" /></div>
                </td>
            </tr>
            <tr>
                <td colspan="2" class="log-right">
                    <div class="kalla">
                        <a href="userLogin.aspx">Back to Login Page</a></div>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
