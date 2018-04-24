<%@ Page Title="3-A: Customer Incidents" Language="C#" MasterPageFile="~/SportsMaster.Master" AutoEventWireup="true" CodeBehind="CustomerIncidentDisplay.aspx.cs" Inherits="SportsPro.CustomerIncidentDisplay" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceholder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainPlaceholder" runat="server">
    <div class="container">
        <div class="form-group">
            <asp:Label ID="Label1" runat="server" Text="Select a customer:"
                CssClass="col-xs-4 col-sm-offset-1 col-sm-2 control-label"></asp:Label>
            <div class="col-xs-6 col-sm-4">
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1"
                DataTextField="Name" DataValueField="CustomerID" AutoPostBack="true"
                CssClass="form-control"></asp:DropDownList>
            </div>
        </div>
        <div class="form-group">
            <div class="col-xs-12 col-sm-offset-1 col-sm-10">
                <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource2"
                    DataKeyField="CustomerID" CssClass="table table-bordered table-condensed table-striped" OnPreRender="DataList1_PreRender">
                    <HeaderTemplate>
                        <span class="col-xs-5 col-sm-4">Product/Incident</span>
                        <span class="col-xs-3 col-sm-4">Tech Name</span>
                        <span class="col-xs-2">Opened</span>
                        <span class="col-xs-2">Closed</span>
                    </HeaderTemplate>
                    <HeaderStyle BackColor="Black" Font-Bold="true" ForeColor="White"/>
                    <ItemTemplate>
                        <div class="row">
                            <div class="col-xs-12">
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("Expr3") %>' CssClass="col-xs-5 col-sm-4"></asp:Label>
                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("Name") %>' CssClass="col-xs-3 col-sm-4"></asp:Label>
                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("DateOpened", "{0:d}") %>' CssClass="col-xs-2"></asp:Label>
                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("DateClosed", "{0:d}") %>' CssClass="col-xs-2"></asp:Label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <asp:Label ID="Label6" runat="server" Text='<%# Eval("Description") %>' CssClass="col-xs-12"></asp:Label>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
                <asp:Label ID="lblNoData" runat="server" Text="No incidents for this customer."
                    Visible="false" CssClass="col-xs-12"></asp:Label>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                    ConnectionString='<%$ ConnectionStrings:ConnectionString %>'
                    SelectCommand="SELECT [CustomerID], [Name] FROM [Customers] ORDER BY [Name]"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                    ConnectionString='<%$ ConnectionStrings:ConnectionString %>'
                    SelectCommand="SELECT I.IncidentID, I.CustomerID, I.ProductCode, I.TechID, I.DateOpened, I.DateClosed, I.Title, I.Description, T.TechID AS Expr1, T.Name, T.Email, T.Phone, P.ProductCode AS Expr2, P.Name AS Expr3, P.Version, P.ReleaseDate FROM Incidents AS I LEFT JOIN Technicians AS T ON I.TechID = T.TechID LEFT JOIN Products AS P ON I.ProductCode = P.ProductCode WHERE (I.CustomerID = @CustomerID)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" PropertyName="SelectedValue" Name="CustomerID"></asp:ControlParameter>
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>
</asp:Content>
