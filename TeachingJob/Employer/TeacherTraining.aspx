<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TeacherTraining.aspx.cs" Inherits="TeachingJob.Employer.TeacherTraining" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
<title>Teacher Training</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="server">
<link type="text/css" rel="Stylesheet" href="../memberArea/style.css" />
<link href="../css/content.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
    function showhideOnStartUp() {
        var country = document.getElementById('<%= ddlCitizenship.ClientID %>').value;

        if (country == 'Vietnam') {
            document.getElementById('city').style.display = 'inline';
        } else {
            document.getElementById('city').style.display = 'none';
        }

        var v = document.getElementById('<%= OrganizationType.ClientID %>').value;
        if (v.indexOf('K-12') != -1) {
            document.getElementById('example5').style.display = 'inline';
        } else {
            document.getElementById('example5').style.display = 'none';
        }
    }
    function textCounter(field, countfield, maxlimit) {
        var Label1 = document.getElementById(countfield);
        if (field.value.length > maxlimit)
            field.value = field.value.substring(0, maxlimit);
        Label1.innerText = (maxlimit - field.value.length) + ' characters remaining';
    }
    function textCounter2(field, countfield, maxlimit) {
        var Label1 = document.getElementById(countfield);
        if (field.value.length > maxlimit)
            field.value = field.value.substring(0, maxlimit);
        Label1.innerText = (maxlimit - field.value.length) + ' characters remaining';
    }
</script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
 <div class='col span-8'>
        <div class='component component-CurrentlyRecruiting'>
            <div class="module ">
                <div id="currently-recruiting-outer">
                    <div class="module-title">
                        <h2>
                            <asp:Literal ID="Literal2" runat="server" Text="Add teacher training course"></asp:Literal></h2>
                    </div>
                    <div class="standard-form1 ">
                        <h3 class="group-title top">
                            <asp:Literal ID="Literal3" runat="server" Text="Organization information"></asp:Literal></h3>
                        <table style="width: 100%">
                            <tr>
                                <td class="style1_PostJob padding">
                                    <asp:Label ID="lbl_OrgName" runat="server" Text="School/organization name"
                                        CssClass="bold"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_OrgName" Width="350px" runat="server" CssClass="font bold input"
                                        ViewStateMode="Enabled" MaxLength="200" ReadOnly="true"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="<%$Resources:Resource,Pleaseinputthejobtitle %>"
                                        Text="*" ControlToValidate="txt_OrgName" Display="Dynamic" ValidationGroup="Main"
                                        CssClass="failureNotification"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1_PostJob padding">
                                    <asp:Literal ID="Literal4" runat="server" Text="School type"></asp:Literal></td>
                                <td>
                                    <script type="text/javascript">
                                        function displaySalaryPanel(ddlId) {
                                            var ControlName = document.getElementById(ddlId.id);

                                            if (ControlName.value.indexOf('K-12') != -1) {
                                                document.getElementById('example5').style.display = 'inline';
                                            } else {
                                                document.getElementById('example5').style.display = 'none';
                                            }
                                        }
                                    </script>
                                    <asp:DropDownList ID="OrganizationType" runat="server" CssClass="input" onchange="displaySalaryPanel(this)" Enabled="false"
                                       OnSelectedIndexChanged="OrganizationType_IndexChanged" ViewStateMode="Enabled">
                                    </asp:DropDownList>
                                    <div id="example5" style="padding-top: 5px; display: none">
                                        <asp:DropDownList ID="ddl_SchoolType" runat="server" CssClass="input" Enabled="false">
                                        </asp:DropDownList>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1_PostJob_topValgin padding">
                                    <asp:Literal ID="Literal5" runat="server" Text="Location"></asp:Literal></td>
                                <td>
                                    <script type="text/javascript">
                                        function showhidecitizen(ddlId) {
                                            var ControlName = document.getElementById(ddlId.id);

                                            if (ControlName.value == 'Vietnam') {
                                                document.getElementById('city').style.display = 'inline';
                                            } else {
                                                document.getElementById('city').style.display = 'none';
                                            }
                                        }
                                    </script>
                                    <asp:DropDownList ID="ddlCitizenship" runat="server" CssClass="input" onchange="showhidecitizen(this)"
                                       OnSelectedIndexChanged="Country_IndexChanged"  ViewStateMode="Enabled"  Enabled="false">
                                    </asp:DropDownList>
                                    <div id="city" style="display: none; padding-top: 10px;">
                                        <asp:DropDownList ID="ddlJobLocation" runat="server" CssClass="input" Enabled="false">
                                        </asp:DropDownList>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1_PostJob padding">
                                    <asp:Literal ID="Literal6" runat="server" Text="Website"></asp:Literal></td>
                                <td><asp:TextBox ID="txt_website" ReadOnly="true" runat="server" Width="180px"></asp:TextBox></td>
                            </tr>
                        </table>
                        <div class="clear-floats">
                        </div>
                    </div>
                    <div class="standard-form1 ">
                        <h3 class="group-title top">
                            <asp:Literal ID="Literal1" runat="server" Text="Course information"></asp:Literal></h3>
                        <table style="width: 100%">
                            <tr>
                                <td class="style1_PostJob padding">
                                    <asp:Label ID="Label1" runat="server" Text="Certificate/Qualification" CssClass="bold"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Certificate" Width="350px" runat="server" CssClass="font input"
                                        ViewStateMode="Enabled" MaxLength="200"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter certificate"
                                        Text="*" ControlToValidate="txt_Certificate" Display="Dynamic" ValidationGroup="Main"
                                        CssClass="failureNotification"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1_PostJob padding">
                                    <asp:Label ID="Label3" runat="server" Text="Length (number of hours)" CssClass="bold"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_CourseLength" Width="250px" runat="server" CssClass="font input"
                                        ViewStateMode="Enabled" MaxLength="200"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1_PostJob padding">
                                    <asp:Label ID="Label2" runat="server" Text="Timetable" CssClass="bold"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_timetable" Width="250px" runat="server" CssClass="font input"
                                        ViewStateMode="Enabled" MaxLength="200"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1_PostJob padding">
                                    <asp:Label ID="Label4" runat="server" Text="Cost (including registration fee)" CssClass="bold"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Cost" Width="250px" runat="server" CssClass="font input"
                                        ViewStateMode="Enabled" MaxLength="200"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Please enter registration fee"
                                        Text="*" ControlToValidate="txt_Cost" Display="Dynamic" ValidationGroup="Main"
                                        CssClass="failureNotification"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1_PostJob padding">
                                    <asp:Label ID="Label5" runat="server" Text="Entry requirements" CssClass="bold"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_EntryRequirement" Width="250px" runat="server" CssClass="font input"
                                        ViewStateMode="Enabled" MaxLength="200"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1_PostJob padding">
                                    <asp:Label ID="Label6" runat="server" Text="Contact information" CssClass="bold"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_ContactInfo" Width="250px" runat="server" CssClass="font input"
                                        ViewStateMode="Enabled" MaxLength="200"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1_PostJob_topValgin padding">
                                    <asp:Label ID="Label7" runat="server" Text="Course content" CssClass="bold"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_CourseContent" Width="350px" runat="server" CssClass="font input"
                                        ViewStateMode="Enabled" MaxLength="200" TextMode="MultiLine"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please enter content of the course"
                                        Text="*" ControlToValidate="txt_CourseContent" Display="Dynamic" ValidationGroup="Main"
                                        CssClass="failureNotification"></asp:RequiredFieldValidator>
                                        <br />
                                    <asp:Label ID="Label9" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1_PostJob_topValgin padding">
                                    <asp:Label ID="Label8" runat="server" Text="Teacher’s Benefits" CssClass="bold"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_benefit" Width="350px" runat="server" TextMode="MultiLine" CssClass="font input"
                                        ViewStateMode="Enabled" MaxLength="200"></asp:TextBox>
                                        <br />
                                        <asp:Label ID="Label10" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                        </table>
                        <div class="clear-floats">
                        </div>
                    </div>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="Main"
                        CssClass="failureNotification" />
                    <div class="button alignright" style="width: 100%">
                        <asp:Button ID="btnPostJob" runat="server" Text="<%$Resources:Resource,Post %>" CssClass="standard-button orange"
                            OnClick="btnPost_Click" ValidationGroup="Main" />
                        <asp:Button ID="btnCancel" runat="server" Text="<%$Resources:Resource,Cancel %>"
                            CssClass="standard-button small" OnClick="btnCancel_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col span-31 last" id="member-nav">
    <div class="module">
        <p class="home">
            <span class="icon"></span><a id="A1" href="~/Employer/EmployerSite.aspx" runat="server">
                <asp:Literal ID="Literal78" runat="server" Text="<%$Resources:Resource,Employermanagement %>"></asp:Literal></a></p>
        <div id="my-cvs">
            <h3>
                <span class="icon"></span>
                <asp:Literal ID="Literal7" runat="server" Text="<%$Resources:Resource,MyJobs %>"></asp:Literal></h3>
            <ul>
                <li><a id="A2" href="~/memberArea/AdsAJob.aspx" runat="server">
                    <asp:Literal ID="Literal88" runat="server" Text="<%$Resources:Resource,CreateaJob %>"></asp:Literal></a></li>
                <li class="rightselected"><a id="A3" href="~/Employer/TeacherTraining.aspx" runat="server">
                    <asp:Literal ID="Literal8" runat="server" Text="Post a training course"></asp:Literal></a></li>
            </ul>
        </div>
        <div id="my-jobs">
            <h3>
                <span class="icon"></span>
                <asp:Literal ID="Literal9" runat="server" Text="<%$Resources:Resource,JobsManagement %>"></asp:Literal></h3>
            <ul>
                <li><a id="posted" href="~/Employer/JobsManagement.aspx" runat="server">
                    <asp:Literal ID="Literal10" runat="server" Text="<%$Resources:Resource,MyPostedJobs %>"></asp:Literal></a></li>
                <li><a runat="server" href="~/Employer/cvsaved.aspx">
                    <asp:Literal ID="Literal15" runat="server" Text="<%$Resources:Resource,MyCVSaved %>"></asp:Literal></a></li>
                <li><a id="Applicants" href="~/Employer/MyApplicants.aspx"
                    runat="server">
                    <asp:Literal ID="Literal11" runat="server" Text="<%$Resources:Resource,MyApplicants %>"></asp:Literal></a></li>
            </ul>
        </div>
        <div id="my-account">
            <h3>
                <span class="icon"></span>
                <asp:Literal ID="Literal12" runat="server" Text="<%$Resources:Resource,MyAccount %>"></asp:Literal></h3>
            <ul>
                <li><a id="A4" runat="server" href="~/Account/RecruiterInfo.aspx">
                    <asp:Literal ID="Literal13" runat="server" Text="<%$Resources:Resource,EditProfile %>"></asp:Literal></a></li>
                <li><a id="A8" runat="server" href="~/Account/ChangePassword.aspx">
                    <asp:Literal ID="Literal14" runat="server" Text="<%$Resources:Resource,ChangePassword %>"></asp:Literal></a></li>
                <li>
                    <asp:LoginView ID="HeadLoginView" runat="server" EnableViewState="true">
                        <LoggedInTemplate>
                            <asp:LoginStatus ID="HeadLoginStatus" runat="server" LogoutAction="Redirect" LogoutText="<%$ Resources:Resource, Logouttxt %>"
                                LogoutPageUrl="~/" />
                        </LoggedInTemplate>
                    </asp:LoginView>
                </li>
            </ul>
        </div>
    </div>
</div>
<div class="clear-floats">
</div>

</asp:Content>
