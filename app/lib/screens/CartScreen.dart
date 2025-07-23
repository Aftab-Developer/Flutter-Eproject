import 'package:app/screens/CartDataScree.dart';
import 'package:app/screens/EmptyCart.dart';
import 'package:flutter/material.dart';

class Cartscreen extends StatefulWidget {
  const Cartscreen({super.key});

  @override
  State<Cartscreen> createState() => _CartscreenState();
}

class _CartscreenState extends State<Cartscreen> {
  @override
  Widget build(BuildContext context) {  
    final bool isCartEmpty = false ;
    return Scaffold( 
      backgroundColor: Colors.white,
      
      body: isCartEmpty ? EmptyCart() : Cartdatascree()
    );
  }
}