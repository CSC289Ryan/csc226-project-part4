<%@ Page Title="4-B: Register Products" Language="C#" MasterPageFile="~/SportsMaster.Master" AutoEventWireup="true" CodeBehind="ProductRegistration.aspx.cs" Inherits="SportsPro.ProductRegistration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceholder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainPlaceholder" runat="server">
    <div class="container">
        <div class="form-group">
            <div class="col-xs-2 col-sm-offset-1">
                <asp:Label ID="lblCustomerID" runat="server" Text="Enter your customer ID:" CssClass="form-control-static"></asp:Label>
            </div>
            <div class="col-xs-2">
                <asp:TextBox ID="txtCustomerID" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-xs-2">
                <asp:Button ID="btnGetCustomer" runat="server" Text="Get Customer" CssClass="btn btn-primary"
                    OnClick="btnGetCustomer_Click"
                    CausesValidation="true" ValidationGroup="GetID"/>
                <asp:RequiredFieldValidator ID="rfvCustomerID" runat="server"
                    ControlToValidate="txtCustomerID"
                    ErrorMessage="Customer ID is required"
                    Text="*" CssClass="text-danger"
                    ValidationGroup="GetID"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="cmpCustomerID" runat="server"
                    ControlToValidate="txtCustomerID"
                    Operator="DataTypeCheck" Type="Integer"
                    ErrorMessage="Enter a positive integer ID"
                    Text="*" CssClass="text-danger"
                    ValidationGroup="GetID"></asp:CompareValidator>
                <asp:CustomValidator ID="cstmCustomerID" runat="server"
                    ControlToValidate="txtCustomerID"
                    ErrorMessage="No customer found for that ID"
                    Text="*" CssClass="text-danger"
                    OnServerValidate="cstmCustomerID_ServerValidate"
                    ValidationGroup="GetID"></asp:CustomValidator>
            </div>
        </div>
        <div class="form-group">
            <div class="col-xs-2 col-sm-offset-1">
                <asp:Label ID="lblCustomer" runat="server" Text="Customer:"></asp:Label>
            </div>
            <div class="col-xs-4">
                <asp:Label ID="lblName" runat="server" Text=""></asp:Label>
            </div>
        </div>
        <div class="form-group">
            <div class="col-xs-2 col-sm-offset-1">
                <asp:Label ID="lblProduct" runat="server" Text="Product:"></asp:Label>
            </div>
            <div class="col-xs-4">
                <asp:DropDownList ID="ddlProducts" runat="server"
                    CssClass="form-control" Enabled="false" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="ProductCode">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                    ConnectionString='<%$ ConnectionStrings:ConnectionString %>'
                    SelectCommand="SELECT * FROM [Products] ORDER BY [Name]"></asp:SqlDataSource>
            </div>
        </div>
        <div class="form-group">
            <div class="col-xs-2 col-sm-offset-1">
                <asp:Button ID="btnRegisterProduct" runat="server" Text="Register Product"
                    CssClass="btn btn-primary" Enabled="false" OnClick="btnRegisterProduct_Click"/>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' DeleteCommand="DELETE FROM [Registrations] WHERE [CustomerID] = @CustomerID AND [ProductCode] = @ProductCode" InsertCommand="INSERT INTO [Registrations] ([CustomerID], [ProductCode], [RegistrationDate]) VALUES (@CustomerID, @ProductCode, @RegistrationDate)" SelectCommand="SELECT * FROM [Registrations]" UpdateCommand="UPDATE [Registrations] SET [RegistrationDate] = @RegistrationDate WHERE [CustomerID] = @CustomerID AND [ProductCode] = @ProductCode">
                    <DeleteParameters>
                        <asp:Parameter Name="CustomerID" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="ProductCode" Type="String"></asp:Parameter>
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="CustomerID" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="ProductCode" Type="String"></asp:Parameter>
                        <asp:Parameter Name="RegistrationDate" Type="DateTime"></asp:Parameter>
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="RegistrationDate" Type="DateTime"></asp:Parameter>
                        <asp:Parameter Name="CustomerID" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="ProductCode" Type="String"></asp:Parameter>
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
        </div>
        <div class="form-group">
            <div class="col-xs-12 col-sm-offset-1">
                <asp:Label ID="lblError" runat="server" Text="" CssClass="text-danger"></asp:Label>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server"
                    ValidationGroup="GetID" CssClass="text-danger"/>
            </div>
        </div>
    </div>
</asp:Content>
