<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="UserRegistration.aspx.cs" Inherits="user_UserRegistration" Title="Register Here" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%--<table width="100%" cellpadding="0" cellspacing="0">
    <tr>
        <td>
            <table width="100%" cellpadding="0" cellspacing="0">
                <tr>
                    <td>First Name</td>
                    <td><asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox></td>
                    <td>Middle Name</td>
                    <td><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
                    <td>Last Name</td>
                    <td><asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>User ID</td>
                    <td><asp:TextBox ID="TextBox3" runat="server"></asp:TextBox></td>
                    <td>Password</td>
                    <td><asp:TextBox ID="TextBox4" runat="server"></asp:TextBox></td>
                    <td>Confirm Password</td>
                    <td><asp:TextBox ID="TextBox5" runat="server"></asp:TextBox></td>
                </tr>
                 <tr>
                    <td>Email-ID</td>
                    <td><asp:TextBox ID="TextBox6" runat="server"></asp:TextBox></td>
                    <td>Alternate Email</td>
                    <td><asp:TextBox ID="TextBox7" runat="server"></asp:TextBox></td>
                    <td>Gender</td>
                    <td>
                        <asp:RadioButtonList ID="rdGender" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Value="0" Selected="True">Male</asp:ListItem>
                            <asp:ListItem Value="1">Female</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                 <tr>
                    <td>Country</td>
                    <td><asp:TextBox ID="TextBox8" runat="server"></asp:TextBox></td>
                    <td>State</td>
                    <td><asp:TextBox ID="TextBox9" runat="server"></asp:TextBox></td>
                    <td>City</td>
                    <td><asp:TextBox ID="TextBox10" runat="server"></asp:TextBox></td>
                </tr>
                <tr valign="top">
                    <td>Address</td>
                    <td><asp:TextBox ID="TextBox11" TextMode="MultiLine" Rows="3" Width="150px" runat="server"></asp:TextBox></td>
                    <td>Mobile</td>
                    <td><asp:TextBox ID="TextBox12" runat="server"></asp:TextBox></td>
                    <td>Phone</td>
                    <td><asp:TextBox ID="TextBox13" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td colspan="6" align="center">&nbsp;
                        <asp:Label ID="lblMessage" runat="server"></asp:Label>
                    </td>
                </tr>
                 <tr>
                    <td colspan="6" align="center">
                        <asp:Button ID="btnSubmit" runat="server" Width="100px" Text="Submit" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>--%>
    <div style="background: url(images/feature.gif); height: 23px; color: #FFFFFF; font-weight: bold;
        padding: 7px 0px 0px 10px;">
        User Registration
    </div>
    <div style="padding: 10px;">
        <table width="100%" cellpadding="1" cellspacing="0">
            <tr>
                <td style="width: 20%">
                    First Name &nbsp;
                </td>
                <td style="width: 80%">
                    <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFirstName"
                        ErrorMessage="RequiredFieldValidator" Style="position: relative">Please Enter Name</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Middle Name &nbsp;
                </td>
                <td>
                    <asp:TextBox ID="txtMName" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Last Name &nbsp;
                </td>
                <td>
                    <asp:TextBox ID="txtLName" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Email-ID
                </td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtEmail"
                        ErrorMessage="RequiredFieldValidator">Enter E-mail</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtEmail"
                        ErrorMessage="RegularExpressionValidator" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">Enter correct Format of E-mail Id</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Alternate Email
                </td>
                <td>
                    <asp:TextBox ID="txtAEmail" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtAEmail"
                        ErrorMessage="RegularExpressionValidator" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">Enter correct Format of E-mail Id</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Mobile
                </td>
                <td>
                    <asp:TextBox ID="txtMobile" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Phone
                </td>
                <td>
                    <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Gender
                </td>
                <td>
                    <asp:RadioButtonList ID="rdGender" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Value="0" Selected="True">Male</asp:ListItem>
                        <asp:ListItem Value="1">Female</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
                <tr>
                    <td>
                        Address
                    </td>
                    <td>
                        <asp:TextBox ID="txtAddress" TextMode="MultiLine" Rows="3" Width="150px" runat="server"></asp:TextBox>
                    </td>
        </table>
        <table width="100%" id="logDetail" runat="server" cellpadding="1" cellspacing="0">
            <tr>
                <td style="width: 20%">
                    User ID
                </td>
                <td>
                    <asp:TextBox ID="txtUserID" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtUserID"
                        ErrorMessage="RequiredFieldValidator">Please Enter User ID</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Password
                </td>
                <td>
                    <asp:TextBox ID="txtPass" runat="server" TextMode="password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"  ControlToValidate="txtPass"
                        ErrorMessage="RequiredFieldValidator">Please Enter Password</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Confirm Password
                </td>
                <td>
                    <asp:TextBox ID="txtCPass" runat="server" TextMode="password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtCPass"
                        Text="Please Enter Confirm Password"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPass"
                        ControlToValidate="txtCPass"> Your password cannot be matched</asp:CompareValidator>
                </td>
            </tr>
        </table>
        <table width="100%" cellpadding="1" cellspacing="0">
            <tr>
                <td></td>
                <td>
                    <asp:Button ID="btnSubmit" runat="server" Width="100px" Text="Submit" 
                        onclick="btnSubmit_Click" />
                        &nbsp;
                    <asp:Label ID="lblMessage" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
    </div>
    <%--<div id="register">
        <table width="700" cellpadding="0" cellspacing="0" id="reg1">
            <tr>
                <td colspan="3" class="reg">
                    
                        Register Here
                </td>
            </tr>
            <tr>
                <td>
                    First Name</td>
                <td>
                    Middle Name</td>
                <td style="width: 156px">
                    Last Name</td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtFname" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFname"
                        ErrorMessage="RequiredFieldValidator" Style="position: relative">* Please Enter Name</asp:RequiredFieldValidator></td>
                <td>
                    <asp:TextBox ID="txtMname" runat="server"></asp:TextBox></td>
                <td style="width: 156px">
                    <asp:TextBox ID="txtLname" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    User Id</td>
                <td>
                    Password</td>
                <td style="width: 156px">
                    Re-Type Password</td>
            </tr>
            <tr>
                <td style="height: 24px">
                    <asp:TextBox ID="txtUId" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtUId"
                        ErrorMessage="RequiredFieldValidator" Style="position: relative">* Enter User Id</asp:RequiredFieldValidator></td>
                <td style="height: 24px">
                    <asp:TextBox ID="txtpwd" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtpwd"
                        ErrorMessage="RequiredFieldValidator" Style="position: relative">* Password must be required</asp:RequiredFieldValidator></td>
                <td style="width: 156px; height: 24px">
                    <asp:TextBox ID="txtrepwd" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtrepwd"
                        ErrorMessage="RequiredFieldValidator" Style="position: relative">* Field should not be empty</asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtpwd"
                        ControlToValidate="txtrepwd" ErrorMessage="CompareValidator" Style="position: relative">* Your password cannot be matched,re-enter password.</asp:CompareValidator></td>
            </tr>
        </table>
        <table width="700" cellpadding="0" cellspacing="0" id="reg2">
            <tr>
                <td class="l" style="height: 24px">
                    E-Mail
                </td>
                <td class="r" style="height: 24px">
                    <asp:TextBox ID="txtemail" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtemail"
                        ErrorMessage="RequiredFieldValidator" Style="position: relative">* Enter E-mail</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtemail"
                        ErrorMessage="RegularExpressionValidator" Style="position: relative" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">* Enter correct Format of E-mail Id</asp:RegularExpressionValidator></td>
            </tr>
            <tr>
                <td class="l">
                    Alternate E-Mail Id
                </td>
                <td class="r">
                    <asp:TextBox ID="txtaltemail" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtaltemail"
                        ErrorMessage="RequiredFieldValidator" Style="position: relative">* Enter Alternate E-mailId</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtaltemail"
                        ErrorMessage="Enter correct format" Style="position: relative" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">* Enter correct format of E-mail address</asp:RegularExpressionValidator></td>
            </tr>
            <tr>
                <td class="l" style="height: 20px">
                    Gender</td>
                <td class="r" style="height: 20px">
                    &nbsp;<asp:RadioButtonList ID="RadioButtonList1" runat="server" Style="position: relative">
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="RadioButtonList1"
                        ErrorMessage="RequiredFieldValidator" Style="position: relative">* Require field not empty</asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td class="l" style="height: 24px">
                    Country
                </td>
                <td class="r" style="height: 24px">
                    <asp:TextBox ID="txtcountry" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtcountry"
                        ErrorMessage="RequiredFieldValidator" Style="position: relative">Field must be requiured</asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td class="l" style="height: 24px">
                    State
                </td>
                <td class="r" style="height: 24px">
                    <asp:TextBox ID="txtstate" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtstate"
                        ErrorMessage="RequiredFieldValidator" Style="position: relative">* Field must be required</asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td class="l">
                    City
                </td>
                <td class="r">
                    <asp:TextBox ID="txtcity" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtcity"
                        ErrorMessage="RequiredFieldValidator" Style="position: relative">* Field must be required</asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td class="l">
                    Addtress
                </td>
                <td class="r">
                    &nbsp;<asp:TextBox ID="txtaddress" runat="server" Style="position: relative" TextMode="MultiLine"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtaddress"
                        ErrorMessage="RequiredFieldValidator" Style="position: relative">* address must be required</asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td class="l">
                    Phone
                </td>
                <td class="r">
                    <asp:TextBox ID="txtphone" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="l">
                    Mobile
                </td>
                <td class="r">
                    <asp:TextBox ID="txtmobile" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2" class="rbtn">
                    <asp:Button ID="Button1" runat="server" Text="Register" />
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<asp:HyperLink
                        ID="HyperLink1" runat="server" NavigateUrl="~/user/userLogin.aspx" Style="position: relative">Back to Login</asp:HyperLink>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    <asp:Label ID="smslabel" runat="server" Style="position: relative"></asp:Label></td>
            </tr>
        </table>
    </div>--%>
</asp:Content>
