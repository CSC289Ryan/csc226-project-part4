<%@ Page Title="4-C: Add error handling" Language="C#" MasterPageFile="~/SportsMaster.Master" AutoEventWireup="true" CodeBehind="ErrorMessage.aspx.cs" Inherits="SportsPro.ErrorMessage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceholder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainPlaceholder" runat="server">
    <div class="container">
        <div class="col-xs-12 col-sm-offset-1 col-sm-10">
            <div class="form-group">
                <h1>An unrecoverable error has occurred.</h1>
            </div>
            <div class="form-group">
                <asp:Label ID="lblErrorMsg" runat="server" Text="DUMMY" CssClass="text-danger"></asp:Label>
            </div>
            <div class="form-group">
                <asp:Button ID="btnReturn" runat="server" Text="Return" CssClass="btn btn-primary col-xs-2" OnClick="btnReturn_Click"/>
            </div>
        </div>
    </div>
</asp:Content>
