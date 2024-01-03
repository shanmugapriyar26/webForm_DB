<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentDB.aspx.cs" Inherits="webForm_DB.StudentDB" EnableViewState="true" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            overflow: hidden;
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
        

        h1 {
            color: #333;
        }

        #form2 {
           background-color: rgba(255, 255, 255, 0.7);
            border: 1px solid #ddd;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .center-wrapper div {
            margin-bottom: 15px;
        }

        label {
            display: inline-block;
            width: 120px;
            text-align: right;
            margin-right: 10px;
            font-weight: bold;
        }

        input[type="text"],
        select {
            padding: 8px;
            width: 200px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        #Button1 {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        #Button1:hover {
            background-color: #45a049;
        }

        .center-wrapper {
            text-align: center;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            margin: 0 auto;
        }
       

    </style>

    <script>
        function validateForm() {
            var name = document.getElementById('<%=txtName.ClientID%>').value.trim();
            var department = document.getElementById('<%=ddlDept.ClientID%>').value.trim();
            var age = document.getElementById('<%=txtAge.ClientID%>').value.trim();
            var nameRegex = /^[A-Za-z\s]+$/;
            var ageRegex = /^\d+$/;
            if (!nameRegex.test(name)) {
                alert('Please enter a valid name.');
                return false;
            }
            if (department === '') {
                alert('Please select your department.');
                return false;
            }
            if (!ageRegex.test(age)) {
                alert('Please enter a valid age.');
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
    <video autoplay loop muted>
        <source src="Images/bgVideo.mp4" type="video/mp4">
        Your browser does not support the video tag.
    </video>
    <form id="form2" runat="server">
        <div class="center-wrapper">
            <h1>Welcome to db</h1>
            <div>
                <asp:Label ID="stuName" runat="server" Text="Name : "></asp:Label>
                <asp:TextBox ID="txtName" runat="server" placeholder="Enter your name"></asp:TextBox>
            </div><br />
            <div>
                <asp:Label ID="stuDept" runat="server" Text="Department : "></asp:Label>
                <asp:DropDownList ID="ddlDept" runat="server">
                    <asp:ListItem Text="Select Department" Value="" />
                    <asp:ListItem Text="CSE" Value="CSE" />
                    <asp:ListItem Text="ECE" Value="ECE" />
                    <asp:ListItem Text="MECH" Value="MECH" />
                    <asp:ListItem Text="IT" Value="IT" />
                </asp:DropDownList>
            </div>
            <br />
            <div>
                <asp:Label ID="stuAge" runat="server" Text="Age : "></asp:Label>
                <asp:TextBox ID="txtAge" runat="server" placeholder="Enter your age"></asp:TextBox>
            </div><br />
            <div>
                <asp:Button ID="Button1" runat="server" Text="Submit my details" OnClientClick="return validateForm();" OnClick="Button1_Click" />
                <asp:Label ID="lblSubmit" runat="server" Visible="false" ForeColor="Green" EnableViewState="true"></asp:Label>
            </div><br />
        </div>
    </form>
</body>
</html>
