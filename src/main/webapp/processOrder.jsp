<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
    Connection con = null;
    PreparedStatement preparedStatement = null;

    try {
        // Establish a connection to the MySQL server
        Class.forName("com.mysql.cj.jdbc.Driver");

        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo", "root", "22071A66E5vnr");

        // Set auto-commit to true
        con.setAutoCommit(true);

        // Prepare the SQL statement for insertion
        String sql = "INSERT INTO cart (id, name, price, quantity, paymentMode, orderDate) VALUES (?, ?, ?, ?, ?, ?)";
        preparedStatement = con.prepareStatement(sql);

        // Retrieve data from the request parameters
        int productId = Integer.parseInt(request.getParameter("productId"));
        String productName = request.getParameter("productName");
        double productPrice = Double.parseDouble(request.getParameter("productPrice"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String paymentMode = request.getParameter("paymentMethod");
        Timestamp orderDate = Timestamp.valueOf(request.getParameter("orderDate"));

        // Set values for the prepared statement
        preparedStatement.setInt(1, productId);
        preparedStatement.setString(2, productName);
        preparedStatement.setDouble(3, productPrice);
        preparedStatement.setInt(4, quantity);
        preparedStatement.setString(5, paymentMode);
        preparedStatement.setTimestamp(6, orderDate);

        // Execute the SQL statement
        preparedStatement.executeUpdate();

        // Send a success response
        response.getWriter().write("Order placed successfully!");

    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
        response.getWriter().write("Error placing order. Please try again.");
    } finally {
        // Close the resources
        try {
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (con != null && !con.isClosed()) {
                con.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>

