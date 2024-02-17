<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Machine.aspx.cs" Inherits="Mechine_Details.Secured.Machine" %>
<%@ Register Src="~/TL.ascx" TagPrefix="webuser" TagName="usrctrl" %>

<!DOCTYPE html>

<%--<html xmlns="http://www.w3.org/1999/xhtml">--%>
<head runat="server">
    <title>Machine</title>
    <style type="text/css">
    
    .auto-style1 {
        width: 37%;
    }
    .auto-style2 {
        height: 31px;
    }
    .auto-style3 {
        height: 33px;
    }
    .auto-style4 {
        width: 1365px;
        height: 1114px;
    }
    .auto-style5 {
        width: 345px;
    }
    .auto-style6 {
        height: 31px;
        width: 345px;
    }
    .auto-style7 {
        height: 33px;
        width: 345px;
    }       
    </style>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <webuser:usrctrl ID="usrctr1" runat="server" />
      <br />
        <div id="feedback" runat="server">
        <table align="center" border="1" class="auto-style1">
            <tr>
                <td colspan="2">
                    <h4>Employee Details</h4>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label Text="Id" runat="server" />
                </td>
                <td class="auto-style5">
                    <asp:TextBox ID="txtID" runat="server"></asp:TextBox>
                    &nbsp;
                    <asp:RequiredFieldValidator ID="RFV1" runat="server" ControlToValidate="txtID" ErrorMessage="Id Is Manda" ForeColor="#CC3300" ValidationGroup="g1"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="Machine Name"></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:TextBox ID="txtMName" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label4" runat="server" Text="Manufacturing By"></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:TextBox ID="txtMB" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label5" runat="server" Text="Machine Number"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtMN" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Label6" runat="server" Text="Image"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                <td class="auto-style7">
                    <asp:FileUpload ID="fileuploadImage" runat="server" />
                    <asp:Label ID="lblIm" runat="server" Visible="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label1" runat="server" Text="Analysis&amp;Maintainance"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtAM" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="right" class="auto-style2">
                    <asp:Button ID="btnsave" runat="server" Height="40px" OnClick="btnsave_Click" Text="Save" Width="70px" ValidationGroup="g1" />
                </td>
                <td class="auto-style6">
                    <asp:Button ID="btnFind" runat="server" Height="40px" OnClick="btnFind_Click" Text="Find" Width="70px" ValidationGroup="g1" />
                </td>
            </tr>
            <tr>
                <td align="right" class="auto-style2">
                    <asp:Button ID="btnDelete" runat="server" Height="40px" OnClick="btnDelete_Click" Text="Delete" Width="70px" ValidationGroup="g1" Visible="False" />
                </td>
                <td class="auto-style6">
                    <asp:Button ID="btnupdate" runat="server" Height="40px" OnClick="btnupdate_Click" Text="Update" Width="70px" ValidationGroup="g1" Visible="False" />
                </td>
            </tr>         
        </table>
    </div>
        <div align="right">
               <asp:Button ID="btnlogout" runat="server" Text="LogOut" Height="39px" Width="109px" OnClick="btnlogout_Click" />&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        </div>
    <hr />
    <div align="center" class="auto-style4">
        <asp:GridView ID="grdEmployee" runat="server" AutoGenerateColumns="False" Width="1039px" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
            <AlternatingRowStyle BackColor="#F7F7F7" />
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" />
                <asp:BoundField DataField="Machine_Name" HeaderText="Machine Name" />
                <asp:BoundField DataField="Manufacturing_By" HeaderText="Manufacturing By" />
                <asp:BoundField DataField="Machine_Number" HeaderText="Machine Number" />
                <asp:TemplateField HeaderText="Image">
                    <ItemTemplate>
                        <asp:Image ID="Image1" runat="server" Height="100" ImageUrl='<%# "data.ashx?Id="+Eval("Id") %>' Width="200" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Analysis_Maintainance" HeaderText="Analysis&amp;Maintainance" />
            </Columns>
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            <SortedAscendingCellStyle BackColor="#F4F4FD" />
            <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
            <SortedDescendingCellStyle BackColor="#D8D8F0" />
            <SortedDescendingHeaderStyle BackColor="#3E3277" />
        </asp:GridView>
    </div>
    </form>
</body>