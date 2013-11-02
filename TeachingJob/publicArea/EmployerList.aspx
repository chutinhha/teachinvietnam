<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="EmployerList.aspx.cs" Inherits="TeachingJob.publicArea.EmployerList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    <title>School List - TeachinVietnam</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../css/teacher.css" rel="Stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class='col span-8'>
        <div class='component component-CurrentlyRecruiting'>
            <div class="module ">
                <div id="currently-recruiting-outer">
                    <div class="module-title">
                        <h2>
                            <asp:Literal ID="Literal2" runat="server" Text="Employer list"></asp:Literal></h2>
                    </div>
                    <div class="standard-form1">
                        <h3 class="group-title top">
                            <asp:Literal ID="Literal3" runat="server" Text="See employers around you"></asp:Literal></h3>
                        <table style="width: 100%">
                            <tr>
                                <td class="cot25">
                                    Please select a location:
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddl_city" runat="server" OnDataBound="ddl_city_DataBound" CssClass="input"
                                        EnableViewState="true" ToolTip="<%$Resources:Resource,Pleaseselectalocation %>">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="getOrg"
                                        CssClass="failureNotification" ControlToValidate="ddl_city" runat="server" ErrorMessage="Please select a location"
                                        Display="Dynamic"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <asp:Button ID="btn_Submit" runat="server" Text="Get School list" ValidationGroup="getOrg"
                                        CssClass="standard-button orange small" OnClick="btn_Submit_Click" />
                                </td>
                            </tr>
                        </table>
                        <div class="clear-floats">
                        </div>
                    </div>
                    <%--<div class="standard-form1 ">
                        <h3 class="group-title top">
                            <asp:Literal ID="Literal12" runat="server" Text="Courses"></asp:Literal></h3>
                        <asp:Repeater ID="Repeater_Org" runat="server" OnItemDataBound="Repeater_Org_DataBind">
                        <ItemTemplate>
                            <div class="t_wrap">
                                <asp:HyperLink ID="hpl_OrgName" runat="server"></asp:HyperLink>
                            </div>
                        </ItemTemplate>
                        </asp:Repeater>
                        <div class="clear-floats"></div>
                    </div>   --%>
                </div>
            </div>
        </div>
    </div>
    <div class='col span-8'>
        <div class='component component-LatestJobs'>
            <div class="module public-sector">
                <div class="module-title">
                    <h2>
                        <asp:Literal ID="Literal1" runat="server" Text="Schools"></asp:Literal></h2>
                    <div class="clear-floats">
                    </div>
                </div>
                <div id="All-tab" class="job-type-tab show">
                    <table class="latest-jobs public-sector">
                        <tr class="header">
                            <th class="title paddingleft">
                                <asp:Literal ID="Literal8" runat="server" Text="School name"></asp:Literal>
                            </th>
                            <th class="salary">
                                <asp:Literal ID="Literal9" runat="server" Text="School type"></asp:Literal>
                            </th>
                        </tr>
                        <asp:Repeater ID="Repeater_Org" runat="server" OnItemDataBound="Repeater_Org_DataBind">
                            <ItemTemplate>
                                <tr>
                                    <td class="job-title">
                                        <asp:HyperLink ID="hpl_OrgName" runat="server"></asp:HyperLink>
                                    </td>
                                    <td class="salary">
                                        <asp:Label ID="lbl_SchoolType" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </table>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
