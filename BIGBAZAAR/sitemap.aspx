<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="sitemap.aspx.cs" Inherits="sitemap" Title="Site Map" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="d-top">
        Site Map
    </div>
    <div id="smap">
        <ul>
            <li><a href="index.aspx">Home</a></li>
            <li><a href="index.aspx">Collections</a></li>
            <li><a href="user/userLogin.aspx">User Login</a></li>
            <li><a href="user/UserRegistration.aspx">Register User</a></li>
            <li><a href="About.aspx">About Us</a></li>
            <li><a href="Contact.aspx">Contact Us</a></li>
            <li><a href="terms_condition.aspx">Terms &amp; Condition</a></li>
            <li><a href="sitemap.aspx">Site Map</a></li>
        </ul>
    </div>
</asp:Content>
