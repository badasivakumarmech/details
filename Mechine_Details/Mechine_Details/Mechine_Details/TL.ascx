<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TL.ascx.cs" Inherits="Mechine_Details.TL" %>
    <div>
    <nav class="navbar navbar-expand-md bg-light bsb-navbar bsb-navbar-hover bsb-navbar-caret">
        <div class="container">
            <a class="navbar-brand" href="https://localhost:44355/Home.aspx">
             <asp:ImageButton ID="ImageButton1" runat="server" Width="135px" Height="44px" ImageUrl="~/Images/vvit_logo.png" alt="BootstrapBrain Logo" PostBackUrl="~/HomeTL.aspx" />
&nbsp;</a><div align="right">

                <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/HomeTL.aspx">Home</asp:LinkButton>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:LinkButton ID="LinkButton2" runat="server" PostBackUrl="~/Secured/Machine.aspx">Machine Details</asp:LinkButton>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <asp:LinkButton ID="LinkButton6" runat="server" PostBackUrl="~/Secured/LoadEntry.aspx">Customer Details</asp:LinkButton>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:LinkButton ID="LinkButton3" runat="server" PostBackUrl="~/ContactUs.aspx">ContactUs</asp:LinkButton>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:LinkButton ID="LinkButton4" runat="server" PostBackUrl="~/RegistationTL.aspx">Regestation</asp:LinkButton>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:LinkButton ID="LinkButton5" runat="server" PostBackUrl="~/LoginTL.aspx">Login</asp:LinkButton>

            </div>
        </div>
    </nav>
</div>



