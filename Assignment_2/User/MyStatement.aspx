<%@ Page Title="" Language="C#" MasterPageFile="~/Style/MasterPage.Master" AutoEventWireup="true" CodeBehind="MyStatement.aspx.cs" Inherits="Assignment_2.MyStatement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    Please select an account type:<br />
    <asp:DropDownList ID="AccountSelector" runat="server" OnSelectedIndexChanged="AccountSelector_SelectedIndexChanged" style="height: 22px" DataSourceID="SqlDataSource2" DataTextField="FullAccount" DataValueField="AccountNumber">
        <asp:ListItem Selected="True" Value="C">Checkings</asp:ListItem>
        <asp:ListItem Value="S">Savings</asp:ListItem>
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MyDatabaseConnectionString %>" SelectCommand="SelectAccounts" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="UserID" SessionField="UserAuthentication" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    &nbsp;<br />
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Show Transaction History" />
    <br />
&nbsp;<asp:Label ID="lbl_balanceText" runat="server" Text="Your current balance:" Visible="False"></asp:Label>
<asp:Label ID="lbl_balance" runat="server" Visible="False"></asp:Label>
<br />
<asp:Label ID="lbl_nofunds" runat="server" ForeColor="Red" Text="Insufficient funds, not possible to show transaction history" Visible="False"></asp:Label>
    <br />
    <asp:ListView ID="TransactionListView" runat="server" DataKeyNames="TransactionID">
        <AlternatingItemTemplate>
            <tr style="background-color:#FFF8DC;">
                <td>
                    <asp:Label ID="TransactionIDLabel" runat="server" Text='<%# Eval("TransactionID") %>' />
                </td>
                <td>
                    <asp:Label ID="TransactionTypeLabel" runat="server" Text='<%# Eval("TransactionType") %>' />
                </td>
                <td>
                    <asp:Label ID="AccountNumberLabel" runat="server" Text='<%# Eval("AccountNumber") %>' />
                </td>
                <td>
                    <asp:Label ID="DestAccountLabel" runat="server" Text='<%# Eval("DestAccount") %>' />
                </td>
                <td>
                    <asp:Label ID="AmountLabel" runat="server" Text='<%# Eval("Amount") %>' />
                </td>
                <td>
                    <asp:Label ID="CommentLabel" runat="server" Text='<%# Eval("Comment") %>' />
                </td>
                <td>
                    <asp:Label ID="ModifyDateLabel" runat="server" Text='<%# Eval("ModifyDate") %>' />
                </td>
            </tr>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr style="background-color:#008A8C;color: #FFFFFF;">
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                </td>
                <td>
                    <asp:Label ID="TransactionIDLabel1" runat="server" Text='<%# Eval("TransactionID") %>' />
                </td>
                <td>
                    <asp:TextBox ID="TransactionTypeTextBox" runat="server" Text='<%# Bind("TransactionType") %>' />
                </td>
                <td>
                    <asp:TextBox ID="AccountNumberTextBox" runat="server" Text='<%# Bind("AccountNumber") %>' />
                </td>
                <td>
                    <asp:TextBox ID="DestAccountTextBox" runat="server" Text='<%# Bind("DestAccount") %>' />
                </td>
                <td>
                    <asp:TextBox ID="AmountTextBox" runat="server" Text='<%# Bind("Amount") %>' />
                </td>
                <td>
                    <asp:TextBox ID="CommentTextBox" runat="server" Text='<%# Bind("Comment") %>' />
                </td>
                <td>
                    <asp:TextBox ID="ModifyDateTextBox" runat="server" Text='<%# Bind("ModifyDate") %>' />
                </td>
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                </td>
                <td>
                    <asp:TextBox ID="TransactionIDTextBox" runat="server" Text='<%# Bind("TransactionID") %>' />
                </td>
                <td>
                    <asp:TextBox ID="TransactionTypeTextBox" runat="server" Text='<%# Bind("TransactionType") %>' />
                </td>
                <td>
                    <asp:TextBox ID="AccountNumberTextBox" runat="server" Text='<%# Bind("AccountNumber") %>' />
                </td>
                <td>
                    <asp:TextBox ID="DestAccountTextBox" runat="server" Text='<%# Bind("DestAccount") %>' />
                </td>
                <td>
                    <asp:TextBox ID="AmountTextBox" runat="server" Text='<%# Bind("Amount") %>' />
                </td>
                <td>
                    <asp:TextBox ID="CommentTextBox" runat="server" Text='<%# Bind("Comment") %>' />
                </td>
                <td>
                    <asp:TextBox ID="ModifyDateTextBox" runat="server" Text='<%# Bind("ModifyDate") %>' />
                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="background-color:#DCDCDC;color: #000000;">
                <td>
                    <asp:Label ID="TransactionIDLabel" runat="server" Text='<%# Eval("TransactionID") %>' />
                </td>
                <td>
                    <asp:Label ID="TransactionTypeLabel" runat="server" Text='<%# Eval("TransactionType") %>' />
                </td>
                <td>
                    <asp:Label ID="AccountNumberLabel" runat="server" Text='<%# Eval("AccountNumber") %>' />
                </td>
                <td>
                    <asp:Label ID="DestAccountLabel" runat="server" Text='<%# Eval("DestAccount") %>' />
                </td>
                <td>
                    <asp:Label ID="AmountLabel" runat="server" Text='<%# Eval("Amount") %>' />
                </td>
                <td>
                    <asp:Label ID="CommentLabel" runat="server" Text='<%# Eval("Comment") %>' />
                </td>
                <td>
                    <asp:Label ID="ModifyDateLabel" runat="server" Text='<%# Eval("ModifyDate") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                            <tr runat="server" style="background-color:#DCDCDC;color: #000000;">
                                <th runat="server">TransactionID</th>
                                <th runat="server">TransactionType</th>
                                <th runat="server">AccountNumber</th>
                                <th runat="server">DestAccount</th>
                                <th runat="server">Amount</th>
                                <th runat="server">Comment</th>
                                <th runat="server">ModifyDate</th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                        <asp:DataPager ID="DataPager1" runat="server" PageSize="4">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <tr style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">
                <td>
                    <asp:Label ID="TransactionIDLabel" runat="server" Text='<%# Eval("TransactionID") %>' />
                </td>
                <td>
                    <asp:Label ID="TransactionTypeLabel" runat="server" Text='<%# Eval("TransactionType") %>' />
                </td>
                <td>
                    <asp:Label ID="AccountNumberLabel" runat="server" Text='<%# Eval("AccountNumber") %>' />
                </td>
                <td>
                    <asp:Label ID="DestAccountLabel" runat="server" Text='<%# Eval("DestAccount") %>' />
                </td>
                <td>
                    <asp:Label ID="AmountLabel" runat="server" Text='<%# Eval("Amount") %>' />
                </td>
                <td>
                    <asp:Label ID="CommentLabel" runat="server" Text='<%# Eval("Comment") %>' />
                </td>
                <td>
                    <asp:Label ID="ModifyDateLabel" runat="server" Text='<%# Eval("ModifyDate") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
</asp:ListView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MyDatabaseConnectionString %>" SelectCommand="SelectTransactions" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:SessionParameter DefaultValue="" Name="UserID" SessionField="UserAuthentication" Type="String" />
        <asp:ControlParameter ControlID="AccountSelector" Name="AccountNumber" PropertyName="SelectedValue" Type="Int32" />
    </SelectParameters>
    </asp:SqlDataSource>
<p>
</p>
</asp:Content>
