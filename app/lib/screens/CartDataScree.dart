import 'package:flutter/material.dart';

class Cartdatascree extends StatefulWidget {
  const Cartdatascree({super.key});

  @override
  State<Cartdatascree> createState() => _CartdatascreeState();
}

class _CartdatascreeState extends State<Cartdatascree> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column( 
          mainAxisSize: MainAxisSize.min,
          children: [
             Container( 
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: const Color.fromARGB(255, 224, 220, 220) ,
                    width: .6
                  )
                )
              ),
               child: Padding(
                 padding: const EdgeInsets.only(bottom: 15.0),
                 child: Row(
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
                             ),
               ),
             ) , 
             Expanded(
              flex: 2,
              child:ListView.builder(
                itemCount: 30, 
                itemBuilder: (context,i){
                return ListTile(
                  leading: Container( 
                    width: 100,
                    height: 100,

                    child: 
                    Center(
                      child: Image.asset(
                      "assets/images/laptop.png" , 
                      fit: BoxFit.cover,
                                        ),
                    ),
                  ) ,
                  title:Text("Apple Macbook Pro M1"),
                  subtitle: Column(
                    children: [
                      Align( 
                        alignment: Alignment.topLeft,
                         child: Text("some demo desc....")) ,
                      Row(children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 70.0),
                          child: Text("\$90.00"),
                        ) ,
                        Row(
                          
                          children: [ 
                          
                          Container( 
                            
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.black ,
                              shape: BoxShape.circle ,
                              
                            ), 
                            child: Center(child: Text("+",
                            style: TextStyle(color: Colors.white),
                            )),
                          ) , 
                          Padding(
                            padding: const EdgeInsets.only(left:8.0,right:8.0),
                            child: Text("4",style: TextStyle(
                              fontSize: 23 ,
                              fontWeight: FontWeight.bold
                            ),),
                          ) ,
                           Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.black ,
                              shape: BoxShape.circle ,
                              
                            ), 
                            child: Center(child: Text("-",
                            style: TextStyle(color: Colors.white),
                            )),
                          )
                        ],)
                      ],)
                    ],
                  ),
                );
              })
              
               )  ,
               Expanded(
                child: Container( 
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                       color: const Color.fromARGB(255, 224, 220, 220) ,
                       width: .6
                      )
                    )
                  ),
                  child: Column( 
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [ 
                      Text("Details" , style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                      Padding(
                        padding: const EdgeInsets.only(left:12.0,right: 12.0),
                        child: Row( 
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                           Text("Shipping fee") ,
                           Text("\$6.99") ,
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:12.0,right: 12.0),
                        child: Row( 
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                           Text("Sub total") ,
                           Text("\$6.99") ,
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:12.0,right: 12.0,top: 12.0),
                        child: Container( 
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                color: const Color.fromARGB(255, 224, 220, 220) ,
                                 width: .6 
                              )
                            )
                          ),
                          child: Row(  
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                             Padding(
                               padding: const EdgeInsets.only(top:8.0),
                               child: Text("Total",style: TextStyle(fontWeight: FontWeight.bold , fontSize: 18),),
                             ) ,
                             Padding(
                               padding: const EdgeInsets.only(top:8.0),
                               child: Text("\$6.99",style: TextStyle(fontWeight: FontWeight.bold , fontSize: 18),),
                             ) ,
                            ],
                          ),
                        ),
                      ), 
                       Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(  
                margin: EdgeInsets.only(top: 20),
                width: MediaQuery.of(context).size.width,
                height: 55, 
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20) ,
                  color: Colors.black
                ),
                child: Center(
                  child: Text("Checkout",style: TextStyle(
                    color: Colors.white ,
              
                  ),),
                ),
              ),
            )
                    ],
                  ),
                )
                )
          ],
        ), 
         );
  }
}