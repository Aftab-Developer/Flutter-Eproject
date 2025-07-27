import 'package:app/cubit/reset_pass_auth_cubit.dart';
import 'package:app/screens/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Changepasswordscreen extends StatelessWidget {
  final String? email;

  Changepasswordscreen({required this.email, Key? key}) : super(key: key);

  final GlobalKey<FormState> _key = GlobalKey<FormState>(debugLabel: "forgot reset pass");
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Change Password"),
        centerTitle: true,
      ),
      body: BlocListener<ResetPassAuthCubit, CubitState>(
        listener: (context, state) {
          if (state is Success) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message ?? "Success", style: const TextStyle(fontSize: 16)),
                backgroundColor: Colors.lightGreen,
              ),
            );

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => Login()),
            );
          } else if (state is Failure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message ?? "Something went wrong", style: const TextStyle(fontSize: 16)),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 24.0),
            child: Form(
              key: _key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "Reset your password",
                    style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 14),
                  const Text(
                    "Enter a strong new password for your account.",
                    style: TextStyle(fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),

                  // Password Field
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    cursorColor: Colors.black,
                    validator: (password) {
                      if (password == null || password.isEmpty) {
                        return 'Password cannot be empty';
                      }
                      if (password.length < 8) {
                        return 'Password must be at least 8 characters';
                      }
                      if (!RegExp(r'[A-Z]').hasMatch(password)) {
                        return 'Must contain at least one uppercase letter';
                      }
                      if (!RegExp(r'[a-z]').hasMatch(password)) {
                        return 'Must contain at least one lowercase letter';
                      }
                      if (!RegExp(r'\d').hasMatch(password)) {
                        return 'Must contain at least one number';
                      }
                      if (!RegExp(r'[@$!%*?&]').hasMatch(password)) {
                        return 'Must contain at least one special character (@\$!%*?&)';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: "New Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  BlocBuilder<ResetPassAuthCubit, CubitState>(
                    builder: (context, state) {
                      final isLoading = state is Loading && state.loading == true;

                      return Container(
                        height: 60,
                        child: ElevatedButton( 
                          
                          onPressed: isLoading
                              ? null
                              : () {
                                  if (_key.currentState?.validate() == true) {
                                    context.read<ResetPassAuthCubit>().reset_password_handler(
                                          resetPassword: _passwordController.text.trim(),
                                          email: email,
                                        );
                                  }
                                },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black, 
                            
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 18),
                          ),
                          child: isLoading
                              ? const CircularProgressIndicator(color: Colors.white, strokeWidth: 2)
                              : const Text(
                                  "Reset",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    letterSpacing: 2,
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
      ),
    );
  }
}
