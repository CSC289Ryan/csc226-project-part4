<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContactDisplay.aspx.cs" Inherits="SportsPro.ContactDisplay"
    MasterPageFile="~/SportsMaster.Master" Title="Project 1-B: Display Contacts" %>
<asp:Content ID="ContactDisplay" ContentPlaceHolderID="mainPlaceholder" runat="server">
            <div class="row col-sm-offset-1">
                <div class="form-group">
                    <div class="col-sm-12">Contact List:</div>
                    <div class="col-sm-6">
                        <asp:ListBox ID="lstContacts" runat="server" CssClass="form-control"></asp:ListBox>
                    </div>
                    <div class="col-sm-2">
                        <asp:Button ID="btnRemoveContact" runat="server" Text="Remove Contact" 
                            CssClass="btn btn-primary btn-block" OnClick="btnRemoveContact_Click" />
                        <asp:Button ID="btnEmptyContacts" runat="server" Text="Empty List"
                            CssClass="btn btn-primary btn-block" OnClick="btnEmptyContacts_Click" />
                    </div>
                </div>
            </div>
            <div class="row col-sm-offset-1">
                <div class="form-group">
                    <div class="col-sm-12">
                        <asp:Button ID="btnAddCustomers" runat="server" Text="Select Additional Customers" 
                            CssClass="btn btn-primary" PostBackUrl="~/Administration/CustomerDisplay"/>
                    </div>
                    <div class="col-sm-12">
                        <asp:Label ID="lblMessage" runat="server" EnableViewState="false"
                            CssClass="text-danger"></asp:Label>
                    </div>
                </div>
            </div>
</asp:Content>
