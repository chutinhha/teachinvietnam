<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="TeacherTraining.aspx.cs" Inherits="TeachingJob.publicArea.TeacherTraining" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    <title>Teacher Training - TeachinVietnam</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../css/teacher.css" rel="Stylesheet" type="text/css" />
    <script type="text/javascript">
        function showhidecitizen(ddlId) {
            var ControlName = document.getElementById(ddlId.id);

            if (ControlName.value == 'Vietnam') {
                document.getElementById('city').style.display = 'inline';
            } else {
                document.getElementById('city').style.display = 'none';
                document.getElementById('city').value = "";
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class='col span-8'>
        <div class='component component-CurrentlyRecruiting'>
            <div class="module ">
                <div id="currently-recruiting-outer">
                    <div class="module-title">
                        <h2><asp:Literal ID="Literal2" runat="server" Text="Teacher Training"></asp:Literal></h2>
                    </div>
                    <div class="standard-form1">
                        <h3 class="group-title top">
                            <asp:Literal ID="Literal3" runat="server" Text="Discover training course around you"></asp:Literal></h3>
                            <table style="width: 100%">
                                <tr>
                                    <td class="cot25">Please select a location:</td>
                                    <td>
                                        <asp:DropDownList ID="ddl_city" EnableViewState="true" runat="server" CssClass="input" ToolTip="<%$Resources:Resource,Pleaseselectalocation %>">
                                            </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td><asp:Button ID="btn_Submit" runat="server" Text="Get course" CssClass="standard-button orange small" OnClick="btn_Submit_Click" /></td>
                                </tr>
                            </table>
                        <div class="clear-floats"></div>
                    </div>
                    <div class="standard-form1 ">
                        <h3 class="group-title top">
                            <asp:Literal ID="Literal12" runat="server" Text="Courses"></asp:Literal></h3>
                        <asp:Repeater ID="Repeater_CourseList" runat="server" OnItemDataBound="Repeater_CourseList_DataBind">
                        <ItemTemplate>
                        <div class="t_wrap">
                            <asp:HyperLink ID="hpl_CourseName" runat="server"></asp:HyperLink>
                        </div>
                        </ItemTemplate>
                        </asp:Repeater>
                        <div class="clear-floats"></div>
                    </div>                
                </div>
            </div>
        </div>
    </div>
</asp:Content>
