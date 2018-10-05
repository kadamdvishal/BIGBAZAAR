<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UserProfile.aspx.cs" Inherits="UserProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="d-top">
    My Account
</div>
<div style="padding:10px;">

<table width="100%" cellpadding="2">
<tr>
    <td style="width:20%">First Name</td>
    <td><asp:Label ID="lblFName" runat="server"></asp:Label></td>
</tr>
<tr>
    <td>Middle Name</td>
    <td><asp:Label ID="lblMName" runat="server"></asp:Label></td>
</tr>
<tr>
    <td>Last Name</td>
    <td><asp:Label ID="lblLName" runat="server"></asp:Label></td>
</tr>
<tr>
    <td>Gender</td>
    <td><asp:Label ID="lblGender" runat="server"></asp:Label></td>
</tr>
<tr>
    <td>Mobile</td>
    <td><asp:Label ID="lblMob" runat="server"></asp:Label></td>
</tr>
<tr>
    <td>Phone</td>
    <td><asp:Label ID="lblPhone" runat="server"></asp:Label></td>
</tr>
<tr>
    <td>Email</td>
    <td><asp:Label ID="lblEmail" runat="server"></asp:Label></td>
    
</tr>
<tr>
    <td>Alternate Mail id</td>
    <td><asp:Label ID="lblAEmail" runat="server"></asp:Label></td>
</tr>
<tr>
    <td>Address </td>
    <td><asp:Label ID="lblAddress" runat="server"></asp:Label></td>
</tr>
<tr style="height:30px;">
    <td>
        <asp:LinkButton ID="lnkEdit" runat="server" Text="Edit Profile" 
            onclick="lnkEdit_Click"></asp:LinkButton>
    </td>
</tr>
</table>
</div>
</asp:Content>

