const mailTemOtp = ({username = "Aftab", otpCode = 90789 }) => `
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>OTP Verification</title>
  <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
  <style>
    body {
      margin: 0;
      padding: 0;
      background-color: #111111;
      font-family: 'Poppins', sans-serif;
      color: #ffffff;
    }

    .container {
      max-width: 500px;
      margin: 40px auto;
      background-color: #1c1c1c;
      padding: 30px;
      border-radius: 12px;
      box-shadow: 0 0 10px rgba(255, 255, 255, 0.05);
    }

    h2 {
      text-align: center;
      color: #ffffff;
    }

    p {
      font-size: 16px;
      color: #dddddd;
    }

    .otp-box {
      margin: 25px auto;
      padding: 15px;
      font-size: 28px;
      text-align: center;
      background-color: #222222;
      color: #00ffcc;
      border: 2px dashed #00ffcc;
      border-radius: 8px;
      letter-spacing: 6px;
      width: fit-content;
    }

    .footer {
      font-size: 12px;
      color: #888888;
      margin-top: 30px;
      text-align: center;
    }
  </style>
</head>
<body>
  <div class="container">
    <h2>OTP Verification</h2>
    <p>Hello, ${username}</p>
    <p>Your OTP code is below. Please use it to complete your verification. This code is valid for the next 10 minutes.</p>

    <!-- 🔽 Replace the OTP below dynamically -->
    <div class="otp-box">${otpCode}</div>

    <p>If you didn’t request this, you can safely ignore this email.</p>

    <div class="footer">
      &copy; 2025 Shaplon. All rights reserved.
    </div>
  </div>
</body>
</html>

` ; 

module.exports = mailTemOtp ;