<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" EnableViewState="false"
    CodeBehind="AdvanceSearch.aspx.cs" Inherits="TeachingJob.publicArea.AdvanceSearch" %>

<asp:Content ID="Content3" ContentPlaceHolderID="title" runat="server">
<title>
        <asp:Literal ID="Literal1" runat="server" Text="<%$Resources:Resource,AdvanceJobSearch %>"></asp:Literal> - TeachinVietnam</title>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../css/content.css" rel="stylesheet" type="text/css" />
    <link href="../js/auto-complete/css/ui-lightness/jquery-ui-1.8.24.custom.css" rel="stylesheet"
        type="text/css" />
    <script type="text/javascript">
	$(function() {
		var availableTags = [""];
		availableTags = document.getElementById("hddn").value.split(',');

		$("#<%=txt_Search.ClientID %>").autocomplete({
			source: availableTags
		});
	});
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col span-9">
        <div class="module ie-module-fix" id="advanced-search">
            <div class="module-title">
                <h2 class="medium-heading">
                    <asp:Literal ID="Literal2" runat="server" Text="<%$Resources:Resource,AdvanceJobSearch %>"></asp:Literal></h2>
            </div>
            <div class="section2">
                <h3 class="no-marg">
                    <asp:Literal ID="Literal3" runat="server" Text="<%$Resources:Resource,jobtitletxt %>"></asp:Literal> </h3>
                <p>
                    <asp:Literal ID="Literal4" runat="server" Text="<%$Resources:Resource,Pleaseinputyourjobtitle %>"></asp:Literal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <ajaxToolkit:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server"
                        TargetControlID="txt_Search" WatermarkText="<%$Resources:Resource,Enteryourkeyword %>">
                    </ajaxToolkit:TextBoxWatermarkExtender>
                    <asp:TextBox ID="txt_Search" runat="server" CssClass="keywords-autocomplete waterMarkedText2"
                        Height="20px" Width="40%"></asp:TextBox>
                    <input type="hidden" id="hddn" value="<%=ArrTitle %>" />
                </p>
            </div>
            <div class="section" id="sector">
                <h3 class="no-marg">
                    <asp:Literal ID="Literal5" runat="server" Text="<%$Resources:Resource,Category %>"></asp:Literal></h3>
                <p>
                    <asp:Literal ID="Literal6" runat="server" Text="<%$Resources:Resource,Selectoneormorecategories %>"></asp:Literal>
                </p>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div class="inner">
                            <ajaxToolkit:TabContainer ID="TabContainer1" runat="server" Width="100%">
                                <ajaxToolkit:TabPanel ID="TabPanel2" runat="server" Width="100%">
                                    <ContentTemplate>
                                        <ul class="float-left ">
                                            <asp:DataList ID="dl_Fromk12Cate" runat="server" OnItemDataBound="dl_adminCate_DataBound"
                                                CellPadding="10" CellSpacing="10" RepeatColumns="3" Width="100%">
                                                <ItemStyle VerticalAlign="Top" />
                                                <ItemTemplate>
                                                    <li class="multi-check" id="Industries-10"><span class="multi-check-text">
                                                        <asp:CheckBox ID="cb_adminCate" runat="server" OnCheckedChanged="cb_adminCate_CheckedChanged" /></span></li>
                                                </ItemTemplate>
                                            </asp:DataList>
                                        </ul>
                                    </ContentTemplate>
                                </ajaxToolkit:TabPanel>
                                <ajaxToolkit:TabPanel ID="TabPanel3" runat="server" Width="100%">
                                    <ContentTemplate>
                                        <ul class="float-left last">
                                            <asp:DataList ID="dl_AcademicCate" runat="server" OnItemDataBound="dl_adminCate_DataBound"
                                                RepeatDirection="Vertical" RepeatColumns="3" Width="100%">
                                                <ItemStyle VerticalAlign="Top" />
                                                <ItemTemplate>
                                                    <li class="multi-check" id="Industries-17"><span class="multi-check-text">
                                                        <asp:CheckBox ID="cb_adminCate" runat="server" OnCheckedChanged="cb_adminCate_CheckedChanged" /></span></li>
                                                </ItemTemplate>
                                            </asp:DataList>
                                        </ul>
                                    </ContentTemplate>
                                </ajaxToolkit:TabPanel>
                                <ajaxToolkit:TabPanel ID="TabPanel1" runat="server" Enabled="true"
                                    ScrollBars="Auto" OnDemandMode="Once" Width="100%">
                                    <ContentTemplate>
                                        <ul class="float-left">
                                            <asp:DataList ID="dl_adminCate" runat="server" OnItemDataBound="dl_adminCate_DataBound"
                                                RepeatDirection="Vertical" RepeatColumns="3" Width="100%">
                                                <ItemStyle VerticalAlign="Top" />
                                                <ItemTemplate>
                                                    <li class="multi-check" id="Industries-1"><span class="multi-check-text">
                                                        <asp:CheckBox ID="cb_adminCate" runat="server" OnCheckedChanged="cb_adminCate_CheckedChanged" />
                                                    </span></li>
                                                </ItemTemplate>
                                            </asp:DataList>
                                        </ul>
                                    </ContentTemplate>
                                </ajaxToolkit:TabPanel>
                            </ajaxToolkit:TabContainer>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <div class="section">
                <h3 class="no-marg">
                    <asp:Literal ID="Literal7" runat="server" Text="<%$Resources:Resource,JobLevel %>"></asp:Literal></h3>
                <div id="roles-container">
                    <p id="no-job-roles">
                        <asp:Literal ID="Literal8" runat="server" Text="<%$Resources:Resource,Selectoneormorejoblevel %>"></asp:Literal></p>
                </div>
                <div class="inner">
                    <ul class="float-left maxwidth">
                        <asp:DataList ID="dl_Joblevel" runat="server" OnItemDataBound="dl_Joblevel_Databound"
                            RepeatColumns="3" RepeatDirection="Horizontal" CellPadding="10" CellSpacing="10"
                            Width="100%">
                            <ItemTemplate>
                                <li class="multi-check"><span class="multi-check-text">
                                    <asp:CheckBox ID="cb_JobLevel" runat="server" OnCheckedChanged="cb_JobLevel_checkedchanged" />
                                </span></li>
                            </ItemTemplate>
                        </asp:DataList>
                    </ul>
                </div>
            </div>
            <div class="section" id="employment">
                <h3 class="no-marg">
                    <asp:Literal ID="Literal9" runat="server" Text="<%$Resources:Resource,EmploymentType %>"></asp:Literal></h3>
                <p>
                    <asp:Literal ID="Literal10" runat="server" Text="<%$Resources:Resource,Chooseoneormoreemploymenttypes %>"></asp:Literal></p>
                <div class="inner">
                    <ul class="float-left maxwidth">
                        <asp:DataList ID="dl_emplType" runat="server" OnItemDataBound="dl_emplType_Databound"
                            RepeatColumns="2" RepeatDirection="Vertical" CellPadding="10" CellSpacing="10"
                            Width="400px">
                            <ItemTemplate>
                                <li class="multi-check"><span class="multi-check-text">
                                    <asp:CheckBox ID="cb_emplType" runat="server" OnCheckedChanged="cb_emplType_CheckedChanged" />
                                </span></li>
                            </ItemTemplate>
                        </asp:DataList>
                    </ul>
                </div>
            </div>
            <!-- end of sectors roles -->
            <div class="section2">
                <h3 class="no-marg">
                    <asp:Literal ID="Literal11" runat="server" Text="<%$Resources:Resource,Citizenship %>"></asp:Literal></h3>
                <p>
                    <asp:Literal ID="Literal12" runat="server" Text="<%$Resources:Resource,Selectacitizenship %>"></asp:Literal> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:DropDownList ID="ddl_citizenship" runat="server" CssClass="input">
                    </asp:DropDownList>
                </p>
            </div>
            <div class="section2">
                <h3 class="no-marg">
                    <asp:Literal ID="Literal13" runat="server" Text="<%$Resources:Resource,SchoolType %>"></asp:Literal></h3>
                <div class="float-left">
                    <p>
                        <asp:Literal ID="Literal14" runat="server" Text="<%$Resources:Resource,SelectaSchooltype %>"></asp:Literal> &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:DropDownList ID="ddl_OrgType" CssClass="input" runat="server" onchange="displaySalaryPanel(this)">
                        </asp:DropDownList>
                    </p>
                </div>
                <div id="stdiv" class="hide float-left" style="padding-left:5px;">
                    <p>
                        <asp:DropDownList ID="ddl_SchoolType" runat="server" CssClass="input">
                        </asp:DropDownList>
                    </p>
                </div>
                <script type="text/javascript">
                    function displaySalaryPanel(ddlId) {
                        var ControlName = document.getElementById(ddlId.id);

                        if (ControlName.value.indexOf('K-12') != -1) {
                            document.getElementById('stdiv').style.display = 'inline';
                        } else {
                            document.getElementById('stdiv').style.display = 'none';
                        }
                    }
                </script>
            </div>
            <div class="section" id="locations">
                <h3 class="no-marg">
                    <asp:Literal ID="Literal15" runat="server" Text="<%$Resources:Resource,Location %>"></asp:Literal></h3>
                <p>
                    <asp:Literal ID="Literal16" runat="server" Text="<%$Resources:Resource,Chooseoneormorejoblocations %>"></asp:Literal></p>
                <div class="inner">
                    <ul class="float-left maxwidth">
                        <asp:DataList ID="dl_WorkPlace" runat="server" OnItemDataBound="dl_workplace_Databound"
                            RepeatColumns="5" RepeatDirection="Vertical" CellPadding="10" CellSpacing="10"
                            Width="95%">
                            <ItemTemplate>
                                <li class="multi-check"><span class="multi-check-text">
                                    <asp:CheckBox ID="cb_workplace" runat="server" OnCheckedChanged="cb_workplace_CheckChanged" />
                                </span></li>
                            </ItemTemplate>
                        </asp:DataList>
                    </ul>
                </div>
            </div>
            <div>
            </div>
            <div class="section buttons alignright">
                <asp:Button ID="btn_Search" runat="server" Text="<%$Resources:Resource,Searchtxt %>" CssClass="standard-button orange"
                    OnClick="Search_Click" />
            </div>
        </div>
    </div>
    <%--    <div class="col span-3 last">
        <div class="module wide-sky quiet center">
            <!-- begin ad tag -->
            <div id="dfp-0">
            </div>
            <!-- end ad tag -->
            <p class="small-text lighter no-marg">
                advertisement</p>
        </div>
    </div>--%>
    <div class="clear-floats">
    </div>
</asp:Content>
