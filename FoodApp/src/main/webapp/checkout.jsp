<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Checkout</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 20px;
            color: #333;
        }
        .checkout-container {
            width: 100%;
            max-width: 700px;
            margin: 40px auto;
            padding: 30px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
        }
        .section {
            margin-bottom: 25px;
        }
        .section h2 {
            font-size: 1.8em;
            color: #444;
            margin-bottom: 15px;
        }
        .section input[type="text"],
        .section input[type="tel"],
        .section textarea,
        .section select {
            width: 100%;
            padding: 12px 15px;
            border-radius: 5px;
            border: 1px solid #ccc;
            margin-bottom: 15px;
            font-size: 1em;
            transition: border-color 0.3s ease;
        }
        .section input:focus,
        .section textarea:focus {
            border-color: #ff6f61;
            outline: none;
        }
        .section textarea {
            resize: none;
        }
        .payment-options {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
            gap: 15px;
        }
        .payment-option {
            background-color: #f7f7f7;
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 15px;
            text-align: center;
            cursor: pointer;
            transition: background-color 0.3s ease, border-color 0.3s ease;
        }
        .payment-option:hover {
            background-color: #ff6f61;
            color: #fff;
            border-color: #ff6f61;
        }
        .payment-option input[type="radio"] {
            margin-right: 10px;
        }
        .checkout-btn {
            width: 100%;
            padding: 15px;
            background-color: #ff6f61;
            border: none;
            border-radius: 5px;
            color: white;
            font-size: 1.2em;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .checkout-btn:hover {
            background-color: #e55b4f;
        }
    </style>
</head>
<body>
    <div class="checkout-container">
        <form action="processOrder" method="post">
            <div class="section">
                <h2>Shipping Address</h2>
                <textarea name="address" placeholder="Enter your full address, including city, state, and ZIP code" rows="4" required></textarea>
                <input type="tel" name="phone" placeholder="Phone Number" required>
                <textarea name="deliveryInstructions" placeholder="Delivery Instructions (Optional)" rows="3"></textarea>
            </div>
            <div class="section">
                <h2>Payment Options</h2>
                <div class="payment-options">
                    <label class="payment-option">
                        <input type="radio" name="paymentMethod" value="creditCard" required> Credit Card
                    </label>
                    <label class="payment-option">
                        <input type="radio" name="paymentMethod" value="debitCard" required> Debit Card
                    </label>
                    <label class="payment-option">
                        <input type="radio" name="paymentMethod" value="netBanking" required> Net Banking
                    </label>
                    <label class="payment-option">
                        <input type="radio" name="paymentMethod" value="cod" required> Cash on Delivery
                    </label>
                </div>
            </div>
            
            <button type="submit" class="checkout-btn">Place Order</button>
        </form>
    </div>
</body>
</html>
