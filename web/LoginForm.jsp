<%-- 
    Document   : LoginForm
    Created on : Jun 7, 2024, 1:18:23 PM
    Author     : Kim Nha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="LoginServlet" method="get">
            <p><input type="text" placeholder="enter email" name="txtemail"/></p>
            <p><input type="password" placeholder="enter password" name="txtpassword"/></p>
            <p><input type="submit" value="login" name="action"/></p>
        </form>
        <p style="color:red"><%= (session.getAttribute("Error") != null) ? "Invalid login" : "" %></p>
        <% 
            if (session.getAttribute("Error") != null)
                session.removeAttribute("Error");
            %>
    </body>
</html>
