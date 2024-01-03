<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Details.aspx.cs" Inherits="webForm_DB.Details" %>
<%@ Import Namespace="System.Web.UI.WebControls" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Details</title>
    <style type="text/css">
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }

        #form1 {
            max-width: 800px;
            margin: 20px auto;
            background-color: #fff;
            border: 1px solid #ddd;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        #GridView1 {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        #GridView1 th, #GridView1 td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: center;
        }

        #GridView1 th {
            background-color: #990000;
            color: #FFFFCC;
            font-weight: bold;
        }

        #GridView1 tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        #GridView1 tr:hover {
            background-color: #ffd699;
        }

        
        #GridView1 .cancel-button,
        #GridView1 .update-button {
            background-color: #4CAF50;
            color: #fff;
            border: none;
            padding: 6px 12px;
            cursor: pointer;
            border-radius: 4px;
        }

        #GridView1 .edit-button:hover,
        #GridView1 .cancel-button:hover,
        #GridView1 .update-button:hover {
            background-color: #45a049;
        }
        video {
            position: fixed;
            top: 50%;
            left: 50%;
            min-width: 100%;
            min-height: 100%;
            width: auto;
            height: auto;
            transform: translateX(-50%) translateY(-50%);
            z-index: -1;
        }

    </style>
</head>
<body>
    <video autoplay loop muted>
        <source src="Images/bgVideo.mp4" type="video/mp4">
        Your browser does not support the video tag.
    </video>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating"
                OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting"
                DataKeyNames="ID" class="styled-table" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:TemplateField HeaderText="Edit" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:ImageButton ID="imgEdit" runat="server" CommandName="Edit" ToolTip="Edit" ImageUrl="~/Images/Edit.jpg"
                                Height="18px" Width="18px" OnClientClick="return confirm('Are you sure you want to edit?');" CssClass="edit-button" />
                            <asp:Button ID="btnCancelEdit" runat="server" CommandName="Cancel" Text="Cancel" Visible="false"
                                OnClientClick="return confirm('Are you sure you want to cancel?');" CssClass="cancel-button" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Button ID="btnUpdate" runat="server" CommandName="Update" Text="Update"
                                OnClientClick="return confirm('Are you sure you want to update?');" CssClass="update-button" />
                            <asp:Button ID="btnCancelUpdate" runat="server" CommandName="Cancel" Text="Cancel"
                                OnClientClick="return confirm('Are you sure you want to cancel?');" CssClass="cancel-button" />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" ReadOnly="true" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="Department" HeaderText="Department" SortExpression="Department" />
                    <asp:BoundField DataField="Age" HeaderText="Age" SortExpression="Age" />
                    <asp:TemplateField HeaderText="Delete" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:ImageButton ID="imgDelete" runat="server" CommandName="Delete" ToolTip="Delete" ImageUrl="~/Images/dlt.png" Height="14px" Width="14px" OnClientClick="return confirm('Are you sure you want to delete?');" CssClass="delete-button" />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
        </div>
    </form>
</body>
</html>
