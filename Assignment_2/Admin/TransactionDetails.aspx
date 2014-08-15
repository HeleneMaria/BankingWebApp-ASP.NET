<%@ Page Title="Transaction Details" Language="C#" MasterPageFile="~/Style/MasterPage.Master" AutoEventWireup="true" CodeBehind="TransactionDetails.aspx.cs" Inherits="Assignment_2.Admin.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">



</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <asp:Label ID="title" runat="server" Text="Transaction details"></asp:Label>

    <div id="contentpage" runat="server">
       

        <br />
        Please choose an account
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="FullAccount" DataValueField="AccountNumber" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MyDatabaseConnectionString %>" SelectCommand="SelectAccounts" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="UserID" SessionField="CustomerChosen" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
       

        <asp:Label ID="Balance" runat="server"></asp:Label>
        <br />
        <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Show transactions" />
       

    </div>

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="TransactionID" DataSourceID="SqlDataSource2">
        <Columns>
            <asp:BoundField DataField="TransactionID" HeaderText="TransactionID" InsertVisible="False" ReadOnly="True" SortExpression="TransactionID" />
            <asp:BoundField DataField="TransactionType" HeaderText="TransactionType" SortExpression="TransactionType" />
            <asp:BoundField DataField="AccountNumber" HeaderText="AccountNumber" SortExpression="AccountNumber" />
            <asp:BoundField DataField="DestAccount" HeaderText="DestAccount" SortExpression="DestAccount" />
            <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />
            <asp:BoundField DataField="Comment" HeaderText="Comment" SortExpression="Comment" />
            <asp:BoundField DataField="ModifyDate" HeaderText="ModifyDate" SortExpression="ModifyDate" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MyDatabaseConnectionString %>" SelectCommand="SelectTransactions" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="UserID" SessionField="CustomerChosen" Type="String" />
            <asp:SessionParameter Name="AccountNumber" SessionField="AccountChosen" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    <br />
    <br />
    <br />
    <br />
    <br />

</asp:Content>