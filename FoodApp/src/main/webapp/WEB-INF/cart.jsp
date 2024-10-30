<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>View Cart</title>
    <style>
        /* Add your CSS styles here */
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h2>Your Cart Items</h2>

    <c:choose>
        <c:when test="${not empty cart.items}">
            <table>
                <tr>
                    <th>Item Name</th>
                    <th>Quantity</th>
                    <th>Price</th>
                    <th>Subtotal</th>
                    <th>Action</th>
                </tr>

                <!-- Iterate over cart items and display them -->
                <c:forEach var="item" items="${cart.items.values()}">
                    <tr>
                        <td>${item.menuName}</td>
                        <td>${item.quantity}</td>
                        <td>${item.price}</td>
                        <td>${item.subTotal}</td>
                        <td>
                            <!-- Link to remove item from cart -->
                            <a href="removeItem?itemId=${item.itemId}">Remove</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
            <br>
            <h3>Total: ${cart.totalPrice}</h3>
            <a href="checkout.jsp">Proceed to Checkout</a>
        </c:when>

        <c:otherwise>
            <p>Your cart is empty!</p>
            <a href="menu.jsp">Continue Shopping</a>
        </c:otherwise>
    </c:choose>
</body>
</html>
