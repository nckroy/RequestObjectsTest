<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="RequestObjectsTest._Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <style type="text/css">
        .style1 {
            font-size: large;
            font-weight: bold;
            font-family: Arial, Helvetica, sans-serif;
        }
        .style2
        {
            font-family: Arial, Helvetica, sans-serif;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ObjectDataSource ID="RequestObjectsDS" runat="server" 
            SelectMethod="GetServerVars" TypeName="RequestObjectsTest._Default">
        </asp:ObjectDataSource>
        <asp:Image ID="RObjLogo" runat="server" AlternateText="RequestObjectsTest" 
            ImageUrl="~/Resources/logo.png" />
        <br />
        <br />
        <span class="style1">Server Variables</span><asp:GridView ID="RequestObjectsGV" 
            runat="server" AutoGenerateColumns="False" DataSourceID="RequestObjectsDS" 
            CssClass="style2">
            <RowStyle BackColor="#FFF4EA" Font-Names="Arial,Helvetica,Sans-Serif" />
            <Columns>
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Value" HeaderText="Value" SortExpression="Value" />
            </Columns>
            <HeaderStyle Font-Names="Arial,Helvetica,Sans-Serif" />
            <AlternatingRowStyle BackColor="#FFCC99" />
        </asp:GridView>
    </div>
    </form>
</body>
</html>
