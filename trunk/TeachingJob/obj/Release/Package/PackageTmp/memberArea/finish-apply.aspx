﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="finish-apply.aspx.cs" Inherits="TeachingJob.memberArea.finish_apply" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <title>Finish apply - TeachinVietnam</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col span-9 last" id="member-nav">
        <div class="module">
            <h2>
                <asp:Literal ID="Literal1" runat="server" Text="<%$Resources:Resource,Dear %>"></asp:Literal>
                <asp:Literal ID="lbl_Username" runat="server"></asp:Literal>,
                <br />
            </h2>
            <h4>
                <asp:Literal ID="Literal2" runat="server" Text="<%$Resources:Resource,Yourresumehasbeensentto %>"></asp:Literal> 
                <asp:Label ID="lbl_org" runat="server" Text=""></asp:Label>.  
                <br />
                <asp:Literal ID="Literal3" runat="server" Text="<%$Resources:Resource,Wishyousuccess %>"></asp:Literal>
            </h4>
            <h4>
                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Account/my-jobs.aspx" Text="<%$Resources:Resource,Pleaseclickheretomanageyourjob %>"></asp:HyperLink>
                
            </h4>
        </div>
    </div>
    <div class="clear-floats">
    </div>
</asp:Content>
