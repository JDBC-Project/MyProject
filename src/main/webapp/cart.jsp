<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<title>E-commerce/Shop/cart</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI/tT8OlbjMaUPY92De3Fp1pfU9a0ac1OSpmeNJA=" crossorigin="anonymous"></script>
    <!-- Include necessary styles or scripts -->
    <style>
        /* Add your styles here */
        .cart-container {
            border: 1px solid #ddd;
            padding: 20px;
            margin-top:7rem;
            background-color: #f9f9f9;
            box-sizing: border-box;
            box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
            width: 50%;
        }
        body{
            background-color:#F6D6D6;
        }


        /* Add any additional styles as needed */
    </style>
</head>
<body>

<%
    // Retrieve product information from query parameters
    int productId = Integer.parseInt(request.getParameter("productId"));
    String productName = request.getParameter("productName");
    double productPrice = Double.parseDouble(request.getParameter("productPrice"));

    // Use the retrieved information as needed, for example, display in the cart
%>

<div class="cart-container mx-auto">
    <h2 class="text-center">Product Details</h2>
    <p><strong>Product ID:</strong> <%= productId %></p>
    <p><strong>Product Name:</strong> <%= productName %></p>
    <p><strong>Product Price:</strong> $<%= productPrice %></p>

    <!-- Input box for quantity -->
    <label for="quantity">Quantity:</label>
    <input type="number" id="quantity" name="quantity" value="1" min="1">
    <br/><br/>

    <!-- Select option for payment method -->
    <label for="paymentMethod">Payment Method:</label>
    <select id="paymentMethod" name="paymentMethod">
        <option value="card">Credit Card</option>
        <option value="cash">Cash</option>
        <option value="upi">UPI</option>
    </select>
    <br/>
    <!-- Place Order button -->
    <button class="btn btn-success m-3" onclick="placeOrder()">Place Order</button>
</div>

<script>
    function placeOrder() {
        alert("Order placed successfully!");
    }
</script>

</body>
</html>

