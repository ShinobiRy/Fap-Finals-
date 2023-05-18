<%@page import="java.util.List"%>
<%@page import="model.User"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Users</title>
</head>
<body>
    
    <style>
        
        * {
            box-sizing: border-box;
            font-family: 'Sora', sans-serif;
        }

        body {
            display: flex;
            flex-direction: column;
            align-items: center;
            height: 100vh;
            padding: 20px;
        }

        .table-container {
            display: flex;
            justify-content: flex-end;
            width: 100%;
        }

        table {
            position: relative;
            margin: 0 auto;
            border-collapse: collapse;
            width: 80%;
            max-width: 800px;
            bottom: 325px;
            left: 520px;
        }

        th, td {
            border: 1px solid black;
            padding: 8px;
        }

        th {
            background-color: #8D8F84;
            font-weight: bold;
            text-align: left;
        }

        form {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-top: 20px;
        }

        label {
            margin-bottom: 5px;
        }

        input[type="text"] {
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            margin-bottom: 10px;
        }

        button[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button[type="submit"]:hover {
            background-color: #3e8e41;
        }

        button.generate-pdf {
            position: relative;
            bottom: 3150px;
            right: 535px;
            background-color: #d9534f;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button.generate-pdf:hover {
            background-color: #5A5A5A;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
              
        /* Forms CSS */
        .add-user-form{
            position: relative;
            right: 260px;
            top: 50px;
        }
        
        .delete-user-form{
            position: relative;
            right: 350px;
            top: 190px;
        }
        
        .edit-user-form{
            position: relative;
            right: 310px; 
            top: 300px;
        }
        
        .new-username{
            position: relative;
            right: 1px;
            top: 10px;
        }
        
        .new-password{
            position: relative;
            right: 1px;
            top: 10px;
        }
        
        .user-role{
            position: relative;
            right: 1px;
            top: 10px;
        }
        
        .add-user-button,.delete-user-button,.edit-user-button{
          position: relative;           
          left: 30px;
          padding: 5px 10px;  /* Adjust the padding as needed */
          background-color: #777777;  /* Set the background color */
          color: white;  /* Set the text color */
          font-size: 16px;  /* Set the font size */
          border: none;  /* Remove the default border */
          border-radius: 4px;  /* Apply rounded corners */
        }
        
        .add-user-button:hover,.delete-user-button:hover,.edit-user-button:hover{
          background-color: #555555;  /* Change the background color on hover */
        }
        
        .edit-user-button{
          position: relative;      
          top: 10px;
          left: 30px;
          padding: 5px 10px;  /* Adjust the padding as needed */
          background-color: #777777;  /* Set the background color */
          color: white;  /* Set the text color */
          font-size: 16px;  /* Set the font size */
          border: none;  /* Remove the default border */
          border-radius: 4px;  /* Apply rounded corners */
        }
        
        
        .user-role {
            width: 100px;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 13px;
            appearance: none;
            background-color: #fff;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='10' height='6' viewBox='0 0 10 6'%3E%3Cpath fill='%23616161' d='M5 6L0 1h10z'/%3E%3C/svg%3E");
            background-repeat: no-repeat;
            background-position: right 8px center;
            cursor: pointer;
        }

        .user-role:hover {
            border-color: #999;
        }
       
        .add-user-label,.delete-user-label,.edit-user-label{
            position: relative;
            top: -5px;
            font-size: 30px;
        }
        
        .generate-file-label{
            position: relative;
            top: 380px;
            right: 272px;
            font-size: 30px;
        }
        
        .disclaimer-label{
           font-size: 12px; 
        }
        /* Navbar CSS*/
       
        
        
    </style>

    
    
    <main>
      
    <form class="add-user-form">
        <div class="content">
          <div class="form-container">
            <div class="add-user-label">Add User</div>
            <input type="text" placeholder="Username">
            <input type="text" placeholder="Password">
            <input type="text" placeholder="Captcha">
            <button class="add-user-button">Add User</button>
          </div>
        </div>    
     </form>
        
    <form class="delete-user-form">
      <div class="form-container">
        <div class="delete-user-label">Delete User</div>
        <input type="text" placeholder="Username">
        <input type="text" placeholder="Captcha">
        <button class="delete-user-button">Delete User</button>
      </div>
    </form>
 
      
    <form class="edit-user-form">
     <div class="form-container">
     <div class="edit-user-label">Edit User</div>
     <input type="text" placeholder="Username to edit">
     <div class="disclaimer-label">leave fields blank if nothing to edit</div>
     <input class="new-username" type="text" placeholder="New Username">
     <input class="new-password" type="text" placeholder="New Password">
       <select class="user-role" id="user-role" name="user-role">
          <option value="admin">Admin</option>
          <option value="guest">Guest</option>
       </select>
       <button class="edit-user-button">Edit User</button>
     </div>
    </form>    
    
    <div class="generate-file-label">Generate File</div>    
        
    </main>    
        
    <table>
        <tr>
            <th>Username</th>
            <th>User Role</th>
            <th>Date Created</th>
            <th>Date Last Purchased</th>
        </tr>        
        	<%
            // Retrieve the users
            List<User> users = (List<User>) getServletContext().getAttribute("userList");
            
            for (User user : users) {
        %>
        <tr>
            <td><%=user.getUsername()%></td>
            <td><%=user.getUserRole()%></td>
            <td><%=user.getDateCreated().toString()%></td>
            <td><%
                if (user.getUserRole().equalsIgnoreCase("ADMIN")) {
                    out.println("Not Applicable");
                } else if (user.getDateLastPurchased() == null) {
                    out.println("No Purchase History");
                } else {
                    out.println(user.getDateLastPurchased());
                }
                %>
            </td>
        </tr>
        <%
            }
        %>

        
    </table>

    <button class="generate-pdf" type="submit">Generate PDF</button>

</body>
</html>