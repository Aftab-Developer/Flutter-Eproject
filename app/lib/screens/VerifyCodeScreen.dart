import 'package:flutter/material.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({Key? key}) : super(key: key);

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());
  final List<TextEditingController> _controllers =
      List.generate(6, (_) => TextEditingController());

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focus in _focusNodes) {
      focus.dispose();
    }
    super.dispose();
  }

  String getOtp() {
    return _controllers.map((controller) => controller.text).join();
  }

  void _onOtpSubmit() {
    final otp = getOtp();
    print("Entered OTP: $otp");
    // call your verification logic here
  }

  Widget _buildOtpField(int index) {
    return SizedBox(
      width: 50,
      child: TextField(
        controller: _controllers[index],
        focusNode: _focusNodes[index],
        textAlign: TextAlign.center,
        maxLength: 1,
        keyboardType: TextInputType.number,
        style: TextStyle(fontSize: 24, fontFamily: "Poppins", color: Colors.black),
        decoration: InputDecoration(
          counterText: '',
          filled: true,
          fillColor: Colors.white, // Input field ka background white
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.black), // Border black
          ),
        ),
        onChanged: (value) {
          if (value.isNotEmpty && index < 5) {
            _focusNodes[index + 1].requestFocus();
          } else if (value.isEmpty && index > 0) {
            _focusNodes[index - 1].requestFocus();
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Body ka background white
      appBar: AppBar(
        title: Text(
          "Verify Code",
          style: TextStyle(
            fontFamily: "Poppins",
            color: Colors.black, // AppBar ka text color black
          ),
        ),
        backgroundColor: Colors.white, // AppBar background white
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black), // AppBar icons ka color black
        centerTitle: true,  // <-- Center the title here
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Text(
              "Enter the 6-digit code sent to your email",
              style: TextStyle(
                fontFamily: "Poppins",
                color: Colors.black, // Text color black
                fontSize: 20,    // Font size
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(6, (index) => _buildOtpField(index)),
            ),
            SizedBox(height: 40),
            SizedBox(
              width: double.infinity,  // Full width button
              child: ElevatedButton(
                onPressed: _onOtpSubmit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Button ka background color black
                  minimumSize: Size(double.infinity, 60), // Button height 60px
                ),
                  child: Text(
                    "Verify", 
                    
                    style: TextStyle(
                      letterSpacing: 1.5,
                      color: Colors.white, // Button text color white
                      fontFamily: "Poppins",
                      fontSize: 18, // Font size for button text
                      fontWeight: FontWeight.bold, // Bold text
                    ),
                  ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
