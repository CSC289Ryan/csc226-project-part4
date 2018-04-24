<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerSurvey.aspx.cs" Inherits="SportsPro.CustomerSurvey"
    MasterPageFile="~/SportsMaster.Master" Title="Project 2-A: Customer Survey" %>
<asp:Content ID="SelectContacts" ContentPlaceHolderID="mainPlaceholder" runat="server">
            <div class="col-sm-offset-1">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="CustomerID"
                    CssClass="text-danger"/>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-1 col-sm-2">
                    <asp:Label ID="lblID" runat="server" Text="Enter your customer ID:" CssClass="control-label"></asp:Label>
                    <asp:RequiredFieldValidator ID="rfvCustomerID" runat="server" ErrorMessage="Customer ID is required"
                        Text="*" ControlToValidate="txtCustomerID" ValidationGroup="CustomerID"
                        CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="cmpCustomerID" runat="server"  ControlToValidate="txtCustomerID"
                        ErrorMessage="Enter an integer ID" CssClass="text-danger" ValidationGroup="CustomerID"
                        Operator="DataTypeCheck" Type="Integer" Text="*" Display="Dynamic"></asp:CompareValidator>
                </div>
                <div class="col-sm-2">
                    <asp:TextBox ID="txtCustomerID" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-2">
                    <asp:Button ID="btnGetIncidents" runat="server" Text="Get Incidents"
                        CssClass="btn btn-primary btn-block" ValidationGroup="CustomerID" OnClick="btnGetIncidents_Click"/>
                </div>
                <div class="col-sm-offset-1 col-sm-9">
                    <asp:Label ID="lblNoIncidents" runat="server" Visible="false" CssClass="text-danger"></asp:Label>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-1 col-sm-9">
                    <asp:ListBox ID="lstIncidents" runat="server" CssClass="form-control" Enabled="false"></asp:ListBox>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                        SelectCommand="Select IncidentID, CustomerID, ProductCode, TechID, DateOpened,
                        DateClosed, Title From Incidents Order By DateClosed"></asp:SqlDataSource>
                </div>
                <div class="col-sm-2">
                    <asp:RequiredFieldValidator ID="rfvIncidents" runat="server"
                        ControlToValidate="lstIncidents" CssClass="text-danger" Text="*"
                        ErrorMessage="Select an incident from the list" ValidationGroup="Incident"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-1 col-sm-11">
                    <asp:Label ID="lblRate" runat="server" Text="Please rate this incident by the following categories:" 
                        Font-Bold="True"></asp:Label>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-1 col-sm-2">
                    <asp:Label ID="lblResponseTime" runat="server" Text="Response time:" CssClass="control-label"></asp:Label>
                </div>
                <div class="col-sm-9">
                    <asp:RadioButtonList ID="rblResponseTime" runat="server" RepeatDirection="Horizontal" Enabled="false">
                        <asp:ListItem Value="1">Not satisfied</asp:ListItem>
                        <asp:ListItem Value="2">Somewhat satisfied</asp:ListItem>
                        <asp:ListItem Value="3">Satisfied</asp:ListItem>
                        <asp:ListItem Value="4" Selected="True">Completely satisfied</asp:ListItem>
                    </asp:RadioButtonList>
                </div>
                <div class="col-sm-offset-1 col-sm-2">
                    <asp:Label ID="lblEfficiency" runat="server" Text="Technician Efficiency:" CssClass="control-label"></asp:Label>
                </div>
                <div class="col-sm-9">
                    <asp:RadioButtonList ID="rblEfficiency" runat="server" RepeatDirection="Horizontal" Enabled="false">
                        <asp:ListItem Value="1">Not satisfied</asp:ListItem>
                        <asp:ListItem Value="2">Somewhat satisfied</asp:ListItem>
                        <asp:ListItem Value="3">Satisfied</asp:ListItem>
                        <asp:ListItem Value="4" Selected="True">Completely satisfied</asp:ListItem>
                    </asp:RadioButtonList>
                </div>
                <div class="col-sm-offset-1 col-sm-2">
                    <asp:Label ID="lblResolution" runat="server" Text="Problem resolution:" CssClass="control-label"></asp:Label>
                </div>
                <div class="col-sm-9">
                    <asp:RadioButtonList ID="rblResolution" runat="server" RepeatDirection="Horizontal" Enabled="false">
                        <asp:ListItem Value="1">Not satisfied</asp:ListItem>
                        <asp:ListItem Value="2">Somewhat satisfied</asp:ListItem>
                        <asp:ListItem Value="3">Satisfied</asp:ListItem>
                        <asp:ListItem Value="4" Selected="True">Completely satisfied</asp:ListItem>
                    </asp:RadioButtonList>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-1 col-sm-2">
                    <asp:Label ID="lblComments" runat="server" Text="Additional comments:"></asp:Label>
                </div>
                <div class="col-sm-7">
                    <asp:TextBox ID="txtComments" runat="server" Rows="4" CssClass="form-control"
                        TextMode="MultiLine" Enabled="false"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-1 col-sm-11">
                    <asp:CheckBox ID="chkContactMe" Text="Please contact me to discuss this incident"
                        Checked="true" runat="server" Enabled="false"/>
                </div>
                <div class="col-sm-offset-2">
                    <asp:RadioButton ID="rdoEmail" runat="server" Enabled="false"
                        Checked="true" GroupName="ContactBy" Text="Contact by email"/>
                </div>
                <div class="col-sm-offset-2">
                    <asp:RadioButton ID="rdoPhone" runat="server" Enabled="false"
                        GroupName="ContactBy" Text="Contact by phone"/>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-1 col-sm-2">
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit"  Enabled="false"
                        CssClass="btn btn-primary btn-block" ValidationGroup="Incident" OnClick="btnSubmit_Click"/>
                </div>
            </div>
            <div class="col-sm-offset-1">
                <asp:ValidationSummary ID="ValidationSummary2" runat="server" ValidationGroup="Incident"
                    CssClass="text-danger"/>
            </div>
</asp:Content>
