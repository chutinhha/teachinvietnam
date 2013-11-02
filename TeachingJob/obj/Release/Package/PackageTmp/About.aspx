<%@ Page Title="About Us" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="About.aspx.cs" Inherits="TeachingJob.About" %>

<%@ Register Assembly="FUA" Namespace="Subgurim.Controles" TagPrefix="cc1" %>

<%@ Register TagPrefix="fjx" Namespace="com.flajaxian" Assembly="com.flajaxian.FileUploader" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">

    <script src="Scripts/htmlTextArea/scripts/jquery-1.3.2.js" type="text/javascript"></script>
    <script src="Scripts/htmlTextArea/scripts/jHtmlArea-0.7.5.js" type="text/javascript"></script>
    <link href="Scripts/htmlTextArea/style/jHtmlArea.css" rel="stylesheet" type="text/css" />
<%--<script type="text/javascript">
    $(function () {
        $("textarea").htmlarea(); // Initialize jHtmlArea's with all default values
        //$("#<%=txt_body.ClientID %>").htmlarea();
        //window.setTimeout(function() { $("form").submit(); }, 3000);
    });
    </script>--%>

<script type="text/javascript">
    var counter = 0;
    function addNew() {
        // Get the main Div in which all the other divs will be added
        var mainContainer = document.getElementById('mainContainer');
        // Create a new div for holding text and button input elements
        var newDiv = document.createElement('div');
        // Create a new text input
        var newText = document.createElement('input');
        newText.type = "input";
        newText.value = counter;
        // Create a new button input
        var newDelButton = document.createElement('input');
        newDelButton.type = "button";
        newDelButton.value = "Delete";

        // Append new text input to the newDiv
        newDiv.appendChild(newText);
        // Append new button input to the newDiv
        newDiv.appendChild(newDelButton);
        // Append newDiv input to the mainContainer div
        mainContainer.appendChild(newDiv);
        counter++;

        // Add a handler to button for deleting the newDiv from the mainContainer
        newDelButton.onclick = function () {
            mainContainer.removeChild(newDiv);
        }
    }
</script>
<style type="text/css">
    .CustomTabStyle {
    font-family:verdana,tahoma,helvetica;
    font-size:11px;
    background:url(images/tab-line.gif) repeat-x bottom;
}
</style>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
<p>
<asp:TextBox ID="txt_body" runat="server" TextMode="MultiLine" Rows="30" Columns="100"
                                                CssClass="noResizeHorizontal TinyMceWidth"></asp:TextBox><br />
</p>

<hr />
<CKEditor:CKEditorControl ID="CKEditor1" BasePath="~/Scripts/ckeditor" runat="server"></CKEditor:CKEditorControl>
<hr />
    <h2>
        About
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label><asp:Label ID="Label3"
            runat="server" Text="Label"></asp:Label>
        <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
    </h2>
    <p>
    <fjx:FileUploader ID="FileUploader1" RequestAsPostBack="true" UseInsideUpdatePanel="false"
                                        AllowedFileTypes="Image Files:*.zip;*.psd;*.jpg;*.jpeg;*.png;*.gif;*.rar;" runat="server"
                                        OnFileReceived="FileUploader_FileReceived" MaxFileQueueSize="30MB">
                                        <adapters>
                                            <fjx:FileSaverAdapter runat="server" OnFileNameDetermining="FileNameDetermining" />
                                        </adapters>
                                    </fjx:FileUploader>
    </p>
    <p>
        Put content here.
        <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
        <ajaxToolkit:TabContainer ID="TabContainer1" runat="server"
            Height="150px"
            Width="400px"
            ActiveTabIndex="1"        
            OnDemand="true"        
            AutoPostBack="false"
            TabStripPlacement="Top"
            ScrollBars="None"
            VerticalStripWidth="120px">
            <ajaxToolkit:TabPanel ID="TabPanel1" 
                runat="server" 
                HeaderText="Signature and Bio"
                Enabled="true"
                ScrollBars="Auto"        
                OnDemandMode="Once" >
                <ContentTemplate>
                   <h1>abc</h1> 
                </ContentTemplate>
            </ajaxToolkit:TabPanel>
            <ajaxToolkit:TabPanel ID="TabPanel2"
                runat="server" 
                HeaderText="Signature"
                Enabled="true"
                ScrollBars="Auto"        
                OnDemandMode="Once">
                <ContentTemplate>
                    <h1>def</h1> 
                </ContentTemplate>
            </ajaxToolkit:TabPanel>
        </ajaxToolkit:TabContainer>
    </p>
<div id="mainContainer">
			<div>
                <asp:FileUpload ID="FileUpload1" runat="server"  />
                <input type="button" value="Add" onClick="addNew()">
                <cc1:FileUploaderAJAX ID="FileUploaderAJAX1" runat="server" MaxFiles="5" Directory_CreateIfNotExists="true" File_RenameIfAlreadyExists="true"
                                             text_Add="Attach another file" text_Delete="Remove" text_Uploading="Uploading..."  />
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            </div>
		</div>
</asp:Content>
