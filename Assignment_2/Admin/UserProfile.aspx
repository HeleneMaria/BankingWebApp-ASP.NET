<%@ Page Title="User Profile" Language="C#" MasterPageFile="~/Style/MasterPage.Master" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="Assignment_2.Admin.UserProfile" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">



</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Label ID="title" runat="server" Text="User profile"></asp:Label>
    <br />
    <div id="contentpage" runat="server">
    <asp:Panel ID="UpdateUserProfilePanel" runat="server" GroupingText="Update User Profile">
            <p>
                Update the user details as required.</p>

   <table width="700px">
       <tr>
        <td style="text-align : right"><asp:Label ID="NameLabel" runat="server" Text="Name: "></asp:Label></td>
        <td><asp:TextBox ID="NameTextBox" runat="server" OnTextChanged="NameTextBox_TextChanged" ForeColor="Gray"></asp:TextBox></td>
        <td><asp:RequiredFieldValidator ID="NameRequiredFieldValidator" runat="server" ControlToValidate="NameTextBox" ErrorMessage="Can not be empty" ForeColor="Red" ValidationGroup="UpdateProfileValGroup" Font-Size="Small"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="NameExpressionValidator" runat="server" ControlToValidate="NameTextBox" ErrorMessage="Name must be between 1-50 characters" ForeColor="Red" ValidationExpression="[a-zA-Z/ /-]{1,50}" ValidationGroup="UpdateProfileValGroup" Font-Size="Small"></asp:RegularExpressionValidator></td>
       </tr>
        
      <tr>
        <td style="text-align : right"><asp:Label ID="TFNLabel" runat="server" Text="TFN:"></asp:Label></td>
        <td><asp:TextBox ID="TFNTextBox" runat="server" ForeColor="Gray" OnTextChanged="TFNTextBox_TextChanged"></asp:TextBox></td>
        <td><asp:RegularExpressionValidator ID="TFNExpressionValidator" runat="server" ControlToValidate="TFNTextBox" ErrorMessage="TFN must be a 11 digit number" ForeColor="Red" ValidationExpression="[1-9]{1}[0-9]{10}" ValidationGroup="UpdateProfileValGroup" Font-Size="Small"></asp:RegularExpressionValidator></td>
      </tr>
     
      <tr>
        <td style="text-align : right"><asp:Label ID="AddressLabel" runat="server" Text="Address:"></asp:Label></td>
        <td><asp:TextBox ID="AddressTextBox" runat="server" ForeColor="Gray" OnTextChanged="AddressTextBox_TextChanged"></asp:TextBox></td>
        <td><asp:RegularExpressionValidator ID="AddressExpressionValidator" runat="server" ControlToValidate="AddressTextBox" ErrorMessage="Address can't be longer than 50 characters" ForeColor="Red" ValidationExpression="[a-zA-Z0-9/ /-]{0,50}" ValidationGroup="UpdateProfileValGroup" Font-Size="Small"></asp:RegularExpressionValidator></td>
      </tr>

      <tr>
        <td style="text-align : right"><asp:Label ID="CityLabel" runat="server" Text="City:"></asp:Label></td>
        <td><asp:TextBox ID="CityTextBox" runat="server" ForeColor="Gray" OnTextChanged="CityTextBox_TextChanged"></asp:TextBox></td>
        <td><asp:RegularExpressionValidator ID="CityExpressionValidator" runat="server" ControlToValidate="CityTextBox" ErrorMessage="City can't be longer than 40 characters" ForeColor="Red" ValidationExpression="[a-zA-Z0-9/ /-]{0,40}" ValidationGroup="UpdateProfileValGroup" Font-Size="Small"></asp:RegularExpressionValidator></td>
      </tr>

     <tr>
        <td style="text-align : right"><asp:Label ID="StateLabel" runat="server" Text="State: "></asp:Label></td>
        <td><asp:TextBox ID="StateTextBox" runat="server" ForeColor="Gray" OnTextChanged="StateTextBox_TextChanged"></asp:TextBox></td>
        <td><asp:RegularExpressionValidator ID="StateExpressionValidator" runat="server" ControlToValidate="StateTextBox" ErrorMessage="Must be a 3 lettered Australian state (NSW,QLD,SAU,TAS,VIC,WAU)" ForeColor="Red" ValidationExpression="Vic|vic|VIC|Nsw|nsw|NSW|Qld|qld|QLD|Sau|sau|SAU|Tas|tas|TAS|Wau|wau|WAU" ValidationGroup="UpdateProfileValGroup" Font-Size="Small"></asp:RegularExpressionValidator></td>
     </tr>
     
     <tr>
        <td style="text-align : right"><asp:Label ID="PostCodeLabel" runat="server" Text="PostCode:"></asp:Label></td>
        <td><asp:TextBox ID="PostCodeTextBox" runat="server" ForeColor="Gray" OnTextChanged="PostCodeTextBox_TextChanged"></asp:TextBox></td>
        <td><asp:RegularExpressionValidator ID="PostCodeExpressionValidator" runat="server" ControlToValidate="PostCodeTextBox" ErrorMessage="PostCode must be a 4 digit number" ForeColor="Red" ValidationExpression="[1-9]{1}[0-9]{3}" ValidationGroup="UpdateProfileValGroup" Font-Size="Small"></asp:RegularExpressionValidator></td>
     </tr>
     
     <tr>
        <td style="text-align : right"><asp:Label ID="PhoneLabel" runat="server" Text="Phone:"></asp:Label></td>
        <td><asp:TextBox ID="PhoneTextBox" runat="server" ForeColor="Gray" OnTextChanged="PhoneTextBox_TextChanged"></asp:TextBox></td>
        <td><asp:RequiredFieldValidator ID="PhoneRequiredFieldValidator" runat="server" ControlToValidate="PhoneTextBox" ErrorMessage="Can not be empty" ForeColor="Red" ValidationGroup="UpdateProfileValGroup" Font-Size="Small"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="PhoneExpressionValidator" runat="server" ControlToValidate="PhoneTextBox" ErrorMessage="Must be of the format:  (61)- XXXX XXXX" ForeColor="Red" ValidationExpression="[/(]{1}[6]{1}[1]{1}[/)]{1}[/-]{1}[/ ]{1}[0-9]{4}[/ ]{1}[0-9]{4}" ValidationGroup="UpdateProfileValGroup" Font-Size="Small"></asp:RegularExpressionValidator></td>
    </tr>
  </table>

    <p></p>
        <asp:Button ID="UpdateUserProfileButton" runat="server" Text="Update User Profile" OnClick="UpdateProfileButton_Click" ValidationGroup="UpdateProfileValGroup" />
        <asp:Label ID="UpdateProfileLabel" runat="server" ForeColor="#009900" Visible="False"></asp:Label>
    </asp:Panel>

    <br />
    <asp:Panel ID="ChangeUserPasswordPanel" runat="server" GroupingText="Change User Password">
        <br />
        
    <table width="700px">
        
        <tr>
        <td width="140px" style="text-align : right"><asp:Label ID="NewPasswordLabel" runat="server" Text="New Password: "></asp:Label></td>
        <td><asp:TextBox ID="NewPasswordTextBox" runat="server" TextMode="Password"></asp:TextBox></td>
        <td><asp:RegularExpressionValidator ID="NewPasswordRegularExpressionValidator" runat="server" ControlToValidate="NewPasswordTextBox" ErrorMessage="Password must be between 1-20 chars long, consist of (a-z, A-Z, and/or 0-9), no special chars" ForeColor="Red" ValidationExpression="[a-zA-Z0-9]{1,20}"></asp:RegularExpressionValidator></td>
        </tr>

        <tr>
        <td width="140px" style="text-align : right"><asp:Label ID="ConfirmPasswordLabel" runat="server" Text="Confirm Password: "></asp:Label></td>
        <td><asp:TextBox ID="ConfirmPasswordTextBox" runat="server" TextMode="Password"></asp:TextBox></td>
        <td><asp:RegularExpressionValidator ID="ConfirmPasswordRegularExpressionValidator" runat="server" ControlToValidate="ConfirmPasswordTextBox" ErrorMessage="Password must be between 1-20 chars long, consist of (a-z, A-Z, and/or 0-9), no special chars" ForeColor="Red" ValidationExpression="[a-zA-Z0-9]{1,20}"></asp:RegularExpressionValidator></td>
        </tr>
    </table>   
        <br />
        <asp:Button ID="ChangeUserPasswordButton" runat="server" OnClick="ChangePasswordButton_Click" Text="Change User Password" />
        &nbsp;<asp:Label ID="ChangePasswordLabel" runat="server" ForeColor="#009933" Visible="False"></asp:Label>
     
           
        <br />
    </asp:Panel>
    <p>
        &nbsp;</p>
    </div>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />

</asp:Content>