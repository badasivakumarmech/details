<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="Mechine_Details.ContactUs" %>
<%@ Register Src="~/TL.ascx" TagPrefix="webuser" TagName="usrctrl" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ContactUs</title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <webuser:usrctrl ID="usrctr1" runat="server" />
      <br />
  <div class="bg-light py-3 py-md-5">
  <div class="container">
    <div class="row justify-content-md-center">
      <div class="col-12 col-md-11 col-lg-8 col-xl-7 col-xxl-6">
          <h1>textileplant@gmail.com</h1>
            <hr />
            <h1>ph:123456789</h1>
      </div>
    </div>
  </div>
</div>
       
 </form>
</body>
</html>
