<%@ Page Title="" Language="C#" MasterPageFile="~/Style/MasterPage.Master" AutoEventWireup="true" CodeBehind="ManageBillPay.aspx.cs" Inherits="Assignment_2.User.ManageBillPay" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        Select Account:<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" DataSourceID="SqlDataSource1" DataTextField="FullAccount" DataValueField="AccountNumber" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
        </asp:DropDownList>
&nbsp;<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MyDatabaseConnectionString %>" SelectCommand="SelectAccounts" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="UserID" SessionField="UserAuthentication" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>

    <p>
        <asp:ListView ID="BillPayListView" runat="server" DataKeyNames="BillPayID" DataSourceID="SqlDataSource2">
            <AlternatingItemTemplate>
                <tr style="background-color:#FFF8DC; ">
                    <td>
                        <asp:Button ID="EditButton" runat="server" AutoPostBack="true" Text="Edit" OnCommand="EditButtonClick" CommandArgument='<%# Eval("BillPayID") %>'></asp:Button>
                    </td>
                    <td>
                        <asp:Label ID="BillPayIDLabel" runat="server" Text='<%# Eval("BillPayID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="AccountNumberLabel" runat="server" Text='<%# Eval("AccountNumber") %>' />
                    </td>
                    <td>
                        <asp:Label ID="PayeeIDLabel" runat="server" Text='<%# Eval("PayeeID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="AmountLabel" runat="server" Text='<%# Eval("Amount") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ScheduleDateLabel" runat="server" Text='<%# Eval("ScheduleDate") %>' />
                    </td>
                    <td>
                        <asp:Label ID="PeriodLabel" runat="server" Text='<%# Eval("Period") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ModifyDateLabel" runat="server" Text='<%# Eval("ModifyDate") %>' />
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <tr style="background-color:#008A8C; color: #FFFFFF;">
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    </td>
                    <td>
                        <asp:Label ID="BillPayIDLabel1" runat="server" Text='<%# Eval("BillPayID") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="AccountNumberTextBox" runat="server" Text='<%# Bind("AccountNumber") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="PayeeIDTextBox" runat="server" Text='<%# Bind("PayeeID") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="AmountTextBox" runat="server" Text='<%# Bind("Amount") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="ScheduleDateTextBox" runat="server" Text='<%# Bind("ScheduleDate") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="PeriodTextBox" runat="server" Text='<%# Bind("Period") %>' />
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
                    <td>&nbsp;</td>
                    <td>
                        <asp:TextBox ID="AccountNumberTextBox" runat="server" Text='<%# Bind("AccountNumber") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="PayeeIDTextBox" runat="server" Text='<%# Bind("PayeeID") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="AmountTextBox" runat="server" Text='<%# Bind("Amount") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="ScheduleDateTextBox" runat="server" Text='<%# Bind("ScheduleDate") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="PeriodTextBox" runat="server" Text='<%# Bind("Period") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="ModifyDateTextBox" runat="server" Text='<%# Bind("ModifyDate") %>' />
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="background-color:#DCDCDC; color: #000000;">
                    <td>
                        <asp:Button ID="EditButton" runat="server" AutoPostBack="true" Text="Edit" OnCommand="EditButtonClick" CommandArgument='<%# Eval("BillPayID") %>'></asp:Button>
                    </td>
                    <td>
                        <asp:Label ID="BillPayIDLabel" runat="server" Text='<%# Eval("BillPayID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="AccountNumberLabel" runat="server" Text='<%# Eval("AccountNumber") %>' />
                    </td>
                    <td>
                        <asp:Label ID="PayeeIDLabel" runat="server" Text='<%# Eval("PayeeID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="AmountLabel" runat="server" Text='<%# Eval("Amount") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ScheduleDateLabel" runat="server" Text='<%# Eval("ScheduleDate") %>' />
                    </td>
                    <td>
                        <asp:Label ID="PeriodLabel" runat="server" Text='<%# Eval("Period") %>' />
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
                                <tr runat="server" style="background-color:#DCDCDC; color: #000000;">
                                    <th></th>
                                    <th runat="server">BillPayID</th>
                                    <th runat="server">AccountNumber</th>
                                    <th runat="server">PayeeID</th>
                                    <th runat="server">Amount</th>
                                    <th runat="server">ScheduleDate</th>
                                    <th runat="server">Period</th>
                                    <th runat="server">ModifyDate</th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center;background-color: #CCCCCC; font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                            <asp:DataPager ID="DataPager1" runat="server" PageSize="5">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <tr style="background-color:#008A8C; font-weight: bold;color: #FFFFFF;">
                    <td>
                        <asp:Label ID="BillPayIDLabel" runat="server" Text='<%# Eval("BillPayID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="AccountNumberLabel" runat="server" Text='<%# Eval("AccountNumber") %>' />
                    </td>
                    <td>
                        <asp:Label ID="PayeeIDLabel" runat="server" Text='<%# Eval("PayeeID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="AmountLabel" runat="server" Text='<%# Eval("Amount") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ScheduleDateLabel" runat="server" Text='<%# Eval("ScheduleDate") %>' />
                    </td>
                    <td>
                        <asp:Label ID="PeriodLabel" runat="server" Text='<%# Eval("Period") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ModifyDateLabel" runat="server" Text='<%# Eval("ModifyDate") %>' />
                    </td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MyDatabaseConnectionString %>" SelectCommand="SelectBillPayForAccount" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="AccountNo" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        &nbsp;</p>
</asp:Content>
