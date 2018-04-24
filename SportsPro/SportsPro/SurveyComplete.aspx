<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SurveyComplete.aspx.cs" Inherits="SportsPro.SurveyComplete"
    MasterPageFile="~/SportsMaster.Master" Title="Project 2-A: Survey Complete" %>
<asp:Content ID="SelectContacts" ContentPlaceHolderID="mainPlaceholder" runat="server">
            <div class="form-group">
                <div class="col-sm-offset-1 col-sm-9">
                    <asp:Label ID="lblThanks" runat="server" Text="Thank you for your feedback!"
                        CssClass="text-primary control-label" Font-Size="Large" Font-Bold="true"></asp:Label>
                </div>
                <div class="col-sm-offset-1 col-sm-9">
                    <asp:Label ID="lblMsg" runat="server" 
                        CssClass="text-primary control-label"></asp:Label>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-1 col-sm-2">
                    <asp:Button ID="btnReturn" runat="server" Text="Return to Survey" 
                        PostBackUrl="~/CustomerSupport/CustomerSurvey" CssClass="btn btn-block btn-primary"/>
                </div>
            </div>
</asp:Content>
