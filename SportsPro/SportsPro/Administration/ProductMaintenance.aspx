<%@ Page Title="3-B: Maintain Products" Language="C#" MasterPageFile="~/SportsMaster.Master" AutoEventWireup="true" CodeBehind="ProductMaintenance.aspx.cs" Inherits="SportsPro.Administration.ProductMaintenance" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceholder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainPlaceholder" runat="server">
    <div class="container">
        <div class="col-xs-12">
            <div class="table-responsive">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                    DataKeyNames="ProductCode" DataSourceID="SqlDataSource1"
                    CssClass="table table-bordered table-condensed table-hover"
                     OnPreRender="GridView1_PreRender"
                     OnRowDeleted="GridView1_RowDeleted"
                     OnRowUpdated="GridView1_RowUpdated">
                    <HeaderStyle BackColor="Black" Font-Bold="true" ForeColor="White"/>
                    <Columns>
                        <asp:BoundField DataField="ProductCode" HeaderText="Product Code" ReadOnly="True" SortExpression="ProductCode">
                            <ItemStyle CssClass="col-xs-2" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Name" SortExpression="Name">
                            <EditItemTemplate>
                                <div class="col-xs-11">
                                    <asp:TextBox ID="txtNameEdit" runat="server" Text='<%# Bind("Name") %>'
                                        CssClass="form-control"></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                    ErrorMessage="Name is required" ControlToValidate="txtNameEdit"
                                    Text="*" CssClass="text-danger" ValidationGroup="Edit"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle CssClass="col-xs-4" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Version" SortExpression="Version">
                            <EditItemTemplate>
                                <div class="col-xs-11">
                                    <asp:TextBox ID="txtVersionEdit" runat="server" Text='<%# Bind("Version") %>'
                                        CssClass="form-control"></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                    ErrorMessage="Version is required" ControlToValidate="txtVersionEdit"
                                    Text="*" CssClass="text-danger" ValidationGroup="Edit"
                                    Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="cmpVersionEdit" runat="server"
                                    ErrorMessage="Version must be a decimal value" ControlToValidate="txtVersionEdit"
                                    CssClass="text-danger" ValidationGroup="Edit" Text="*"
                                     Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Version") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle CssClass="col-xs-2" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Release Date" SortExpression="ReleaseDate">
                            <EditItemTemplate>
                                <div class="col-xs-11">
                                    <asp:TextBox ID="txtReleaseDateEdit" runat="server" Text='<%# Bind("ReleaseDate", "{0:d}") %>'
                                        CssClass="form-control"></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                    ErrorMessage="Release Date is required" ControlToValidate="txtReleaseDateEdit"
                                    Text="*" CssClass="text-danger" ValidationGroup="Edit"
                                    Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="CompareValidator1" runat="server"
                                    ErrorMessage="Enter a valid release date" ControlToValidate="txtReleaseDateEdit"
                                    Text="*" CssClass="text-danger" ValidationGroup="Edit"
                                    Operator="DataTypeCheck" Type="Date"></asp:CompareValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("ReleaseDate", "{0:d}") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle CssClass="col-xs-2" />
                        </asp:TemplateField>
                        <asp:CommandField CausesValidation="true" ShowEditButton="True" ValidationGroup="Edit">
                            <ItemStyle CssClass="col-xs-1" />
                        </asp:CommandField>
                        <asp:CommandField ShowDeleteButton="True">
                            <ItemStyle CssClass="col-xs-1" />
                        </asp:CommandField>
                    </Columns>
                </asp:GridView>
                <asp:Label ID="lblUpdateDeleteError" runat="server" EnableViewState="false"
                    CssClass="text-danger"></asp:Label>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server"
                    ValidationGroup="Edit" CssClass="text-danger" HeaderText="Please correct the following errors:"/>
            </div>
            <div class="form-group">
                <div class="col-xs-12">
                    <asp:Label ID="Label5" runat="server"
                        Text="To add a new product, enter the product information and click Add Product"
                        CssClass="control-label"></asp:Label>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-2">
                    <asp:Label ID="Label1" runat="server" Text="Product Code:"
                        CssClass="control-label"></asp:Label>
                </div>
                <div class="col-sm-4">
                    <asp:TextBox ID="txtProductCode" runat="server"
                        CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-xs-6">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                        ErrorMessage="Product code is required" ControlToValidate="txtProductCode"
                        CssClass="text-danger" ValidationGroup="Add"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-2">
                    <asp:Label ID="Label2" runat="server" Text="Name:"
                        CssClass="control-label"></asp:Label>
                </div>
                <div class="col-sm-4">
                    <asp:TextBox ID="txtName" runat="server"
                        CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-xs-6">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                        ErrorMessage="Name is required" ControlToValidate="txtName"
                        CssClass="text-danger" ValidationGroup="Add"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-2">
                    <asp:Label ID="Label3" runat="server" Text="Version:"
                        CssClass="control-label"></asp:Label>
                </div>
                <div class="col-sm-4">
                    <asp:TextBox ID="txtVersion" runat="server"
                        CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-xs-6">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                        ErrorMessage="Version is required" ControlToValidate="txtVersion"
                        CssClass="text-danger" ValidationGroup="Add" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator3" runat="server"
                        ErrorMessage="Enter a decimal value" ControlToValidate="txtVersion"
                        CssClass="text-danger" ValidationGroup="Add"
                         Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-2">
                    <asp:Label ID="Label4" runat="server" Text="Release Date:"
                        CssClass="control-label"></asp:Label>
                </div>
                <div class="col-sm-4">
                    <asp:TextBox ID="txtReleaseDate" runat="server"
                        CssClass="form-control">mm/dd/yy</asp:TextBox>
                </div>
                <div class="col-xs-6">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server"
                        ErrorMessage="Release date is required" ControlToValidate="txtReleaseDate"
                        CssClass="text-danger" ValidationGroup="Add" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator2" runat="server"
                        ErrorMessage="Enter a valid date" ControlToValidate="txtReleaseDate"
                        CssClass="text-danger" ValidationGroup="Add"
                        Operator="DataTypeCheck" Type="Date" Display="Dynamic"></asp:CompareValidator>
                </div>
            </div>
            <div class="form-group">
                <div class="col-xs-12 col-sm-offset-2">
                    <asp:Button ID="btnAddProduct" runat="server" Text="Add Product"
                        CssClass="col-sm-2 btn btn-primary" OnClick="btnAddProduct_Click"
                        CausesValidation="true" ValidationGroup="Add"/>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-4">
                    <asp:Label ID="lblAddError" runat="server" EnableViewState="false" CssClass="text-danger"></asp:Label>
                </div>
            </div>
        </div>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                    ConflictDetection="CompareAllValues" ConnectionString='<%$ ConnectionStrings:ConnectionString %>'
                    DeleteCommand="DELETE FROM [Products] WHERE [ProductCode] = @original_ProductCode AND [Name] = @original_Name AND [Version] = @original_Version AND [ReleaseDate] = @original_ReleaseDate"
                    InsertCommand="INSERT INTO [Products] ([ProductCode], [Name], [Version], [ReleaseDate]) VALUES (@ProductCode, @Name, @Version, @ReleaseDate)" OldValuesParameterFormatString="original_{0}"
                    SelectCommand="SELECT * FROM [Products] ORDER BY [ProductCode]"
                    UpdateCommand="UPDATE [Products] SET [Name] = @Name, [Version] = @Version, [ReleaseDate] = @ReleaseDate WHERE [ProductCode] = @original_ProductCode AND [Name] = @original_Name AND [Version] = @original_Version AND [ReleaseDate] = @original_ReleaseDate">
                    <DeleteParameters>
                        <asp:Parameter Name="original_ProductCode" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_Name" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_Version" Type="Decimal"></asp:Parameter>
                        <asp:Parameter Name="original_ReleaseDate" Type="DateTime"></asp:Parameter>
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ProductCode" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Name" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Version" Type="Decimal"></asp:Parameter>
                        <asp:Parameter Name="ReleaseDate" Type="DateTime"></asp:Parameter>
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Name" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Version" Type="Decimal"></asp:Parameter>
                        <asp:Parameter Name="ReleaseDate" Type="DateTime"></asp:Parameter>
                        <asp:Parameter Name="original_ProductCode" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_Name" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_Version" Type="Decimal"></asp:Parameter>
                        <asp:Parameter Name="original_ReleaseDate" Type="DateTime"></asp:Parameter>
                    </UpdateParameters>
                </asp:SqlDataSource>      
    </div>
</asp:Content>
