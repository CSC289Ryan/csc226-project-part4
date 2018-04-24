<%@ Page Title="Project 2-B: Contact Us" Language="C#" MasterPageFile="~/SportsMaster.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="SportsPro.ContactUs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceholder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainPlaceholder" runat="server">
    <div class="col-sm-offset-1">
        <div class="col-sm-12">
            <h2>How to contact us</h2>
            <p>If you ever have any questions or comments about our products, <br />
                please be sure to contact us in whatever way is most convenient for you.</p>
        </div>
        <div class="col-sm-2">Phone:</div>
        <div class="col-sm-10">
            1-800-555-0400<br />
            Weekdays, 8 to 5 Pacific Time
        </div>
        <div class="col-sm-2">Email:</div>
        <div class="col-sm-10">
            <asp:HyperLink ID="HyperLink1" runat="server" 
                NavigateUrl="mailto:sportspro@sportsprosoftware.com">sportspro@sportsprosoftware.com</asp:HyperLink>
        </div>
        <div class="col-sm-2">Fax:</div>
        <div class="col-sm-10">1-559-555-2732</div>
        <div class="col-sm-2">Address:</div>
        <div class="col-sm-10">
            SportsPro Software, Inc.<br />
            1500 N. Main Street<br />
            Fresno, California 93701
        </div>
    </div>
</asp:Content>
