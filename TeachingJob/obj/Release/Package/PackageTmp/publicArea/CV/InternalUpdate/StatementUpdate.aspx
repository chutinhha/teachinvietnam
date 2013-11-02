<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StatementUpdate.aspx.cs" Inherits="TeachingJob.publicArea.CV.InternalUpdate.StatementUpdate" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Update Your Personal Details</title>
    <link href="style.css" rel="stylesheet" type="text/css" />
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
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <h3>
        <asp:Literal ID="Literal1" runat="server" Text="<%$Resources:Resource,PersonalStatement2 %>"></asp:Literal></h3>
    <br />
        <asp:TextBox ID="txt_Statement" runat="server" TextMode="MultiLine" CssClass="input" Font-Size="Smaller"
                        ForeColor="Black" BorderStyle="Solid" BorderColor="Silver" Rows="15" Columns="75" 
                        MaxLength='4000' onkeyDown="checkTextAreaMaxLength(this,event,'4000');"></asp:TextBox>
        <br />
        <asp:Button ID="btn_Update" runat="server" Text="<%$Resources:Resource,Update %>" OnClick="Update_Click" CssClass="standard-button orange small" />
    </div>
    </form>
</body>
</html>
