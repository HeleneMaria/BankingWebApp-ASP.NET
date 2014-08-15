<%@ Page Title="Unknown Error" Language="C#" MasterPageFile="~/Style/MasterPage.master" AutoEventWireup="true" CodeBehind="UnknownError.aspx.cs" Inherits="Assignment_2.ErrorPages.UnknownError" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Something happend.</h2>
    <p>
        The page you requested could not be loaded.
    </p>
    <p>
        You should go back to the <a runat="server" href="~/Default.aspx">Home</a> page and try something else.
    </p>
    
</asp:Content>
