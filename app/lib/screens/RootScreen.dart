import 'package:app/screens/CartScreen.dart';
import 'package:app/screens/LoginScreen.dart';
import 'package:app/screens/SearchScreen.dart';
import 'package:app/screens/ViewScreen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Rootscreen extends StatefulWidget {
  const Rootscreen({super.key});

  @override
  State<Rootscreen> createState() => _RootscreenState();
}

class _RootscreenState extends State<Rootscreen> { 
  final  List<Widget> myWid = [
    Viewscreen() ,
    Cartscreen()
   ] ; 
   int _screen = 0  ; 

 
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
     
      bottomNavigationBar: BottomNavigationBar( 
        type: BottomNavigationBarType.fixed,  
        elevation: 2.3, 
        unselectedIconTheme: IconThemeData(color: Colors.black ,
        size: 20
        
        ) ,
        currentIndex: _screen
        
        , 
        unselectedLabelStyle: TextStyle(color: Colors.black,  
        fontSize: 12 
        ) ,
        selectedItemColor: Colors.black ,
        

      
        
        onTap: (value) {  
          
          setState(() {
            _screen = value ; 
          });
    
        }, 

        items: [ 
          
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile'),
          

        ],
      ), 
      body: myWid[_screen]
    ) ;

  }
}