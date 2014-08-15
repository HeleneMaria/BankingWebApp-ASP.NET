<%@ Page Title="" Language="C#" MasterPageFile="~/Style/MasterPage.Master" AutoEventWireup="true" CodeBehind="BillPay.aspx.cs" Inherits="Assignment_2.User.BillPay" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        &nbsp;<asp:Label ID="lbl_EditText" runat="server" Text="Edit Transaction " Visible="False"></asp:Label>
        <asp:Label ID="lbl_editID" runat="server" Text="X" Visible="False"></asp:Label>
    </p>
    <p>
        From Account:
        <asp:DropDownList ID="account_selector" runat="server" DataSourceID="SqlDataSource1" DataTextField="FullAccount" DataValueField="AccountNumber">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MyDatabaseConnectionString %>" SelectCommand="SelectAccounts" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="UserID" SessionField="UserAuthentication" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    </p>
    <p>
        To Payee:<asp:DropDownList ID="payee_selector" runat="server" DataSourceID="SqlDataSource2" DataTextField="PayeeName" DataValueField="PayeeID">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MyDatabaseConnectionString %>" SelectCommand="SelectPayees" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="payee_selector" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
    </p>
    <p>
        Amount:
        <asp:TextBox ID="txtAmount" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtAmount" ErrorMessage="Cannot be empty"></asp:RequiredFieldValidator>
&nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtAmount" ErrorMessage="Must be a number ( ex : 76,50)" ValidationExpression="[0-9]+(,[0-9]{1,2})"></asp:RegularExpressionValidator>
    </p>
    <p>
        Scheduled Date:<asp:TextBox ID="txtDate" runat="server" Height="16px" Width="128px" ReadOnly="True"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtDate" ErrorMessage="Cannot be empty"></asp:RequiredFieldValidator>
        <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" OnSelectionChanged="Calendar1_SelectionChanged" Width="200px">
            <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
            <NextPrevStyle VerticalAlign="Bottom" />
            <OtherMonthDayStyle ForeColor="#808080" />
            <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
            <SelectorStyle BackColor="#CCCCCC" />
            <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
            <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
            <WeekendDayStyle BackColor="#FFFFCC" />
        </asp:Calendar>
    </p>
    <p>
        Period:<asp:RadioButtonList ID="period_selector" runat="server">
            <asp:ListItem Value="M">monthly</asp:ListItem>
            <asp:ListItem Value="Q">quarterly</asp:ListItem>
            <asp:ListItem Value="Y">annually</asp:ListItem>
            <asp:ListItem Selected="True" Value="S">once off</asp:ListItem>
        </asp:RadioButtonList>
    </p>
    <p>
    <span style="float: left; padding-right: 10px;">
        <asp:Button ID="btnCancel" runat="server" Text="Cancel Transaction" OnClick="btnCancel_Click" />
    </span>
    <span style="float: right; padding-right: 150px;">
        <asp:Button ID="btnSave" runat="server" Text="Save Transaction" OnClick="btnSave_Click" />
    </span>
    </p>
    <asp:Label ID="lbl_finish" runat="server" Text="Transaction saved" Visible="False"></asp:Label>
    <br />
    <br />
</asp:Content>
