<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerDisplay.aspx.cs" Inherits="SportsPro.CustomerDisplay"
    MasterPageFile="~/SportsMaster.Master" Title="Project 1-A: Select Contacts" %>
<asp:Content ID="SelectContacts" ContentPlaceHolderID="mainPlaceholder" runat="server">
         <div class="form-group">
                <div class="col-sm-offset-1 col-sm-2">
                    <asp:Label ID="Label1" runat="server" Text="Select a customer:" CssClass="control-label"></asp:Label>
                </div>
                <div class="col-sm-4">
                    <asp:DropDownList ID="ddlCustomers" runat="server" CssClass="form-control" AutoPostBack="True"
                        DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="CustomerID">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                        ConnectionString='<%$ ConnectionStrings:ConnectionString %>'
                        SelectCommand="SELECT * FROM [Customers] ORDER BY [Name]"></asp:SqlDataSource>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-1 col-sm-2">
                    <asp:Label ID="Label2" runat="server" Text="Address:"></asp:Label>
                </div>
                <div class="col-sm-4">
                    <asp:Label ID="lblAddress" runat="server" Text="ADDRESS"></asp:Label>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-1 col-sm-2">
                    <asp:Label ID="Label3" runat="server" Text="Phone:"></asp:Label>
                </div>
                <div class="col-sm-4">
                    <asp:Label ID="lblPhone" runat="server" Text="PHONE"></asp:Label>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-1 col-sm-2">
                    <asp:Label ID="Label4" runat="server" Text="Email:"></asp:Label>
                </div>
                <div class="col-sm-4">
                    <asp:Label ID="lblEmail" runat="server" Text="EMAIL"></asp:Label>
                </div>
            </div>
            <div class="col-sm-offset-1">
                <asp:Button ID="btnAddContact" runat="server" Text="Add to Contact List"
                    CssClass="btn btn-primary" OnClick="btnAddContact_Click" />
                <asp:Button ID="btnDisplayContacts" runat="server" Text="Display Contact List"
                    CssClass="btn btn-primary" PostBackUrl="~/Administration/ContactDisplay" />
            </div>
            <div class="col-sm-offset-1">
                <div class="form-group">
                    <div class="col-sm-12">
                        <asp:Label ID="lblMessage" runat="server" EnableViewState="false"
                            CssClass="text-danger"></asp:Label>
                    </div>
                </div>
            </div>
   </asp:Content>
