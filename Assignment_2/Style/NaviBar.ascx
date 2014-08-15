<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NaviBar.ascx.cs" Inherits="Assignment_2.Style.NaviBar" %>

<div class="nav"> 
    <ul class="nav"> 
        <li><a runat="server" href="~/user/ATM.aspx">ATM</a></li> 
        <li><a runat="server" href="~/BillPay.aspx">Pay Bills</a></li> 
        <li><a runat="server" href="~/user/ManageBillPay.aspx">Manage scheduled payings</a></li> 
        <li><a runat="server" href="~/user/MyStatement.aspx">My Statements</a></li> 
        <li><a runat="server" href="~/user/MyProfile.aspx">My Profile</a></li> 
    </ul> 
</div> 
<br />