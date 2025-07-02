import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(  
        iconTheme: const IconThemeData(
          color: Color.fromRGBO(255, 255, 255, 1),  
          size: 25.0
        ),
        backgroundColor: Color.fromARGB(255, 108, 99, 255),
        title: const Text('Forgot Password',
        style: TextStyle(
          fontSize: 20.0 ,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ) ,
        
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView( 
        padding: const EdgeInsets.all(0.0),
        child: Column( 
          children: <Widget>[ 
             Container(
              width: MediaQuery.of(context).size.width  ,
              height: MediaQuery.of(context).size.height / 2.5,
              
              child:Image.asset("assets/images/email.png",
                fit: BoxFit.contain,
              ),
                           ),
            const Text(
              'Mail Adress Here ', 
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Color.fromARGB(255, 108, 99, 255)),
            ),
            const Text(
              'Enter the email address associated ', 
             
            ),
            const Text(
              'with your account.', 
              ),
            
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 16.0,right: 16.0),
              child: Container( 
                width: MediaQuery.of(context).size.width ,
                child: TextFormField( 
                  cursorColor: const Color.fromARGB(255, 108, 99, 255),
                  decoration: InputDecoration( 
                    prefix: Padding(
                      padding: const EdgeInsets.only( right: 13.0),
                      child: const Icon(Icons.email_outlined),
                    ), 
                    prefixIconColor: Color.fromARGB(255, 108, 99, 255),  
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
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.only(left: 16.0,right: 16.0),
              child: Container(
                width: MediaQuery.of(context).size.width  , 
                height: 50, 
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 108, 99, 255),
                  borderRadius: BorderRadius.circular(30.0),
                ), 
                child: Row( 
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [ 
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Icon(
                        Icons.send , 
                        color: Colors.white, 
                        size: 20.0,
                      ),
                    ) ,
                    Text("Send Email",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}