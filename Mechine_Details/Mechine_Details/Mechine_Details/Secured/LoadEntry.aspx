<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoadEntry.aspx.cs" Inherits="Mechine_Details.Secured.LoadEntry" %>
<%@ Register Src="~/TL.ascx" TagPrefix="webuser" TagName="usrctrl" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Load Details</title>
    <style type="text/css">
        .auto-style1 {
            width: 38%;
            height: 242px;
        }
        .auto-style2 {
            width: 311px;
        }
        .auto-style3 {
            width: 483px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <webuser:usrctrl ID="usrctr1" runat="server" />
        <br />
        <div id="feedback" runat="server" >
            <table class="auto-style1" align="center" border="1">
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label1" runat="server" Text="SNo"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="txtsno" runat="server" Height="27px" Width="200px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtsno" ErrorMessage="*" ForeColor="#CC3300" ValidationGroup="g2"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label2" runat="server" Text="Customer Details"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="txtcdetails" runat="server" Height="27px" Width="200px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label3" runat="server" Text="Truck Number"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="txttnum" runat="server" Height="27px" Width="200px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label4" runat="server" Text="Lod in KG"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="txtload" runat="server" Height="27px" Width="200px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label5" runat="server" Text="Date"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="txtdate" runat="server" Height="27px" TextMode="DateTimeLocal" Width="200px"></asp:TextBox>
                    </td>
                </tr>
               
            </table>
            <div>

            </div>

            <div align="center">
                <asp:Button ID="btnInsert" runat="server" Text="Insert" Font-Bold="True" Font-Size="Larger" Height="44px" Width="123px" OnClick="btnInsert_Click" ValidationGroup="g2" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnFind" runat="server" Text="Find" Font-Bold="True" Font-Size="Larger" Height="44px" Width="123px" OnClick="btnFind_Click" ValidationGroup="g2" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnUpdate" runat="server" Text="Update" Font-Bold="True" Font-Size="Larger" Height="44px" Width="123px" OnClick="btnUpdate_Click" ValidationGroup="g2" Visible="False" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnDelete" runat="server" Text="Delete" Font-Bold="True" Font-Size="Larger" Height="44px" Width="123px" OnClick="btnDelete_Click" ValidationGroup="g2" Visible="False" />
            </div>
            <div>
                <hr />
            </div>
            <div>
                <asp:GridView ID="DVGloadData" runat="server" CellPadding="3" GridLines="Vertical" Height="189px" Width="821px"  align="center" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px">
                    <AlternatingRowStyle BackColor="#DCDCDC" />
                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#0000A9" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#000065" />

                </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>
