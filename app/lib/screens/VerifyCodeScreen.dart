import "package:app/cubit/otp_verify_auth_cubit.dart";
import "package:app/models/Api_model.dart";
import "package:app/screens/ChangePasswordScreen.dart";
import "package:flutter/material.dart" ;
import "package:flutter_bloc/flutter_bloc.dart";

class OtpVerificationScreen extends StatelessWidget {
  final String? email;
  OtpVerificationScreen({Key? key, required this.email}) : super(key: key);

  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());
  final List<TextEditingController> _controllers = List.generate(6, (_) => TextEditingController());

  String getOtp() {
    return _controllers.map((controller) => controller.text).join();
  }

  void _onOtpSubmit(BuildContext context) async {
    final otp = getOtp();
    if (otp.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please enter 6-digit OTP"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    final cubit = context.read<OtpVerifyAuthCubit>();
    final map = {"otp": int.parse(otp)};
    await cubit.verify_otp_handler(email: email, map: map);
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
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.black),
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
    return BlocListener<OtpVerifyAuthCubit, ApiModel>(
      listener: (context, state) {
        if (state.success == true) {
          ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Center(child: Text("${state.message}",style: TextStyle(fontSize: 18),)),
                                      backgroundColor: Colors.lightGreen,
                                    ),) ;
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => Changepasswordscreen(email:email)));
        } else if (state.success == false && state.message != "loading") {
          ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Center(child: Text("${state.message}",style: TextStyle(fontSize: 18),)),
                                      backgroundColor: Colors.red,
                                    ) ) ;
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Verify Code", style: TextStyle(fontFamily: "Poppins", color: Colors.black)),
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Enter the 6-digit code sent to your email",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    color: Colors.black,
                    fontSize: 20,
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
                BlocBuilder<OtpVerifyAuthCubit, ApiModel>(
                  builder: (context, state) {
                    final isLoading = state.loading ?? false;
                    return SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: isLoading ? null : () => _onOtpSubmit(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          minimumSize: Size(double.infinity, 60),
                        ),
                        child: isLoading
                            ? SizedBox(
                                width: 24,
                                height: 24,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.white,
                                ),
                              )
                            : Text(
                                "Verify",
                                style: TextStyle(
                                  letterSpacing: 1.5,
                                  color: Colors.white,
                                  fontFamily: "Poppins",
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
