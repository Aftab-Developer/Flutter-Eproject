
import 'package:app/screens/RootScreen.dart';
import 'package:flutter/material.dart';

    class GuideScreen extends StatefulWidget {
      const GuideScreen({super.key});

      @override
      _GuideScreenState createState() => _GuideScreenState();
    }

    class _GuideScreenState extends State<GuideScreen> {
      final PageController _pageController = PageController();
     final _listOfData = [
  {
    'image': 'assets/images/onBoarding1.png',
    'title': 'Welcome to Our App',
    'description': 'Discover amazing features, smart tools, and seamless navigation to get started with ease.',
  },
  {
    'image': 'assets/images/onBoarding2.png',
    'title': 'Stay Connected',
    'description': 'Connect with friends and family effortlessly, share moments, and stay in touch anytime, anywhere.',
  },
  {
    'image': 'assets/images/onBoarding3.png',
    'title': 'Explore More',
    'description': 'Find new interests, hobbies, and communities that match your passion and keep you inspired daily.',
  },
];

      @override
      void dispose() {
        super.dispose();
        _pageController.dispose();
      }

      @override
      Widget build(BuildContext context) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              const SizedBox(height: 120),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 30.0),
                  child: InkWell(  
                    hoverColor: Colors.transparent, 
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    
                    onTap: (){
                      Navigator
                      .pushReplacement(
                      context ,
                      MaterialPageRoute(builder: (context ) => Rootscreen()
                      )) ;
                    },
                    child: Text(
                      'Skip',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container( 
                width: double.infinity , 
                height: 600,
                child: 
                  PageView.builder( 
                    controller: _pageController,
                    itemCount: _listOfData.length,  
                  
                  itemBuilder: (context, index) {
                   return Column( 
                     crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                     Container(
                        width: double.infinity, 
                        height: 300, 
                        // color: Colors.deepPurple,
                       child: Image.asset(
                         _listOfData[index]['image']!, 
                         width: double.infinity,
                         height: double.infinity,
                         fit: BoxFit.contain,
                       ),
                        
                      ), 
                      Text(_listOfData[index]['title']!,style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 108, 99, 255)),) ,
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Text(_listOfData[index]['description']!,style: TextStyle(fontSize: 18.0),textAlign: TextAlign.center),
                      ), 
                      const SizedBox(height: 20),
                      index == 2 ? Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: InkWell( 
                          onTap:(){
                             Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => Rootscreen() ));
                          }, 
                          focusColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          child: Container(
                            width: double.infinity,
                            height: 60, 
                            decoration: BoxDecoration(
                            color: Color.fromARGB(255, 108, 99, 255),
                            borderRadius: BorderRadius.circular(30.0)
                            ), child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                
                                  Text("Continue", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20,letterSpacing: 1)),
                               
                                
                              ],
                            )
                             
                          ),
                        ),
                      ): Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (int i = 0; i < _listOfData.length; i++)
                             Container(
                              margin: const EdgeInsets.symmetric(horizontal: 5.0),
                              width: 10.0,
                              height: 10.0,
                              decoration: BoxDecoration(
                                color: i == index ? Color.fromARGB(255, 108, 99, 255): Colors.black,
                                shape: BoxShape.circle,
                              ),
                            ),
                        ]
                          
                      )
                   ],
                 );
                  })
                ,
              ) ,
              
            ],
          ),
        );
      }
    }
