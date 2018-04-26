<%@ Page Title="4-C: Add error handling" Language="C#" MasterPageFile="~/SportsMaster.Master" AutoEventWireup="true" CodeBehind="NoAccess.aspx.cs" Inherits="SportsPro.NoAccess" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceholder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainPlaceholder" runat="server">
    <div class="container">
        <div class="col-xs-12 col-sm-offset-1 col-sm-10">
            <div class="form-group">
                <h1>Forbidden Request</h1>
            </div>
            <div class="form-group">
                <asp:Label ID="lblErrorMsg" runat="server"
                    Text="You do not have permission to access the requested resource." CssClass="text-danger"></asp:Label>
            </div>
            <div class="form-group">
                <asp:Button ID="btnReturn" runat="server" Text="Return to Home Page"
                    CssClass="btn btn-primary col-xs-3" OnClick="btnReturn_Click"/>
            </div>
        </div>
    </div>
</asp:Content>
