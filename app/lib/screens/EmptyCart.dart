import 'package:flutter/material.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:Column(   
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children:[
            Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.arrow_back) ,
                Text("Shopping Cart",style: TextStyle(
                  fontSize: 20 ,
                  fontWeight: FontWeight.bold

                ),)  ,
                Container(
                  margin: EdgeInsets.only(left: 14),
                  width: 40,
                  height: 40, 
                  decoration: BoxDecoration(
                  color: Colors.grey[200], 
                  shape: BoxShape.circle

                  ),                  
                  child: Center(
                    child: Icon(Icons.person_sharp)
                    )
                  )
              ],
            ) , 
            Container(  
              margin: EdgeInsets.only(top:1,bottom:18),
              width: MediaQuery.of(context).size.width,
              height: 420 ,
              child: Image.asset(
                "assets/images/empty_cart_final.png" ,
                fit: BoxFit.cover,  
                
                
                ),
            ) , 
            Padding(
              padding: const EdgeInsets.only(top:12.0),
              child: Text("Your shopping cart is empty !!!" ,
              style: TextStyle(
                color: Colors.grey[300] ,
                fontSize:15
              ),
              
              ),
            ) ,
            Padding(
              padding: const EdgeInsets.only(top:12.0),
              child: Text("Fortunately there's an easy solution." ,
              style: TextStyle(
                fontWeight: FontWeight.bold ,
                color: Colors.black ,
                fontSize: 18
              
              ),
              ),
            )  ,
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(  
                margin: EdgeInsets.only(top: 20),
                width: MediaQuery.of(context).size.width,
                height: 55, 
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20) ,
                  color: Colors.black
                ),
                child: Center(
                  child: Text("Go Shopping",style: TextStyle(
                    color: Colors.white ,
              
                  ),),
                ),
              ),
            )
          ]
        )
      ),
    );
  }
}