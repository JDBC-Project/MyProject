<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <title>E-commerce/Shop</title>
    <style>

        .product-card {
            border: 1px solid #ddd;
            padding: 10px;
            margin: 5%;
            width: 280px;
            height: 440px; /* Set a fixed height for all cards */
            text-align: center;
            float: left;
            background-color: #f9f9f9;
            box-sizing: border-box; /* Include padding and border in the element's total width and height */
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
        }

        h3 {
            margin: 0;
        }

        .product-card img {
            width: 100%;
            height: 250px; /* Set a fixed height for the images */
            object-fit: cover; /* This property ensures that the image covers the entire container while maintaining aspect ratio */
        }
        body{
            background-color:#f0f0f0;
        }
    </style>
</head>
<body >

    <%
        Connection con = null;
        try {
            // Establish a connection to the MySQL server
            Class.forName("com.mysql.cj.jdbc.Driver");

            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo", "root", "22071A66E5vnr");

            // Set auto-commit to true
            con.setAutoCommit(true);

            PreparedStatement preparedStatement = con.prepareStatement("SELECT * FROM products");

            // Execute the query and get the result set
            ResultSet resultSet = preparedStatement.executeQuery();

            // Display product information in the form of cards
           while (resultSet.next()) {
                   int productId = resultSet.getInt("id");
                   String productName = resultSet.getString("name");
                   double productPrice = resultSet.getDouble("price");
                   String productImage = resultSet.getString("image");

                   // Card layout
                   out.println("<div class=\"product-card\">");
                   out.print("<img src=\"" + productImage + "\" />");
                   out.print("<h5>" + productId + "</h5>");
                   out.print("<h5>" + productName + "</h5>");
                   out.print("<h5>Price: $" + productPrice + "</h5>");

                   // Link to cart.jsp with query parameters
                   out.print("<a href=\"cart.jsp?productId=" + productId + "&productName=" + productName + "&productPrice=" + productPrice + "\">");
                   out.print("<button class=\"btn btn-success w-50 mx-auto\">Buy Now</button>");
                   out.print("</a>");

                   out.println("</div>");
                   }

            resultSet.close();
            preparedStatement.close();

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            // Close the connection in the finally block
            try {
                if (con != null && !con.isClosed()) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    %>
</body>
</html>
