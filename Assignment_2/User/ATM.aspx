<%@ Page Title="" Language="C#" MasterPageFile="~/Style/MasterPage.Master" AutoEventWireup="true" CodeBehind="ATM.aspx.cs" Inherits="Assignment_2.ATM" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <table width="700">

    <tr>
    <td style="text-align : right"><asp:Label ID="Label1" runat="server" Text="Transaction Type:"></asp:Label></td>
    <td> <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
        <asp:ListItem Value="D">Deposit money</asp:ListItem>
        <asp:ListItem Value="W">Withdrawal</asp:ListItem>
        <asp:ListItem Value="T">Transfer</asp:ListItem>
    </asp:DropDownList></td>
   </tr>

    <tr>
    <td style="text-align : right"><asp:Label ID="Label2" runat="server" Text="From Account:"></asp:Label></td>
   <td> <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource1" DataTextField="FullAccount" DataValueField="AccountNumber" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" AutoPostBack="True">
    </asp:DropDownList>
    <asp:Label ID="balance" runat="server"></asp:Label>
    <asp:Label ID="Label9" runat="server" Font-Bold="False" ForeColor="Black" Text="From account required"></asp:Label></td>
    </tr>

    <tr>
    <td style="text-align : right"><asp:Label ID="Label3" runat="server" Text="To Account:"></asp:Label></td>
    <td><asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource2" DataTextField="FullAccount" DataValueField="AccountNumber" AutoPostBack="True">
    </asp:DropDownList></td>
    </tr>

    <tr>
    <td style="text-align : right"><asp:Label ID="Label4" runat="server" Text="Amount:"></asp:Label></td>
    <td><asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox4" ErrorMessage="Amount is required"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox4" ErrorMessage="Must be a number ( ex : 76,50)" ValidationExpression="[0-9]+(,[0-9]{1,2})"></asp:RegularExpressionValidator>
    </td></tr>

    <tr>
    <td style="text-align : right"><asp:Label ID="Label5" runat="server" Text="Comment:"></asp:Label></td>
    <td><asp:TextBox ID="TextBox5" runat="server"></asp:TextBox></td>
    </tr>
        </table>
    <br />
    <br />
    <asp:Button ID="Button1" runat="server" Text="Cancel Transaction" OnClick="Button1_Click" UseSubmitBehavior="False" ValidateRequestMode="Disabled" />
&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Button2" runat="server" Text="Execute Transaction" OnClick="Button2_Click" Height="22px" />
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Data Source=localhost;Initial Catalog=Banking;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SelectAllAccounts" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:Parameter DefaultValue="1" Name="AccountChosen" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <br />
        <asp:Label ID="Label7" runat="server" Font-Bold="True" ForeColor="#00CC00" Text="Your transaction was successful !" Visible="False"></asp:Label>
    <asp:Label ID="Label6" runat="server" Font-Bold="True" ForeColor="Red" Text="Your transaction was unsuccessful due to internal error. Please try again." Visible="False"></asp:Label>
    <asp:Label ID="Label8" runat="server" Font-Bold="True" ForeColor="Red" Text="Your transaction was unsuccessful due to insufficient funds (200$ for a checking and 0$ for a saving account)" Visible="False"></asp:Label>
    <br />
    <p>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=localhost;Initial Catalog=Banking;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SelectAccounts" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="UserID" SessionField="UserAuthentication" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
        <br />
    </p>
</asp:Content>
