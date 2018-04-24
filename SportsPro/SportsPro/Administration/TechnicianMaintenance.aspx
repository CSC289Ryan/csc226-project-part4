<%@ Page Title="3-D: Maintain Technicians" Language="C#" MasterPageFile="~/SportsMaster.Master" AutoEventWireup="true" CodeBehind="TechnicianMaintenance.aspx.cs" Inherits="SportsPro.Administration.TechnicianMaintenance" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceholder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainPlaceholder" runat="server">
    <div class="container">
        <div class="form-group">
            <asp:Label ID="Label1" runat="server" Text="Select a technician:"
                CssClass="col-xs-4 col-sm-offset-1 col-sm-2 control-label"></asp:Label>
            <div class="col-xs-6 col-sm-4">
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1"
                DataTextField="Name" DataValueField="TechID" AutoPostBack="true"
                CssClass="form-control"></asp:DropDownList>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-12 col-sm-offset-1 col-sm-8">
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="TechID" DataSourceID="SqlDataSource2"
                    HeaderText="Selected Technician" CssClass="table table-responsive"
                    OnItemUpdated="FormView1_ItemUpdated"
                    OnItemDeleted="FormView1_ItemDeleted"
                    OnItemInserted="FormView1_ItemInserted">
                    <HeaderStyle BackColor="Black" Font-Bold="true" ForeColor="White"/>
                    <EditItemTemplate>
                        <div class="form-group">
                            <asp:Label ID="Label6" runat="server" Text="TechID:" CssClass="col-xs-12 col-sm-2"></asp:Label>
                            <div class="col-xs-9">
                                <asp:Label Text='<%# Eval("TechID") %>' runat="server" ID="TechIDLabel1" />
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="Label7" runat="server" Text="Name:" CssClass="col-xs-12 col-sm-2"></asp:Label>
                            <div class="col-xs-9">
                                <asp:TextBox Text='<%# Bind("Name") %>' runat="server" ID="NameTextBox" CssClass="form-control"/>
                            </div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                    ControlToValidate="NameTextBox" Display="Dynamic"
                                    ErrorMessage="Name is required" Text="*" CssClass="text-danger"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="Label8" runat="server" Text="Email:" CssClass="col-xs-12 col-sm-2"></asp:Label>
                            <div class="col-xs-9">
                                <asp:TextBox Text='<%# Bind("Email") %>' runat="server" ID="EmailTextBox" CssClass="form-control"/>
                            </div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                    ControlToValidate="EmailTextBox" Display="Dynamic"
                                    ErrorMessage="Email is required" Text="*" CssClass="text-danger"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                                    ControlToValidate="EmailTextBox" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                    ErrorMessage="Enter a valid email address" Text="*" CssClass="text-danger"></asp:RegularExpressionValidator>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="Label9" runat="server" Text="Phone:" CssClass="col-xs-12 col-sm-2"></asp:Label>
                            <div class="col-xs-9">
                                <asp:TextBox Text='<%# Bind("Phone") %>' runat="server" ID="PhoneTextBox" CssClass="form-control"/>
                            </div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                    ControlToValidate="PhoneTextBox" Display="Dynamic"
                                    ErrorMessage="Phone is required" Text="*" CssClass="text-danger"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                    ControlToValidate="PhoneTextBox" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"
                                    ErrorMessage="Phone format: (999) 999-9999" Text="*" CssClass="text-danger"></asp:RegularExpressionValidator>
                        </div>
                        <div>
                            <asp:LinkButton runat="server" Text="Update" CommandName="Update" ID="UpdateButton"
                                CausesValidation="True" />
                            &nbsp;<asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="UpdateCancelButton" CausesValidation="False" />
                        </div>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <div class="form-group">
                            <asp:Label ID="Label10" runat="server" Text="Name:" CssClass="col-xs-12 col-sm-2"></asp:Label>
                            <div class="col-xs-9">
                                <asp:TextBox Text='<%# Bind("Name") %>' runat="server" ID="NameTextBox" CssClass="form-control"/>
                            </div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                                    ControlToValidate="NameTextBox" Display="Dynamic"
                                    ErrorMessage="Name is required" Text="*" CssClass="text-danger"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="Label11" runat="server" Text="Email:" CssClass="col-xs-12 col-sm-2"></asp:Label>
                            <div class="col-xs-9">
                                <asp:TextBox Text='<%# Bind("Email") %>' runat="server" ID="EmailTextBox" CssClass="form-control"/>
                            </div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                                    ControlToValidate="EmailTextBox" Display="Dynamic"
                                    ErrorMessage="Email is required" Text="*" CssClass="text-danger"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
                                    ControlToValidate="EmailTextBox" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                    ErrorMessage="Enter a valid email address" Text="*" CssClass="text-danger"></asp:RegularExpressionValidator>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="Label12" runat="server" Text="Phone:" CssClass="col-xs-12 col-sm-2"></asp:Label>
                            <div class="col-xs-9">
                                <asp:TextBox Text='<%# Bind("Phone") %>' runat="server" ID="PhoneTextBox" CssClass="form-control"/>
                            </div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                                    ControlToValidate="PhoneTextBox" Display="Dynamic"
                                    ErrorMessage="Phone is required" Text="*" CssClass="text-danger"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server"
                                    ControlToValidate="PhoneTextBox" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"
                                    ErrorMessage="Phone format: (999) 999-9999" Text="*" CssClass="text-danger"></asp:RegularExpressionValidator>
                        </div>
                        <div>
                            <asp:LinkButton runat="server" Text="Insert" CommandName="Insert" ID="InsertButton" CausesValidation="True" />
                            &nbsp;<asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" />
                        </div>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <div class="form-group">
                                <asp:Label ID="Label2" runat="server" Text="TechID" CssClass="col-xs-4 col-sm-2"/>
                                <asp:Label Text='<%# Eval("TechID") %>' runat="server" ID="TechIDLabel" CssClass="col-xs-8 col-sm-8"/>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="Label3" runat="server" Text="Name:" CssClass="col-xs-4 col-sm-2"></asp:Label>
                            <asp:Label Text='<%# Bind("Name") %>' runat="server" ID="NameLabel" CssClass="col-xs-8 col-sm-8"/>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="Label4" runat="server" Text="Email:" CssClass="col-xs-4 col-sm-2"></asp:Label>
                            <asp:Label Text='<%# Bind("Email") %>' runat="server" ID="EmailLabel" CssClass="col-xs-8 col-sm-8"/>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="Label5" runat="server" Text="Phone:" CssClass="col-xs-4 col-sm-2"></asp:Label>
                            <asp:Label Text='<%# Bind("Phone") %>' runat="server" ID="PhoneLabel" CssClass="col-xs-8 col-sm-8"/>
                        </div>
                        <div>
                            <asp:LinkButton runat="server" Text="Edit" CommandName="Edit" ID="EditButton" CausesValidation="False" />
                            &nbsp;<asp:LinkButton runat="server" Text="Delete" CommandName="Delete" ID="DeleteButton" CausesValidation="False" />
                            &nbsp;<asp:LinkButton runat="server" Text="New" CommandName="New" ID="NewButton" CausesValidation="False" />
                        </div>
                    </ItemTemplate>
                </asp:FormView>
                <asp:Label ID="lblErrorMsg" runat="server" EnableViewState="false" CssClass="col-xs-12 text-danger"></asp:Label>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                    ConnectionString='<%$ ConnectionStrings:ConnectionString %>'
                    SelectCommand="SELECT [TechID], [Name] FROM [Technicians] ORDER BY [Name]"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                    ConnectionString='<%$ ConnectionStrings:ConnectionString %>' ConflictDetection="CompareAllValues"
                    SelectCommand="SELECT * FROM [Technicians] WHERE ([TechID] = @TechID)"
                    DeleteCommand="DELETE FROM [Technicians] WHERE [TechID] = @original_TechID AND [Name] = @original_Name AND [Email] = @original_Email AND [Phone] = @original_Phone"
                    InsertCommand="INSERT INTO [Technicians] ([Name], [Email], [Phone]) VALUES (@Name, @Email, @Phone)"
                    OldValuesParameterFormatString="original_{0}"
                    UpdateCommand="UPDATE [Technicians] SET [Name] = @Name, [Email] = @Email, [Phone] = @Phone WHERE [TechID] = @original_TechID AND [Name] = @original_Name AND [Email] = @original_Email AND [Phone] = @original_Phone">
                    <DeleteParameters>
                        <asp:Parameter Name="original_TechID" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="original_Name" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_Email" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_Phone" Type="String"></asp:Parameter>
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Name" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Email" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Phone" Type="String"></asp:Parameter>
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" PropertyName="SelectedValue" Name="TechID" Type="Int32"></asp:ControlParameter>
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Name" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Email" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Phone" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_TechID" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="original_Name" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_Email" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_Phone" Type="String"></asp:Parameter>
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
            <div class="col-sm-3">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server"
                    HeaderText="Please fix the errors below:" CssClass="text-danger"/>
            </div>
        </div>
    </div>
</asp:Content>
