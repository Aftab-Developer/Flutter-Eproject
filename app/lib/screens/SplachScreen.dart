
import 'package:app/screens/LoginScreen.dart';
import 'package:flutter/material.dart'; 
import 'dart:async';

class SplachScreen extends StatefulWidget {
  const SplachScreen({super.key});

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> { 
  @override 
  void initState() {
    super.initState(); 
   switchScreen() ;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
       color: Colors.white, 
       child: Column( 
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(  
            
            width: 250,
            height: 250,
            child:  ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child:  Image.asset("assets/images/logo.png" ,
              fit: BoxFit.contain,
              ),
            ),
          ) ,
          
        ],
       ), 
       
      ),
    ); 
  } 
  switchScreen() async{
 await Future.delayed(Duration(milliseconds: 2000),() => Navigator.pushReplacement(
      context ,
      MaterialPageRoute(builder: (context) => Login())
    )) ;
  }
}