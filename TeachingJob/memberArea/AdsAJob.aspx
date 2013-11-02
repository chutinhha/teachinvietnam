<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="AdsAJob.aspx.cs" Inherits="TeachingJob.memberArea.AdsAJob" ValidateRequest="false"
    EnableViewState="true" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content3" ContentPlaceHolderID="title" runat="server">
<title>
        <asp:Literal ID="Literal1" runat="server" Text="<%$Resources:Resource,PostaTeachingJob %>"></asp:Literal>
        - TeachinVietnam</title>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <%--<script src="../js/nicEdit-latest.js" type="text/javascript"></script>
    <script type="text/javascript">    bkLib.onDomLoaded(nicEditors.allTextAreas);</script>--%>
						
    <link href="../css/content.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .more{display: none;}
        .show{display: inline;}
        .less{display: block;}
        .nobold{font-weight:normal !important}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class='col span-8'>
        <div class='component component-CurrentlyRecruiting'>
            <div class="module ">
                <div id="currently-recruiting-outer">
                    <div class="module-title">
                        <h2>
                            <asp:Literal ID="Literal2" runat="server" Text="<%$Resources:Resource,Advertiseajob %>"></asp:Literal></h2>
                    </div>
                    <div class="standard-form1 ">
                        <h3 class="group-title top">
                            <asp:Literal ID="Literal3" runat="server" Text="<%$Resources:Resource,JobInformation %>"></asp:Literal></h3>
                        <table style="width: 100%">
                            <tr>
                                <td class="style1_PostJob padding">
                                    <asp:Label ID="lbl_JobTitle" runat="server" Text="<%$Resources:Resource,jobtitletxt %>"
                                        CssClass="bold"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtJobTitle" Width="350px" Height="22px" runat="server" CssClass="font bold input"
                                        ViewStateMode="Enabled" MaxLength="99"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="<%$Resources:Resource,Pleaseinputthejobtitle %>"
                                        Text="*" ControlToValidate="txtJobTitle" Display="Dynamic" ValidationGroup="AddJob"
                                        CssClass="failureNotification"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1_PostJob_topValgin">
                                    <asp:Label ID="lbl_Category" runat="server" Text="<%$Resources:Resource,Category %>"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="Category" runat="server" CssClass="input" OnDataBound="Category_DataBound"
                                        ViewStateMode="Inherit" Width="240px">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="Dynamic" runat="server"
                                        ErrorMessage="<%$Resources:Resource,Pleaseinputthecategory %>" Text="*" ControlToValidate="Category"
                                        ValidationGroup="AddJob" CssClass="failureNotification"></asp:RequiredFieldValidator>
                                    <a href="#" id="example3-show" class="showLink" onclick="showHide('example3');return false;">
                                        <asp:Literal ID="Literal4" runat="server" Text="<%$Resources:Resource,Addmore %>"></asp:Literal></a>
                                    <div id="example3" class="more">
                                        <asp:DropDownList ID="Category2" runat="server" OnDataBound="Category2_DataBound"
                                            CssClass="input" Width="240px">
                                        </asp:DropDownList>
                                        <a href="#" id="example4-show" class="showLink" onclick="showHide('example4');return false;">
                                            <asp:Literal ID="Literal5" runat="server" Text="<%$Resources:Resource,Addmore %>"></asp:Literal></a>
                                    </div>
                                    <div id="example4" class="more">
                                        <asp:DropDownList ID="Category3" runat="server" OnDataBound="Category3_DataBound"
                                            CssClass="input" Width="240px">
                                        </asp:DropDownList>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1_PostJob">
                                    <asp:Label ID="lbl_Citizenship" runat="server" Text="<%$Resources:Resource,RequiredCitizenship %>"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlCitizenship" runat="server" CssClass="input" OnDataBound="Citizenship_DataBound"
                                        Width="220px">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1_PostJob">
                                    <asp:Label ID="lbl_JobLevel" runat="server" Text="<%$Resources:Resource,JobLevel %>"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlJobLevel" runat="server" CssClass="input" Width="220px"
                                        OnDataBound="JobLevel_DataBound">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" Display="Dynamic" runat="server"
                                        ErrorMessage="<%$Resources:Resource,Pleaseinputthejoblevel %>" Text="*" ControlToValidate="ddlJobLevel"
                                        ValidationGroup="AddJob" CssClass="failureNotification"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1_PostJob">
                                    <asp:Label ID="lbl_EducationRequirement" runat="server" Text="<%$Resources:Resource,RequiredEducation %>"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddl_EducationRequirement" runat="server" CssClass="input" OnDataBound="EduLevel_DataBound"
                                        Width="220px">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1_PostJob">
                                    <asp:Label ID="lbl_EmploymentType" runat="server" Text="<%$Resources:Resource,EmploymentType2 %>"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlJobEmploymentType" runat="server" CssClass="input" Width="220px"
                                        OnDataBound="EmpT_DataBound">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="<%$Resources:Resource,Pleaseinputtheemploymenttype %>"
                                        Text="*" ControlToValidate="ddlJobEmploymentType" Display="Dynamic" ValidationGroup="AddJob"
                                        CssClass="failureNotification"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1_PostJob_topValgin">
                                    <asp:Label ID="lbl_WorkPlace" runat="server" Text="<%$Resources:Resource,WorkPlace %>"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlJobLocation" runat="server" CssClass="input" OnDataBound="Location_DataBound"
                                        Width="120px">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="<%$Resources:Resource,Pleaseinputthejoblocation %>"
                                        Text="*" ControlToValidate="ddlJobLocation" Display="Dynamic" ValidationGroup="AddJob"
                                        CssClass="failureNotification"></asp:RequiredFieldValidator>
                                    <a href="#" id="example-show" class="showLink" onclick="showHide('example');return false;">
                                        <asp:Literal ID="Literal6" runat="server" Text="<%$Resources:Resource,Addmore %>"></asp:Literal></a>
                                    <div id="example" class="more">
                                        <asp:DropDownList ID="ddlJobLocation2" runat="server" OnDataBound="Location2_DataBound"
                                            CssClass="input" Width="120px">
                                        </asp:DropDownList>
                                        <a href="#" id="example1-show" class="showLink" onclick="showHide('example1');return false;">
                                            <asp:Literal ID="Literal7" runat="server" Text="<%$Resources:Resource,Addmore %>"></asp:Literal></a>
                                    </div>
                                    <div id="example1" class="more">
                                        <asp:DropDownList ID="ddlJobLocation3" runat="server" OnDataBound="Location3_DataBound"
                                            CssClass="input" Width="120px">
                                        </asp:DropDownList>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1_PostJob_topValgin">
                                    <asp:Label ID="lbl_Salary" runat="server" Text="Salary (USD)"></asp:Label>
                                </td>
                                <td>
                                    <script type="text/javascript">
                                        function displaySalaryPanel(panelID) {
                                            if (panelID == 'example5') {
                                                document.getElementById('example5').style.display = 'inline';
                                            } else {
                                                document.getElementById('example5').style.display = 'none';
                                            }
                                        }
                                    </script>
                                    <input type="radio" id="example5negotiable" <% if(Dj!=null){if(Dj.SalaryType==false){ %>
                                        checked="checked" <%}}else{ %>checked="checked" <%} %> name="salaryType" value="Negotiable"
                                        onclick="displaySalaryPanel('example55')" />
                                    <asp:Literal ID="Literal8" runat="server" Text="<%$Resources:Resource,Negotiable %>"></asp:Literal>
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="radio" id="example5show" name="salaryType" <%if(Dj!=null){if(Dj.SalaryType==true){ %>
                                        checked="checked" <%}} %> value="Specified" onclick="displaySalaryPanel('example5')" />
                                    <asp:Literal ID="Literal9" runat="server" Text="<%$Resources:Resource,Specified %>"></asp:Literal>
                                    <br />
                                    <div id="example5" <%if(Dj!=null){if(Dj.SalaryType==true){ %>class="show" <%}else{%>class="more"
                                        <%}}else{ %>class="more" <%} %>>
                                        <asp:Literal ID="Literal10" runat="server" Text="<%$Resources:Resource,From %>"></asp:Literal>
                                        <asp:TextBox ID="txt_SalaryFrom" runat="server" CssClass="input" Width="90px" MaxLength="20"></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="txt_SalaryFrom"
                                            ValidationGroup="AddJob" Display="Dynamic" ValidationExpression="(\+|-)?[0-9]+(\.[0-9]*)?"
                                            runat="server" ErrorMessage="<%$Resources:Resource,Salarymustbeinnumber %>" Text="*"
                                            CssClass="failureNotification"></asp:RegularExpressionValidator>
                                        <asp:Literal ID="Literal11" runat="server" Text="<%$Resources:Resource,To %>"></asp:Literal>
                                        <asp:TextBox ID="txt_SalaryTo" runat="server" CssClass="input" Width="90px" MaxLength="20"></asp:TextBox>
                                        <asp:RegularExpressionValidator Display="Dynamic" ID="RegularExpressionValidator3"
                                            ControlToValidate="txt_SalaryTo" ValidationGroup="AddJob" ValidationExpression="(\+|-)?[0-9]+(\.[0-9]*)?"
                                            runat="server" ErrorMessage="<%$Resources:Resource,Salarymustbeinnumber %>" Text="*"
                                            CssClass="failureNotification"></asp:RegularExpressionValidator>
                                        <asp:DropDownList ID="ddl_SalaryCurrency" runat="server" CssClass="input2">
                                            <asp:ListItem Value="USD">USD</asp:ListItem>
                                            <asp:ListItem Value="VND">VND</asp:ListItem>
                                        </asp:DropDownList>
                                        /
                                        <asp:DropDownList ID="ddl_SalaryPaidType" runat="server" CssClass="input2">
                                            <asp:ListItem Value="month" Text="<%$Resources:Resource,month2 %>"></asp:ListItem>
                                            <asp:ListItem Value="week" Text="<%$Resources:Resource,week %>"></asp:ListItem>
                                            <asp:ListItem Value="hour" Text="<%$Resources:Resource,hour %>"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1_PostJob_topValgin">
                                    <asp:Label ID="lbl_JobDescription" runat="server" Text="<%$Resources:Resource,JobDescription %>"></asp:Label>
                                </td>
                                <td class="nobold">
                                    <asp:TextBox ID="txtJobDescription" CssClass="input TinyMceWidth noResizeHorizontal nobold"
                                        TextMode="MultiLine" runat="server" Height="100px" MaxLength='10000' onkeyDown="checkTextAreaMaxLength(this,event,'10000');"></asp:TextBox>
                                    <%--<CKEditor:CKEditorControl ID="txtJobDescription" BasePath="~/Scripts/ckeditor" runat="server" Height="100px" MaxLength='10000' onkeyDown="checkTextAreaMaxLength(this,event,'10000');" CssClass="input TinyMceWidth noResizeHorizontal nobold"></CKEditor:CKEditorControl>--%>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1_PostJob">
                                    <asp:Label ID="lbl_ClosingDate" runat="server" Text="<%$Resources:Resource,ClosingDate2 %>"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtJobClosingDate" onkeypress="return onlyNumbers();" runat="server"
                                        Width="200px"></asp:TextBox>
                                    <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtJobClosingDate">
                                    </ajaxToolkit:CalendarExtender>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="<%$Resources:Resource,Pleaseinputthejobsclosingdate %>"
                                        Text="*" ControlToValidate="txtJobClosingDate" Display="Dynamic" ValidationGroup="AddJob"
                                        CssClass="failureNotification"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="<%$Resources:Resource,InvalidDateTime %>"
                                        ValidationExpression="^\d{1,2}\/\d{1,2}\/\d{4}$" ControlToValidate="txtJobClosingDate"
                                        Text="*" ValidationGroup="AddJob" CssClass="failureNotification"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td class="valignmiddle">
                                    <div>
                                        <asp:CheckBox ID="cb_ExecutiveJob" CssClass="valignmiddle" runat="server" Text="<%$Resources:Resource,Stickhere %>" />
                                    </div>
                                </td>
                            </tr>
                        </table>
                        <div class="clear-floats">
                        </div>
                    </div>
                    <div class="standard-form1 ">
                        <h3 class="group-title top">
                            <asp:Literal ID="Literal12" runat="server" Text="<%$Resources:Resource,Contactinformation %>"></asp:Literal></h3>
                        <table style="width: 100%">
                            <tr>
                                <td class="style1_PostJob">
                                    <asp:Label ID="lbl_Contact" runat="server" Text="<%$Resources:Resource,ContactPerson %>"></asp:Label>
                                </td>
                                <td>
                                    <ajaxToolkit:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server"
                                        TargetControlID="Contact" WatermarkText="<%$Resources:Resource,ContactName %>"
                                        WatermarkCssClass="watermarktext">
                                    </ajaxToolkit:TextBoxWatermarkExtender>
                                    <asp:TextBox ID="Contact" runat="server" CssClass="input" MaxLength="100" Width="260px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" Display="Dynamic" runat="server"
                                        ErrorMessage="<%$Resources:Resource,Pleaseinputyourcontactname %>" Text="*" ControlToValidate="Contact"
                                        ValidationGroup="AddJob" CssClass="failureNotification"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1_PostJob">
                                    <asp:Label ID="lbl_Email" runat="server" Text="<%$Resources:Resource,EmailForApplications %>"></asp:Label>
                                </td>
                                <td class="middleVertical">
                                    <asp:TextBox ID="txt_Email" runat="server" MaxLength="100" CssClass="input" Width="260px"></asp:TextBox>
                                    <asp:Label ID="Label1" runat="server" Text="<%$Resources:Resource,hiddentojobseekers %>"></asp:Label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Display="Dynamic"
                                        ErrorMessage="<%$Resources:Resource,Pleaseenteryouremail %>" Text="*" ControlToValidate="txt_Email"
                                        ValidationGroup="AddJob" CssClass="failureNotification"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ValidationGroup="AddJob"
                                        CssClass="failureNotification" ControlToValidate="txt_Email" Display="Dynamic"
                                        ErrorMessage="<%$Resources:Resource,validformat %>" Text="*" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="AddJob"
                        CssClass="failureNotification" />
                    <div class="button alignright" style="width: 100%">
                        <asp:Button ID="btnPostJob" runat="server" Text="<%$Resources:Resource,Post %>" CssClass="standard-button orange" OnClientClick="javascript:confirm('Are you sure?\\nFor better performance, you should preview you new job before publish it by click on Preview button.');"
                            OnClick="btnPostJob_Click" ValidationGroup="AddJob" />
                        <asp:Button ID="btn_Preview" runat="server" Text="<%$Resources:Resource,Preview %>"
                            CssClass="standard-button small" OnClick="Preview_OnClick" ValidationGroup="AddJob" />
                        <asp:Button ID="btnCancel" runat="server" Text="<%$Resources:Resource,Cancel %>"
                            CssClass="standard-button small" OnClick="btnCancel_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col span-3 last" id="member-nav">
        <div class="module">
            <p class="home">
                <span class="icon"></span><a id="A1" href="~/Employer/EmployerSite.aspx" runat="server">
                    <asp:Literal ID="Literal13" runat="server" Text="<%$Resources:Resource,Employermanagement %>"></asp:Literal></a></p>
            <div id="my-applications">
                <h3>
                    <span class="icon"></span>
                    <asp:Literal ID="Literal14" runat="server" Text="<%$Resources:Resource,MyJobs %>"></asp:Literal></h3>
                <ul>
                    <li class="rightselected"><a id="A2" href="~/memberArea/AdsAJob.aspx" runat="server">
                        <asp:Literal ID="Literal15" runat="server" Text="<%$Resources:Resource,CreateaJob %>"></asp:Literal></a></li>
                        <li><a id="A5" href="~/Employer/TeacherTraining.aspx" runat="server" visible="false">
                    <asp:Literal ID="Literal23" runat="server" Text="Post a training course"></asp:Literal></a></li>
                </ul>
            </div>
            <div id="my-jobs">
                <h3>
                    <span class="icon"></span>
                    <asp:Literal ID="Literal16" runat="server" Text="<%$Resources:Resource,JobsManagement %>"></asp:Literal></h3>
                <ul>
                    <li><a href="~/Employer/JobsManagement.aspx" runat="server">
                        <asp:Literal ID="Literal17" runat="server" Text="<%$Resources:Resource,MyPostedJobs %>"></asp:Literal></a></li>
                    <li><a id="A4" runat="server" href="~/Employer/cvsaved.aspx">
                        <asp:Literal ID="Literal18" runat="server" Text="<%$Resources:Resource,MyCVSaved %>"></asp:Literal></a></li>
                    <li><a href="~/Employer/MyApplicants.aspx" runat="server">
                        <asp:Literal ID="Literal19" runat="server" Text="<%$Resources:Resource,MyApplicants %>"></asp:Literal></a></li>
                </ul>
            </div>
            <div id="my-account">
                <h3>
                    <span class="icon"></span>
                    <asp:Literal ID="Literal20" runat="server" Text="<%$Resources:Resource,MyAccount %>"></asp:Literal></h3>
                <ul>
                    <li><a id="A3" runat="server" href="~/Account/RecruiterInfo.aspx">
                        <asp:Literal ID="Literal21" runat="server" Text="<%$Resources:Resource,EditProfile %>"></asp:Literal></a></li>
                    <li><a id="A8" runat="server" href="~/Account/ChangePassword.aspx">
                        <asp:Literal ID="Literal22" runat="server" Text="<%$Resources:Resource,ChangePassword %>"></asp:Literal></a></li>
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
    <script type="text/javascript" language="javascript">
        function onlyNumbers(evt) {
            var e = event || evt; // for trans-browser compatibility
            var charCode = e.which || e.keyCode;

            if (charCode > 31 && (charCode < 48 || charCode > 57))
                return false;

            return false;
        }
    </script>
    <script language="javascript" type="text/javascript">
        function showHide(shID) {
            if (document.getElementById(shID)) {
                if (document.getElementById(shID + '-show').style.display != 'none') {
                    document.getElementById(shID + '-show').style.display = 'none';
                    document.getElementById(shID).style.display = 'block';
                    document.getElementById(shID).style.padding = '5px 0 0 0';
                }
                else {
                    document.getElementById(shID + '-show').style.display = 'inline';
                    document.getElementById(shID).style.display = 'none';
                }
            }
        }
    </script>
    <script type="text/javascript">
        function checkTextAreaMaxLength(textBox, e, length) {

            var mLen = textBox["MaxLength"];
            if (null == mLen)
                mLen = length;

            var maxLength = parseInt(mLen);
            if (!checkSpecialKeys(e)) {
                if (textBox.value.length > maxLength - 1) {
                    if (window.event)//IE
                        e.returnValue = false;
                    else//Firefox
                        e.preventDefault();
                }
            }
        }
        function checkSpecialKeys(e) {
            if (e.keyCode != 8 && e.keyCode != 46 && e.keyCode != 37 && e.keyCode != 38 && e.keyCode != 39 && e.keyCode != 40)
                return false;
            else
                return true;
        }
    </script>
</asp:Content>
