import 'package:app/bloc/auth_bloc.dart';
import 'package:app/screens/VerifyCodeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final GlobalKey<FormState> _key = GlobalKey(debugLabel: "forgot pass"); 
  final TextEditingController _emailController = TextEditingController() ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color.fromRGBO(255, 255, 255, 1),
          size: 25.0,
        ),
        backgroundColor: Color.fromARGB(255, 108, 99, 255),
        title: const Text(
          'Forgot Password',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.5,

              child: Image.asset(
                "assets/images/email.png",
                fit: BoxFit.contain,
              ),
            ),
            const Text(
              'Mail Adress Here ',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 108, 99, 255),
              ),
            ),
            const Text('Enter the email address associated '),
            const Text('with your account.'),

            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Form(
                key: _key,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: TextFormField(
                    validator: (value) {
                      final emailRegex = RegExp(
                        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                      );
                      if (!emailRegex.hasMatch(value!)) {
                        return "Please enter a valid Email";
                      } else {
                        return null;
                      }
                    },
                    cursorColor: const Color.fromARGB(255, 108, 99, 255),  
                    controller: _emailController,
                    decoration: InputDecoration(
                    
                      
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 108, 99, 255),
                          width: 1.0,
                        ),
                      ),
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 108, 99, 255),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: InkWell(
                  highlightColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    if (_key.currentState!.validate()) {
                      BlocProvider.of<AuthBloc>(context).add(OtpRequest(email: _emailController.text.toString())) ;
                    }
                  },
                  child: BlocConsumer<AuthBloc, AuthState>(
                    listener: (_, state) {
                      if(state is OtpSuccessState) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar( 
                                    backgroundColor: Colors.lightGreen,
                                    content:
                                     Center(
                                      child:
                                       Text("${state.message}",style: TextStyle(color: Colors.white,fontSize: 18),)
                                       ),
                                       ) ,
                                        
                                ) ; 

                                Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => OtpVerificationScreen()),
                            );


                               } 
                               if(state is OtpFailureState) {
                                 ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar( 
                                    backgroundColor: Colors.red,
                                    content:
                                     Center(
                                      child:
                                       Text("${state.message}",style: TextStyle(color: Colors.white,fontSize: 18),)
                                       ),
                                       ) ,
                                       
                                ) ;
                               }
                    },
                    builder: (_, state) {
                      return state is OtpLoading && state.loading == true ?  Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: CircularProgressIndicator(strokeWidth: 1,color: Colors.white,)
                          ),
                         
                        ],
                      ) :Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Icon(
                              Icons.send,
                              color: Colors.white,
                              size: 20.0,
                            ),
                          ),
                          Text(
                            "Send Email",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      );
                    },
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
