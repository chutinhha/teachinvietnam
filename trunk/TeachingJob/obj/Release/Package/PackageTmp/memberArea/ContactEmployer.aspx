<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="ContactEmployer.aspx.cs" Inherits="TeachingJob.memberArea.ContactEmployer"
    ValidateRequest="false" %>

<%@ Register TagPrefix="fjx" Namespace="com.flajaxian" Assembly="com.flajaxian.FileUploader" %>
<asp:Content ID="Content3" ContentPlaceHolderID="title" runat="server">
    <title>Mail to Recruiter - TeachinVietnam</title>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style2
        {
            width: 83px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class='col span-8'>
        <div class='component component-CurrentlyRecruiting'>
            <div class="module ">
                <div id="">
                    <div class="module-title">
                        <h2>
                            <asp:Literal ID="Literal1" runat="server" Text="<%$Resources:Resource,Mailtocontact %>"></asp:Literal></h2>
                    </div>
                    <div class="standard-form2">
                        <h3 class="group-title top">
                            <asp:Literal ID="Literal2" runat="server" Text="<%$Resources:Resource,ContactEmployer %>"></asp:Literal></h3>
                        <table>
                            <tr>
                                <td class="style2">
                                    <asp:Literal ID="Literal3" runat="server" Text="<%$Resources:Resource,JobTitle %>"></asp:Literal>
                                </td>
                                <td class="boldText">
                                    <asp:Label ID="lbl_JobTitle" runat="server" Text="" CssClass="ContactEmpText"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="style2">
                                    <asp:Literal ID="Literal4" runat="server" Text="<%$Resources:Resource,ApplyTo %>"></asp:Literal>
                                </td>
                                <td class="boldText">
                                    <asp:Label ID="lbl_OrgName" runat="server" Text="" CssClass="ContactEmpText"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="style2">
                                    <asp:Literal ID="Literal5" runat="server" Text="<%$Resources:Resource,Subject2 %>"></asp:Literal>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txt_Subject"
                                        ErrorMessage="<%$Resources:Resource,PleaseenterApplication %>" ValidationGroup="UpdateCandidateGroup"
                                        Text="*" CssClass="failureNotification" Display="Dynamic"></asp:RequiredFieldValidator>
                                </td>
                                <td class="boldText">
                                    <asp:TextBox ID="txt_Subject" runat="server" Width="400px" Height="20px" MaxLength="120"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style2">
                                    <asp:Literal ID="Literal6" runat="server" Text="<%$Resources:Resource,YourName %>"></asp:Literal>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_FullName"
                                        ErrorMessage="<%$Resources:Resource,Pleaseenteryourname %>" ValidationGroup="UpdateCandidateGroup"
                                        Text="*" CssClass="failureNotification" Display="Dynamic"></asp:RequiredFieldValidator>
                                </td>
                                <td class="boldText">
                                    <asp:TextBox ID="txt_FullName" runat="server" Width="250px" Height="20px" MaxLength="100"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style2">
                                    <asp:Literal ID="Literal7" runat="server" Text="<%$Resources:Resource,YourMail %>"></asp:Literal>
                                </td>
                                <td class="boldText">
                                    <asp:Label ID="lbl_YourMail" runat="server" Text="" CssClass="ContactEmpEmailText"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="topvalign">
                                    <asp:Literal ID="Literal8" runat="server" Text="<%$Resources:Resource,Message2 %>"></asp:Literal>
                                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtMessage"
                                        Text="*" CssClass="failureNotification" ErrorMessage="<%$Resources:Resource,Pleaseentercoverletter %>"
                                        ValidationGroup="UpdateCandidateGroup" Display="Dynamic"></asp:RequiredFieldValidator>--%>
                                </td>
                                <td>
                                    <asp:Panel ID="Panel2" runat="server">
                                        <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" CssClass="maxwidth noResizeHorizontal"
                                            Height="256px" Width="100%" MaxLength='5000'></asp:TextBox>
                                        <br />
                                        <asp:Label ID="Label1" CssClass="showRemainChars" runat="server" Text=""></asp:Label>
                                    </asp:Panel>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Literal ID="Literal9" runat="server" Text="<%$Resources:Resource,Attachment %>"></asp:Literal>
                                </td>
                                <td>
                                    <ajaxToolkit:AsyncFileUpload OnClientUploadError="uploadError" OnClientUploadComplete="uploadComplete"
                                        runat="server" ID="AsyncFileUpload1" UploaderStyle="Traditional" UploadingBackColor="#FFFFFF"
                                        ThrobberID="myThrobber" CompleteBackColor="#FFFFFF" ToolTip="<%$Resources:Resource,Uploadoneormorefiles %>"
                                        OnUploadedComplete="AsyncFileUpload1_UploadedComplete" />
                                    <asp:Label runat="server" ID="myThrobber" Style="display: none;">  
                                            <img align="middle" alt="" src="indicator.gif" />  
                                    </asp:Label>
                                    <asp:Label ID="Label2" runat="server" CssClass="ContactEmpAttText" Text="<%$Resources:Resource,Currentlyyoudonothavepersonalresume %>"></asp:Label>
                                    <br />
                                    <asp:Label ID="Label111" runat="server" Text="(jpeg, jpg, gif, png, pdf, ppt, doc, docx, rar, zip; Max file size is 3MB)"
                                        CssClass="ContactEmpAttText"></asp:Label>
                                    <br />
                                    <table style="border-collapse: collapse; border-left: solid 1px #aaaaff; border-top: solid 1px #aaaaff;"
                                        runat="server" cellpadding="3" id="clientSide" />
                                </td>
                            </tr>
                        </table>
                        <div class="clear-floats">
                        </div>
                    </div>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="UpdateCandidateGroup"
                        CssClass="failureNotification" />
                    <asp:Label ID="lbl_Status" runat="server" Text="" CssClass="failureNotification"></asp:Label>
                    <br />
                    <asp:Button ID="btn_SendMail" CssClass="standard-button orange small" runat="server"
                        Text="<%$Resources:Resource,Submit2 %>" ValidationGroup="UpdateCandidateGroup"
                        OnClick="SendMail_Click" />
                    <asp:LinkButton ID="lbtn_Cancel" OnClick="lbtn_Cancel_Click" runat="server" CssClass="standard-button small"
                        Text="<%$Resources:Resource,Cancel %>"></asp:LinkButton>
                </div>
            </div>
        </div>
    </div>
    <script src="../Scripts/jquery.blockUI188b.js" type="text/javascript"></script>
    <script type="text/javascript">
        // unblock when ajax activity stops 
        $(document).ajaxStop($.unblockUI);

        function test() {
            $.ajax({ url: 'wait.aspx', cache: false });
        }

        $(document).ready(function () {
            $("#<%=btn_SendMail.ClientID %>").click(function () {
                $.blockUI({ message: '<h3><img src="indicator.gif" /> Your application is sending, please wait for a moment..</h3>' });
            });
        });

        $('#<%=AsyncFileUpload1.ClientID %>').bind('change', function () {
            if (this.files[0].size > 5242880) {
                var FileUpload = document.getElementById('<%=AsyncFileUpload1.ClientID %>');
                FileUpload.value = '';
                alert('File size can not exceed 5 MB');
            }
        });
    </script>
    <script type="text/javascript">
        function fillCell(row, cellNumber, text) {
            var cell = row.insertCell(cellNumber);
            cell.innerHTML = text;
            cell.style.borderBottom = cell.style.borderRight = "solid 1px #aaaaff";
            cell.style.padding = "5px";
            cell.style.color = "black";
            cell.style.fontWeight = "normal";

        }
        function addToClientTable(name, text) {
            var table = document.getElementById("<%= clientSide.ClientID %>");
            var row = table.insertRow(0);
            fillCell(row, 0, name);
            fillCell(row, 1, text);
        }

        function uploadError(sender, args) {
            addToClientTable(args.get_fileName(), "<span style='color:red;'>" + args.get_errorMessage() + "</span>");
        }
        function uploadComplete(sender, args) {
            var contentType = args.get_contentType();
            var ext = args.get_fileName().substring(args.get_fileName().lastIndexOf(".") + 1);

            if (ext == 'doc' || ext == 'DOC' || ext == 'docx' || ext == 'DOCX' || ext == 'rar' || ext == 'RAR' || ext == 'zip' || ext == 'ZIP' || ext == 'jpg' || ext == 'JPG' || ext == 'jpeg' || ext == 'JPEG' || ext == 'png' || ext == 'PNG' || ext == 'gif' || ext == 'GIF' || ext == 'bmp' || ext == 'BMP' || ext == 'PDF' || ext == 'pdf' || ext == 'ppt' || ext == 'PPT') {
                var fileLength = args.get_length() / 1024;
                if (fileLength < 1) {
                    fileLength = 1;
                }
                if (fileLength <= 3000) {
                    var text = fileLength.toFixed(0) + " KB";
                    if (contentType.length > 0) {
                        text += ", '" + ext + "'";
                    }
                    addToClientTable(args.get_fileName(), text);
                    //                    return true;
                }
                //                     else {
                //                    //alert('sai');
                //                    return false;
                //                }
            } else {
                //alert('<asp:Literal ID="Literal100" runat="server" Text="<%$Resources:Resource,notsupportfile %>"></asp:Literal>');
                //return false;
            }
        }
        //        $('#ctl00_MainContent_AsyncFileUpload1_ctl02').bind('change', function () {
        //            alert(this.files[0].size);
        //            if (this.files[0].size < 1024) {
        //                alert('true');
        //                return true;
        //            } else {
        //                alert('false');
        //                return false;
        //            }
        //        });

    </script>
   <script type="text/javascript">
       function textCounter(field, countfield, maxlimit) {
           var Label1 = document.getElementById(countfield);
           if (field.value.length > maxlimit)
               field.value = field.value.substring(0, maxlimit);
           Label1.innerText = (maxlimit - field.value.length) + ' characters remaining';
       }
    </script>
</asp:Content>
