<%@ Page Title="Page Not Found" Language="C#" MasterPageFile="~/Style/MasterPage.master" AutoEventWireup="true" CodeBehind="404.aspx.cs" Inherits="Assignment_2.ErrorPages._404" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>This is not the page you are looking for.</h2>
    <p>
        The page you requested could not be found.
    </p>
    <p>
        You should go back to the <a runat="server" href="~/Default.aspx">Home</a> page and try something else.
    </p>
    
</asp:Content>
