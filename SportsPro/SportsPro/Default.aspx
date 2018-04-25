<%@ Page Title="4-D: Add User Authentication" Language="C#" MasterPageFile="~/SportsMaster.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SportsPro.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceholder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainPlaceholder" runat="server">
    <div class="col-xs-2 col-sm-offset-1 col-sm-6">
        <h1>Welcome!</h1>
        <div class="row">
        <asp:LoginView ID="LoginView1" runat="server">
            <AnonymousTemplate>
                <div class="col-xs-2">
                    <a runat="server" href="~/Account/Login">Login</a>
                </div>
                <div class="col-xs-4">
                    <a runat="server" href="~/Account/Register">Register</a>
                </div>
            </AnonymousTemplate>
            <LoggedInTemplate>
                <div class="col-xs-2">
                    <asp:LoginStatus runat="server" LogoutAction="Redirect"
                        LogoutText="Log out" LogoutPageUrl="~/"
                        OnLoggingOut="Unnamed_LoggingOut"/>
                </div>
                <div class="col-xs-4">
                    <a runat="server" href="~/Account/Manage">Manage Your Account</a>
                </div>
            </LoggedInTemplate>
        </asp:LoginView>
        </div>
    </div>
</asp:Content>
