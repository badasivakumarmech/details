<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginTL.aspx.cs" Inherits="Mechine_Details.LoginTL" %>
<%@ Register Src="~/TL.ascx" TagPrefix="webuser" TagName="usrctrl" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Login</title>
 <link href="Content/bootstrap.min.css" rel="stylesheet" />

</head>
<body>
    
  <form method="post" runat="server">
     <webuser:usrctrl ID="usrctr1" runat="server" />
              <br />
<div class="bg-light py-3 py-md-5">
  <div class="container">
    <div class="row justify-content-md-center">
      <div class="col-12 col-md-11 col-lg-8 col-xl-7 col-xxl-6">
        <div class="bg-white p-4 p-md-5 rounded shadow-sm">
         

            <div class="row gy-3 gy-md-4 overflow-hidden">
              <div class="col-12">
                <label for="email" class="form-label"
                  >Email <span class="text-danger">*</span></label
                >
                <div class="input-group">
                  <span class="input-group-text">
                    <svg
                      xmlns="http://www.w3.org/2000/svg"
                      width="16"
                      height="16"
                      fill="currentColor"
                      class="bi bi-envelope"
                      viewBox="0 0 16 16"
                    >
                      <path
                        d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4Zm2-1a1 1 0 0 0-1 1v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1H2Zm13 2.383-4.708 2.825L15 11.105V5.383Zm-.034 6.876-5.64-3.471L8 9.583l-1.326-.795-5.64 3.47A1 1 0 0 0 2 13h12a1 1 0 0 0 .966-.741ZM1 11.105l4.708-2.897L1 5.383v5.722Z"
                      />
                    </svg>
                  </span>
                  <asp:TextBox
                    CssClass="form-control"
                    runat="server"
                    Font-Names="email"
                    ID="txtemail"
                    TextMode="Email"
                    
                  ></asp:TextBox>
                </div>
              </div>
              <div class="col-12">
                <label for="password" class="form-label"
                  >Password <span class="text-danger">*</span></label
                >
                <div class="input-group">
                  <span class="input-group-text">
                    <svg
                      xmlns="http://www.w3.org/2000/svg"
                      width="16"
                      height="16"
                      fill="currentColor"
                      class="bi bi-key"
                      viewBox="0 0 16 16"
                    >
                      <path
                        d="M0 8a4 4 0 0 1 7.465-2H14a.5.5 0 0 1 .354.146l1.5 1.5a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0L13 9.207l-.646.647a.5.5 0 0 1-.708 0L11 9.207l-.646.647a.5.5 0 0 1-.708 0L9 9.207l-.646.647A.5.5 0 0 1 8 10h-.535A4 4 0 0 1 0 8zm4-3a3 3 0 1 0 2.712 4.285A.5.5 0 0 1 7.163 9h.63l.853-.854a.5.5 0 0 1 .708 0l.646.647.646-.647a.5.5 0 0 1 .708 0l.646.647.646-.647a.5.5 0 0 1 .708 0l.646.647.793-.793-1-1h-6.63a.5.5 0 0 1-.451-.285A3 3 0 0 0 4 5z"
                      />
                      <path d="M4 8a1 1 0 1 1-2 0 1 1 0 0 1 2 0z" />
                    </svg>
                  </span>
                  <asp:TextBox
                    CssClass="form-control"
                    runat="server"
                    Font-Names="password"
                    ID="txtpassword"
                    TextMode="Password"                   
                  ></asp:TextBox>
                </div>
              </div>
              <div class="col-12">
                  <div class="d-grid" align="center">
    <asp:CheckBox Text="RememberMe" runat="server" CssClass="form-label text-center" ID="chkr" />
  </div>
                <div class="d-grid">
                  
                    <asp:Button ID="btnlogin" runat="server" CssClass="btn btn-primary btn-lg" Text="Login" OnClick="btnlogin_Click" />
                </div>
              </div>
              <div class="col-12" align="left">
                <div class="d-grid" >

                  <asp:Label
                    runat="server"
                    ID="lblDisplay"
                    CssClass="form-label text-center"
                    ForeColor="#CC0000"
                  ></asp:Label>
                </div>
              </div>
              <div class="row">
                <div class="col-12">
                  <hr class="mt-5 mb-4 border-secondary-subtle" />
                  <p class="m-0 text-secondary text-center">
                    Create Account
                   <asp:LinkButton Text="Register" runat="server" PostBackUrl="~/RegistationTL.aspx" />
                    
                  </p>
                </div>
              </div>
            </div>
        </div>
      </div>
    </div>
  </div>
</div>
          </form>
</body>
</html>
