<%-- 
    Document   : ViewCart
    Created on : Jun 4, 2024, 1:20:14 PM
    Author     : Kim Nha
--%>

<%@page import="java.util.Date"%>
<%@page import="java.util.HashMap"%>
<%@page import="dto.Item"%>
<%@page import="dto.Item"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/tlds/thecuatui" prefix="v"%> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h4>
            <a href="GetAllItemsServlet">Home</a> <a href="ViewCart.jsp">view cart</a> <a href="LoginForm.jsp">login</a>
            <v:Welcome/>
        </h4>
        <%
            HashMap<Item, Integer> cart = (HashMap<Item, Integer>) session.getAttribute("cart");
            if (cart == null) {
                out.print("Your cart is empty");
                //request.getRequestDispatcher("GetAllItemsServlet").forward(request, response);
            }
            else {
        %>
        <h2>Thong tin gio hang</h2>
        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Image</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Action</th>
            </tr>
            <%
                int total = 0;
                for (Item i : cart.keySet()) {
                    int quantity = cart.get(i);
                    total += quantity * i.getPrice();
            %>
            <form action="EditCartServlet">
                <input type="hidden" value="<%= i.getItemid()%>" name="txtremoveid"/>
                <tr>
                    <td><%= i.getItemid()%></td>
                    <td><%= i.getItemname()%></td>
                    <td><img src="<%= i.getImageurl()%>" style="width: 100px; height: 100px"/></td>
                    <td><%= i.getPrice()%></td>
                    <td><input type="number" value="<%= quantity%>" min="1" max="20" name="txtquantity"/></td>
                    <td>
                        <input type="submit" value="remove" name="btnaction"/>
                        <input type="submit" value="update" name="btnaction"/>
                    </td>
                </tr>
            </form>
            <%
                }
            %>
        </table>
        <h4>Thong tin thanh toan: <%= total%> VND</h4>
        <h3>Ngay dat hang: <%= (new Date()).toString()%></h3>
        <h3>Ngay giao du kien: sau 7-15 ngay</h3>
        <h3><a href="SaveCartServlet?total=<%= total %>">Hoan thanh don hang</a></h3>
        <div style="height: 100px; width: 100%; background-color: pink; position: fixed; bottom: 0">
            <%
                //doc cookie
                Cookie[] arr = request.getCookies();
                if (arr != null) {
                    for (Cookie c: arr) {
                        if (c.getName().equalsIgnoreCase("topic")) {
                            String itemname = c.getValue();
                            //lay item trong database dua tren itemname
                            String s = "muon sung suwowng click vao day";
                            out.print("<h2>" + s + "</h2>");
                        }
                    }
                }
            %>
        </div>
        <% } %>
    </body>
</html>
