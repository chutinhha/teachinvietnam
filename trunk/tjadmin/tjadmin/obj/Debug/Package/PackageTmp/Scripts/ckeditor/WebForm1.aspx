<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="TeachingJob.Scripts.ckeditor.WebForm1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="contents.css" type="text/css" />
    <script type="text/javascript" src="ckeditor.js">
    </script>
    

</head>
<body>
    <form id="form1" runat="server">
    <div><textarea cols="80" id="editor1" name="editor1" rows="10">&lt;p&gt;This is some &lt;b&gt;sample text&lt;/b&gt;. You are using &lt;a href="http://ckeditor.com/"&gt;CKEditor&lt;/a&gt;.&lt;/p&gt;</textarea>
    <script type="text/javascript" src="deployckeditor.js"></script>
    </div>
    </form>
</body>
</html>
