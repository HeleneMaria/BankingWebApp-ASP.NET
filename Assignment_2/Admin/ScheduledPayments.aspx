<%@ Page Title="Scheduled Payments" Language="C#" MasterPageFile="~/Style/MasterPage.Master" AutoEventWireup="true" CodeBehind="ScheduledPayments.aspx.cs" Inherits="Assignment_2.Admin.ScheduledPayments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">



</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Label ID="title" runat="server" Text="Schedule Payments"></asp:Label>
    <br />
    <asp:ListView ID="ScheduleListView" runat="server" DataKeyNames="BillPayID" DataSourceID="SqlDataSource1" OnItemDataBound="ScheduleListView_ItemDataBound">
        <AlternatingItemTemplate>
            <tr style="background-color:#FFFFFF; color: #284775;">
                 <td>
                        <asp:Button ID="PauseButton" Text="Pause" runat="server" OnClick="PauseButton_Click" CommandArgument='<%# Eval("BillPayID") %>'></asp:Button>
                 </td>
                <td>
                        <asp:Label ID="BillPayIDLabel" runat="server" Text='<%# Eval("BillPayID") %>' />
                 </td>
                <td>
                    <asp:Label ID="AccountNumberLabel" runat="server" Text='<%# Eval("AccountNumber") %>' />
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
                <td>
                    <asp:Label ID="PauseFlagLabel" runat="server" Text='<%# Eval("PauseFlag") %>' />
                </td>
            </tr>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr style="background-color:#999999;">
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
                <td>
                    <asp:TextBox ID="PauseFlagTextBox" runat="server" Text='<%# Bind("PauseFlag") %>' />
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
                <td>
                    <asp:TextBox ID="PauseFlagTextBox" runat="server" Text='<%# Bind("PauseFlag") %>' />
                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="background-color:#E0FFFF; color: #333333;">
                 <td>
                        <asp:Button ID="PauseButton" Text="Pause" runat="server" OnClick="PauseButton_Click" CommandArgument='<%# Eval("BillPayID") %>'></asp:Button>
                 </td>
                 <td>
                        <asp:Label ID="BillPayIDLabel" runat="server" Text='<%# Eval("BillPayID") %>' />
                 </td>
                <td>
                    <asp:Label ID="AccountNumberLabel" runat="server" Text='<%# Eval("AccountNumber") %>' />
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
                <td>
                    <asp:Label ID="PauseFlagLabel" runat="server" Text='<%# Eval("PauseFlag") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                            <tr runat="server" style="background-color:#E0FFFF; color: #333333;">
                                <th></th>
                                <th runat="server">BillPayID</th>
                                <th runat="server">AccountNumber</th>
                                <th runat="server">Amount</th>
                                <th runat="server">ScheduleDate</th>
                                <th runat="server">Period</th>
                                <th runat="server">ModifyDate</th>
                                <th runat="server">PauseFlag</th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="text-align: center;background-color: #5D7B9D; font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF;">
                        <asp:DataPager ID="DataPager1" runat="server">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <tr style="background-color:#E2DED6; font-weight: bold;color: #333333;">
                <td>
                    <asp:Label ID="BillPayIDLabel" runat="server" Text='<%# Eval("BillPayID") %>' />
                </td>
                <td>
                    <asp:Label ID="AccountNumberLabel" runat="server" Text='<%# Eval("AccountNumber") %>' />
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
                <td>
                    <asp:Label ID="PauseFlagLabel" runat="server" Text='<%# Eval("PauseFlag") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MyDatabaseConnectionString %>" SelectCommand="SelectBillPayForUser" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="UserID" SessionField="CustomerChosen" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
&nbsp;
</asp:Content>