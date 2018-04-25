<%@ Page Title="Project 2-C: Site Navigation" Language="C#" MasterPageFile="~/SportsMaster.Master" AutoEventWireup="true" CodeBehind="IncidentUpdate.aspx.cs" Inherits="SportsPro.IncidentUpdate" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceholder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainPlaceholder" runat="server">
    <div class="container">
        <div class="form-group">
            <asp:Label ID="Label1" runat="server" Text="Select a customer:"
                CssClass="col-xs-4 col-sm-offset-1 col-sm-2 control-label"></asp:Label>
            <div class="col-xs-6 col-sm-4">
                <asp:DropDownList ID="ddlCustomers" runat="server" 
                    ItemType="SportsPro.Models.Customer"
                    SelectMethod="ddlCustomers_GetData"
                    DataTextField="Name" DataValueField="CustomerID" AutoPostBack="true"
                    CssClass="form-control"></asp:DropDownList>
            </div>
        </div>
        <div class="form-group">
            <div class="col-xs-12 ">
                <asp:GridView ID="grdIncidents" runat="server"
                    AutoGenerateColumns="False" DataKeyNames="IncidentID"
                    ItemType="SportsPro.Models.Incident"
                    SelectMethod="grdIncidents_GetData"
                    UpdateMethod="grdIncidents_UpdateItem">
                    <HeaderStyle BackColor="Black" ForeColor="White" Font-Bold="true" />
                    <Columns>
                        <asp:BoundField DataField="IncidentID" HeaderText="ID" ReadOnly="true">
                            <ItemStyle CssClass="col-xs-1" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ProductCode" HeaderText="Product Code" ReadOnly="true">
                            <ItemStyle CssClass="col-xs-1" />
                        </asp:BoundField>
                        <asp:BoundField DataField="DateOpened" HeaderText="Date Opened" ReadOnly="true">
                            <ItemStyle CssClass="col-xs-1" />
                        </asp:BoundField>
                        <asp:BoundField DataField="DateClosed" HeaderText="Date Closed" ReadOnly="false">
                            <ItemStyle CssClass="col-xs-1" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Title" HeaderText="Title" ReadOnly="true">
                            <ItemStyle CssClass="col-xs-2" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Description">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Description") %>' Rows="4" MaxLength="2000" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle CssClass="col-xs-5" />
                        </asp:TemplateField>
                        <asp:CommandField ShowEditButton="true">
                            <ItemStyle CssClass="col-xs-1" />
                        </asp:CommandField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
