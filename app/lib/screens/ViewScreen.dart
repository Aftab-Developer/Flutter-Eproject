import 'package:app/screens/SearchScreen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Viewscreen extends StatefulWidget {
  const Viewscreen({super.key});

  @override
  State<Viewscreen> createState() => _ViewscreenState();
}

class _ViewscreenState extends State<Viewscreen> {
   int index = 0 ;
   
       final _listOfData = [
  {
    'image': 'assets/images/onBoarding1.png',
    'title': 'Welcome to Our App',
    'description': 'Discover amazing features, smart tools, and seamless navigation to get started with ease.',
    "color":Colors.blue
  },
  {
    'image': 'assets/images/onBoarding2.png',
    'title': 'Stay Connected',
    'description': 'Connect with friends and family effortlessly, share moments, and stay in touch anytime, anywhere.',
"color":Colors.green
  },
  {
    'image': 'assets/images/onBoarding3.png',
    'title': 'Explore More',
    'description': 'Find new interests, hobbies, and communities that match your passion and keep you inspired daily.',
"color":Colors.red
  },
]; 
double price = 56.0 ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SafeArea(
            child: Row( 
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 18.0,right: 20.0),
                child: Row(
                  children: [
                    ClipRRect( 
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset("assets/images/logo.png", width: 50, height: 50)
                      ), 
                     Row( 
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left:8.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("Shaplone", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                              Text("shop the best", style: TextStyle(fontSize: 12, color: Colors.grey)),
                            ],
                          ),
                        )
                      ],
                     )
                  ],
                ),
              ) ,
              Row(
                children: [
                  InkWell( 
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SearchScreen()));
                    }, 
                    
                    focusColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    child: Icon(Icons.search, size: 30,)),
                  Stack(
              children: [
                 Padding(
                padding: const EdgeInsets.only(right: 18.0),
                child: Icon(Icons.notifications, size: 30),
              ), 
              Positioned( 
                right: 12.0, 
                bottom:10.0,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),  
                  child:  Center(
                    child: Text(
                      '3',
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ),
                ),
              )
              ],
             )
                ],
              ),
             
            ],
                            ),
          ),  
        
         
          SizedBox(height: 26,),
         Expanded(
           child: SingleChildScrollView(
             child: Column(
              children: [
                 CarouselSlider( 
                
                items:_listOfData.map((item) {
                  return  Builder(builder: (context){
                  return Container(
                    width: 300,
                    height: 250,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Image.asset(item['image']!.toString(),fit: BoxFit.cover,),
                  );
                });
                }).toList() , 
                options: CarouselOptions(
                  autoPlay: true,
                  autoPlayInterval: Duration(milliseconds: 1500),
                  viewportFraction: 0.8 ,
                  onPageChanged: (val,_){
                    setState(() {
                      index = val ;
                    });
                  }
                  
                ),
               ) ,
              SizedBox(height: 26,) ,
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                   for(int i = 0 ; i < _listOfData.length ; i++)
                 Container(
                               margin: const EdgeInsets.symmetric(horizontal: 5.0),
                               width: 10.0,
                               height: 10.0,
                               decoration: BoxDecoration(
                                 color: i == index ? Colors.red: Colors.black,
                                 shape: BoxShape.circle,
                               ),
                             )
               
                     ],
                   ) ,
                   SizedBox(height: 26,) ,
               Row( 
                mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left:18.0),
                        child: Text("Featured",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:Colors.black,),),
                      ),  
                       Padding(
                         padding: const EdgeInsets.only(right:18.0),
                         child: Text("search more",style: TextStyle(fontSize: 12,color:Color.fromARGB(255, 108, 99, 255),),),
                       ), 
                    ],
                  ) , 
              SizedBox(height: 10,),
              Container( 
                width: double.infinity,
                height: 250,
                child:   ListView.builder(  
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                 itemBuilder: (context,i){
                return Container( 
                    margin: const EdgeInsets.all(15.0),
                    width: 200, 
                    
                   child: Column( 
                    mainAxisAlignment: MainAxisAlignment.start,
                     children: [ 
                    
                    Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 160, 
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20.0),
                              topLeft: Radius.circular(20.0)
                              ),
                           
                          ),
                          child: Image.asset("assets/images/laptop.png",fit: BoxFit.contain,) ,
                        ), 
                      Positioned( 
                        top: 0, 
                        right: 0,
                        child: Icon(Icons.favorite_outline ,color: Colors.pink,)
                        )
                      ],
                    ) , 
                  Column(
                    children: [
                        Align( 
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left:20.0),
                        child: Text("Laptop",style: TextStyle(color:Colors.black , fontSize: 20, ),
                        ),
                      ),
                    ) ,
                    Align(
                      alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left:20.0),
                      child: Text("$price .00",style: TextStyle(color:Colors.black,fontSize: 12,),),
                    ))
                    ],
                  ) ,
                   ],),
                  ) ; 
                   
                  
              }),
              ) ,
              SizedBox(height: 26,) ,
               Row( 
                mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left:18.0),
                        child: Text("Featured",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:Colors.black,),),
                      ),  
                       Padding(
                         padding: const EdgeInsets.only(right:18.0),
                         child: Text("search more",style: TextStyle(fontSize: 12,color:Color.fromARGB(255, 108, 99, 255),),),
                       ), 
                    ],
                  ) , 
                   SizedBox(height: 10,),
              Container( 
                width: double.infinity,
                height: 250,
                child:   ListView.builder(  
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                 itemBuilder: (context,i){
                return Container( 
                    margin: const EdgeInsets.all(15.0),
                    width: 200, 
                    
                   child: Column( 
                    mainAxisAlignment: MainAxisAlignment.start,
                     children: [ 
                    
                    Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 160, 
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20.0),
                              topLeft: Radius.circular(20.0)
                              ),
                           
                          ),
                          child: Image.asset("assets/images/laptop.png",fit: BoxFit.contain,) ,
                        ), 
                      Positioned( 
                        top: 0, 
                        right: 0,
                        child: Icon(Icons.favorite_outline ,color: Colors.pink,)
                        )
                      ],
                    ) , 
                  Column(
                    children: [
                        Align( 
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left:20.0),
                        child: Text("Laptop",style: TextStyle(color:Colors.black , fontSize: 20, ),
                        ),
                      ),
                    ) ,
                    Align(
                      alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left:20.0),
                      child: Text("$price .00",style: TextStyle(color:Colors.black,fontSize: 12,),),
                    ))
                    ],
                  ) ,
                   ],),
                  ) ; 
                   
                  
              }),
              ) ,
              ],
             ),
           ),
         )
        ],
      ),
    );
  }
}