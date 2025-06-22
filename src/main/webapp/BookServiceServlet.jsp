<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Laptop Service Booking</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">

    <!-- Style -->
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: #f4f6f8;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 40px;
        }

        .booking-container {
            background: #fff;
            max-width: 700px;
            width: 100%;
            border-radius: 15px;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

        .booking-header {
            background-color: #65C96E;
            color: #fff;
            padding: 30px;
            text-align: center;
        }

        .booking-header h2 {
            margin-bottom: 10px;
        }

        .booking-form {
            padding: 30px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #333;
        }

        .form-control,
        select,
        textarea {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 15px;
            transition: border-color 0.3s;
        }

        .form-control:focus,
        select:focus,
        textarea:focus {
            border-color: #65C96E;
            outline: none;
        }

        textarea {
            resize: none;
        }

        .form-row {
            display: flex;
            gap: 20px;
            flex-wrap: wrap;
        }

        .form-row .form-group {
            flex: 1;
        }

        .submit-btn {
            background-color: #65C96E;
            color: white;
            border: none;
            padding: 14px 30px;
            font-size: 16px;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            width: 100%;
        }

        .submit-btn:hover {
            background-color: #55b05c;
        }

        @media (max-width: 600px) {
            .form-row {
                flex-direction: column;
            }
        }
    </style>
</head>

<body>

    <div class="booking-container">
        <div class="booking-header">
            <h2>Laptop Service Booking</h2>
            <p>Submit your laptop issue below. Our experts will get back to you soon!</p>
        </div>

        <form class="booking-form" action="BookServiceServlet" method="post">
            <div class="form-row">
                <div class="form-group">
                    <label class="form-label">Customer Name</label>
                    <input class="form-control" type="text" name="customerName" required placeholder="e.g. Praveenkumar">
                </div>
                <div class="form-group">
                    <label class="form-label">Laptop Name</label>
                    <input class="form-control" type="text" name="laptopName" required placeholder="e.g. Dell Inspiron">
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label class="form-label">Phone Number</label>
                    <input class="form-control" type="tel" name="phone" required placeholder="e.g. 9789926026">
                </div>
                <div class="form-group">
                    <label class="form-label">Issue Type</label>
                    <select class="form-control" name="issue" required>
                        <option disabled selected>Select an issue</option>
                        <option>Replace Battery</option>
                        <option>Replace Keyboard</option>
                        <option>General Service</option>
                        <option value="enter">Enter Details</option>
                    </select>
                </div>
            </div>

            <div class="form-group">
                <label class="form-label">Detailed Description</label>
                <textarea class="form-control" name="description" rows="5"
                    placeholder="Describe your issue in detail..."></textarea>
            </div>

            <div class="form-group">
                <button type="submit" class="submit-btn">Submit Booking</button>
            </div>
        </form>
    </div>

</body>

</html>
