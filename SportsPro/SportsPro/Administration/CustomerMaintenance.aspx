<%@ Page Title="3-C: Maintain Customers" Language="C#" MasterPageFile="~/SportsMaster.Master" AutoEventWireup="true" CodeBehind="CustomerMaintenance.aspx.cs" Inherits="SportsPro.Administration.CustomerMaintenance" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceholder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainPlaceholder" runat="server">
    <div class="container">
        <div class="col-xs-12 col-sm-6">
            <div class="table-responsive">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                    DataKeyNames="CustomerID" DataSourceID="SqlDataSource1"
                    AllowPaging="True" AllowSorting="True" SelectedIndex="0"
                    CssClass="table table-bordered table-condensed table-striped"
                    OnPreRender="GridView1_PreRender">
                    <HeaderStyle BackColor="Black" Font-Bold="true" ForeColor="White"/>
                    <Columns>
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name"></asp:BoundField>
                        <asp:BoundField DataField="City" HeaderText="City" SortExpression="City"></asp:BoundField>
                        <asp:BoundField DataField="State" HeaderText="State" SortExpression="State"></asp:BoundField>
                        <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                    </Columns>
                    <PagerSettings Mode="NextPreviousFirstLast"
                        NextPageText=">" PreviousPageText="<"
                        FirstPageText="<<" LastPageText=">>" />
                    <PagerStyle BackColor="Black" Font-Bold="true" ForeColor="White" HorizontalAlign="Center"
                        CssClass="pagerStyle"/>
                    <SelectedRowStyle CssClass="warning" />
                </asp:GridView>
            </div>
        </div>
        <div class="table-responsive col-sm-6">
            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False"
                DataKeyNames="CustomerID" DataSourceID="SqlDataSource2"
                CssClass="table table-bordered table-condensed table-striped" HeaderText="Selected Customer"
                OnItemInserted="DetailsView1_ItemInserted" OnItemUpdated="DetailsView1_ItemUpdated"
                OnItemDeleted="DetailsView1_ItemDeleted">
                <HeaderStyle BackColor="Black" Font-Bold="true" ForeColor="White"/>
                <Fields>
                    <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" ReadOnly="True" InsertVisible="False" SortExpression="CustomerID"></asp:BoundField>
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name">
                        <ControlStyle CssClass="form-control" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address">
                        <ControlStyle CssClass="form-control" />
                    </asp:BoundField>
                    <asp:BoundField DataField="City" HeaderText="City" SortExpression="City">
                        <ControlStyle CssClass="form-control" />
                    </asp:BoundField>
                    <asp:BoundField DataField="State" HeaderText="State" SortExpression="State">
                        <ControlStyle CssClass="form-control" />
                    </asp:BoundField>
                    <asp:BoundField DataField="ZipCode" HeaderText="ZipCode" SortExpression="ZipCode">
                        <ControlStyle CssClass="form-control" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone">
                        <ControlStyle CssClass="form-control" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email">
                        <ControlStyle CssClass="form-control" />
                    </asp:BoundField>
                    <asp:CommandField ShowInsertButton="True" ShowEditButton="True" ShowDeleteButton="True"></asp:CommandField>
                </Fields>
                <CommandRowStyle BackColor="Black" Font-Bold="true" ForeColor="White"/>
            </asp:DetailsView>
        </div>
        <div class="col-xs-12">
            <asp:Label ID="lblErrorMsg" runat="server" EnableViewState="false" CssClass="text-danger"></asp:Label>
        </div>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
        ConnectionString='<%$ ConnectionStrings:ConnectionString %>'
        SelectCommand="SELECT [CustomerID], [Name], [City], [State] FROM [Customers] ORDER BY [Name]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConflictDetection="CompareAllValues" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' DeleteCommand="DELETE FROM [Customers] WHERE [CustomerID] = @original_CustomerID AND [Name] = @original_Name AND [Address] = @original_Address AND [City] = @original_City AND [State] = @original_State AND [ZipCode] = @original_ZipCode AND (([Phone] = @original_Phone) OR ([Phone] IS NULL AND @original_Phone IS NULL)) AND (([Email] = @original_Email) OR ([Email] IS NULL AND @original_Email IS NULL))" InsertCommand="INSERT INTO [Customers] ([Name], [Address], [City], [State], [ZipCode], [Phone], [Email]) VALUES (@Name, @Address, @City, @State, @ZipCode, @Phone, @Email)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Customers] WHERE ([CustomerID] = @CustomerID)" UpdateCommand="UPDATE [Customers] SET [Name] = @Name, [Address] = @Address, [City] = @City, [State] = @State, [ZipCode] = @ZipCode, [Phone] = @Phone, [Email] = @Email WHERE [CustomerID] = @original_CustomerID AND [Name] = @original_Name AND [Address] = @original_Address AND [City] = @original_City AND [State] = @original_State AND [ZipCode] = @original_ZipCode AND (([Phone] = @original_Phone) OR ([Phone] IS NULL AND @original_Phone IS NULL)) AND (([Email] = @original_Email) OR ([Email] IS NULL AND @original_Email IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_CustomerID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="original_Name" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_Address" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_City" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_State" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_ZipCode" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_Phone" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_Email" Type="String"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String"></asp:Parameter>
            <asp:Parameter Name="Address" Type="String"></asp:Parameter>
            <asp:Parameter Name="City" Type="String"></asp:Parameter>
            <asp:Parameter Name="State" Type="String"></asp:Parameter>
            <asp:Parameter Name="ZipCode" Type="String"></asp:Parameter>
            <asp:Parameter Name="Phone" Type="String"></asp:Parameter>
            <asp:Parameter Name="Email" Type="String"></asp:Parameter>
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" PropertyName="SelectedValue"
                Name="CustomerID" Type="Int32"></asp:ControlParameter>
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String"></asp:Parameter>
            <asp:Parameter Name="Address" Type="String"></asp:Parameter>
            <asp:Parameter Name="City" Type="String"></asp:Parameter>
            <asp:Parameter Name="State" Type="String"></asp:Parameter>
            <asp:Parameter Name="ZipCode" Type="String"></asp:Parameter>
            <asp:Parameter Name="Phone" Type="String"></asp:Parameter>
            <asp:Parameter Name="Email" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_CustomerID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="original_Name" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_Address" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_City" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_State" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_ZipCode" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_Phone" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_Email" Type="String"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
