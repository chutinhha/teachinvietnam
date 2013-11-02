<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="TeachingJob.publicArea.errorpages.WebForm1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
    <script src="../../Scripts/jquery.blockUI188b.js" type="text/javascript"></script>
    <script type="text/javascript">

        // unblock when ajax activity stops 
        $(document).ajaxStop($.unblockUI);

        function test() {
            $.ajax({ url: 'wait.aspx', cache: false });
        }

        $(document).ready(function () {
            $('#pageDemo1').click(function () {
                $.blockUI();
                test();
            });
            $("#<%=Button1.ClientID %>").click(function () {
                $.blockUI({ message: '<h1><img src="busy.gif" /> Just a moment...</h1>' });
                //test();
            });
            $('#pageDemo3').click(function () {
                $.blockUI({ css: { backgroundColor: '#f00', color: '#fff'} });
                test();
            });

            $('#process').click(function () {
                $.blockUI({ message: $('#domMessage') });
                test();
            });
        });
    </script>
</head>
<body>
    <form runat="server">
    <input type="button" id="pageDemo2" value="Ok" />
    <asp:Button ID="Button1" runat="server" Text="Button" OnClick="adf" />
    <div id="domMessage" style="display: none;">
        <h1>
            We are processing your request. Please be patient.</h1>
    </div>
    </form>
</body>
</html>
