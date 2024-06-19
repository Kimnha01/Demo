<%-- 
    Document   : index.jsp
    Created on : Jun 4, 2024, 12:44:24 PM
    Author     : Kim Nha
--%>

<%@page import="dto.Item"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/tlds/thecuatui" prefix="v"%> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h4><a href="GetAllItemsServlet">Home</a> <a href="ViewCart.jsp">view cart</a> <a href="LoginForm.jsp">login</a></h4>
        <form action="GetAllItemsServlet">
            <input type="text" name="txtitemname" value="<%= request.getParameter("itemname")%>"/>
            <input type="submit" value="find"/>
        </form>
        <%
            ArrayList<Item> list = (ArrayList<Item>) request.getAttribute("ListItems");
            if (list != null) {
                for (Item i : list) {
        %>
        
        <v:ItemTag id="<%= i.getItemid() %>"/>
        
        <%
                }
            }
        %>
    </body>
</html>
