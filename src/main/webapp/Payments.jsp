<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Payment Page</title>
<!-- Include Bootstrap CSS -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<style>
    body {
        background-color: #f4f4f9;
        font-family: 'Arial', sans-serif;
    }
    .btn-primary {
        background-color: #007bff;
        border-color: #007bff;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        transition: background-color 0.3s, border-color 0.3s;
    }
    .btn-primary:hover {
        background-color: #0056b3;
        border-color: #004885;
    }
    .modal-content {
        border-radius: 8px;
    }
    .modal-header {
        background-color: #007bff;
        color: white;
    }
    .form-control {
        border-radius: 4px;
        border: 1px solid #ccc;
    }
    .container {
        padding-top: 50px;
        text-align: center;
    }
    
    .btn-info {
    background-color: #17a2b8;
    border-color: #17a2b8;
    }
    .btn-info:hover {
    background-color: #138496;
    border-color: #117a8b;
    }
</style>
</head>
<body>

<div class="container">
    <!-- Button to Open the Modal -->
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#paymentModal">
      Pay to User
    </button>
     <!-- New Button to Open the Message Modal -->
    <button type="button" class="btn btn-info" data-toggle="modal" data-target="#messageModal">
      Send Message to User
    </button>
</div>

<!-- The Modal -->
<div class="modal fade" id="paymentModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="modalLabel">Send Money</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form id="paymentForm">
          <div class="form-group">
            <label for="username">Username:</label>
            <input type="text" class="form-control" id="username" required>
          </div>
          <div class="form-group">
            <label for="cardNumber">Card Number:</label>
            <input type="text" class="form-control" id="cardNumber" required>
          </div>
          <div class="form-group">
            <label for="amount">Enter Money in Rs:</label>
            <input type="number" class="form-control" id="amount" required>
          </div>
          <button type="button" class="btn btn-success" onclick="sendMoney()">Send Money</button>
        </form>
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="messageModal" tabindex="-1" role="dialog" aria-labelledby="messageModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="messageModalLabel">Send Message</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form id="messageForm">
          <div class="form-group">
            <label for="messageUsername">Username:</label>
            <input type="text" class="form-control" id="messageUsername" required>
          </div>
          <div class="form-group">
            <label for="messageContent">Message:</label>
            <textarea class="form-control" id="messageContent" required></textarea>
          </div>
          <button type="button" class="btn btn-info" onclick="sendMessage()">Send Message</button>
        </form>
      </div>
    </div>
  </div>
</div>
<!-- Include Bootstrap JS and its dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
function sendMoney() {
    var username = document.getElementById('username').value;
    var cardNumber = document.getElementById('cardNumber').value;
    var amount = document.getElementById('amount').value;

    alert('Money sent to ' + username);
    $('#paymentModal').modal('hide'); // Hide the modal after sending money
}

function sendMessage() {
    var username = document.getElementById('messageUsername').value;
    var message = document.getElementById('messageContent').value;

    // Here you would typically handle the message sending logic (e.g., API call)
    // For demonstration, we'll just show a confirmation alert

    alert('Message sent to ' + username);
    $('#messageModal').modal('hide'); // Hide the modal after sending the message
}
</script>

</body>
</html>