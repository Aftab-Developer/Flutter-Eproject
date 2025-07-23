import "package:app/screens/ForgotPassword.dart";
import "package:app/screens/GuideScreen.dart";
import "package:app/screens/SignUp.dart";
import "package:flutter/material.dart" ; 

class Login extends StatelessWidget {

  final GlobalKey<FormState> key = GlobalKey() ; 
  final _google_image_uri="data:image/png;base64,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" ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: SingleChildScrollView(
       child: SafeArea(
         child: Column(
         children: [
             Container( 
              margin: EdgeInsets.only(left: 30.0 ,top: 80.0),
              child: Text("Wellcome back!,",style: TextStyle(
                fontSize: 40.0 ,
                fontWeight: FontWeight.bold
                ),)) ,
             Padding(
               padding: const EdgeInsets.only(left: 38.0),
               child: Text("Glad to see you, Again!",style: TextStyle(
                fontSize: 40.0 ,
                  fontWeight: FontWeight.bold
               ),),
             )  ,
            Form( 
              key: key,
              child: Column(
                children: [
                   Padding(
                padding: const EdgeInsets.only(top:30.0,left: 30.0,right: 30.0),
                child: Container(
                 width: MediaQuery.of(context).size.width  ,  
                 decoration: BoxDecoration(
                   color: const Color.fromARGB(255, 235, 234, 234)   ,
                   borderRadius: BorderRadius.circular(30.0)
                   
                 ),
                 child: TextFormField( 
                   cursorColor: Colors.black, 
                   validator: (value){
                      final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'); 
                      if(!emailRegex.hasMatch(value!)) {
                        return "Please enter a valid Email" ;
                      } else {
                        return null ;
                      }
                    
                   },
                   decoration: InputDecoration(
                     hintText: "Enter Email" ,
                     border: InputBorder.none , 
                     contentPadding: EdgeInsets.only(left: 20.0,bottom: 20.0,top: 20.0)
                   ),
                 ),
                ),), 
                SizedBox(height: 8,) ,
                            Padding(
               padding: const EdgeInsets.only(top:30.0,left: 30.0,right: 30.0),
                child: Container(
                 width: MediaQuery.of(context).size.width  ,  
                 decoration: BoxDecoration(
                   color: const Color.fromARGB(255, 235, 234, 234)  ,
                   borderRadius: BorderRadius.circular(30.0)
                   
                 ),
                 child: TextFormField(  
                   obscureText: true,
                    validator: (password){
                      final passwordRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'); 
                      if (password!.isEmpty) {
                              return 'Password cannot be empty';
                            }


                        if (password.length < 8) {
                          return 'Password must be at least 8 characters';
                        }

                        if (!RegExp(r'[A-Z]').hasMatch(password)) {
                          return 'Password must contain at least one uppercase letter';
                        }

                        if (!RegExp(r'[a-z]').hasMatch(password)) {
                          return 'Password must contain at least one lowercase letter';
                        }

                        if (!RegExp(r'\d').hasMatch(password)) {
                          return 'Password must contain at least one number';
                        }

                        if (!RegExp(r'[@$!%*?&]').hasMatch(password)) {
                          return 'Password must contain at least one special character (@\$!%*?&)';
                        }

                        return null;
                      }
                    
                   ,
                   cursorColor: Colors.black,
                   decoration: InputDecoration(
                     hintText: "Enter Password" ,
                     border: InputBorder.none , 
                     contentPadding: EdgeInsets.only(left: 20.0,bottom: 20.0,top: 20.0)
                   ),
                 ),
                ), 
                  ),  
                SizedBox(height: 8,) ,
              
              
                  Row( 
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                    SizedBox() ,
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0 , right: 30.0),
                      child: InkWell(
                        onTap: () => 
              Navigator.pushReplacement(
                context ,
                MaterialPageRoute(builder: (context) =>  ForgotPassword()) 
              ) 
                         , 
                         hoverColor: Colors.transparent, 
                         highlightColor: Colors.transparent , 
                         focusColor: Colors.transparent, 
                         splashColor: Colors.transparent,
                        child: Text("forgot password?",style: TextStyle(decoration: TextDecoration.underline  , backgroundColor: Colors.transparent),)),
                    )
                   ],
                  ) ,
                       Padding(
                padding: const EdgeInsets.only(left:30.0,right: 30.0,top: 30.0),
                child: InkWell(
                  highlightColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    splashColor: Colors.transparent, 
                    hoverColor: Colors.transparent,
                    onTap: () => { 
                      if(key.currentState!.validate()){
                    Navigator.push(
                        context ,
                        MaterialPageRoute(builder: (context) =>  GuideScreen()) 
                      )
                      } ,
                      },
                  child: Container(  
                   width: MediaQuery.of(context).size.width,
                   height: 65.0, 
                   decoration: BoxDecoration(
                   color: Colors.black,
                  borderRadius: BorderRadius.circular(30.0)
                   ),
                   child: Center(child: Text("Login",style: TextStyle(color: Colors.white,fontSize: 16.0),)),
                  ),
                ),
                            ) ,
               Padding(
                padding: const EdgeInsets.only(left:30.0,right: 30.0,top: 30.0),
                child: InkWell(
                 
                  child: Container( 
                   width: MediaQuery.of(context).size.width,
                   height: 65.0, 
                   decoration: BoxDecoration(
                   color: Colors.white,
                  
                        border:Border.all(color: Colors.grey , width: .7),
                       
                  borderRadius: BorderRadius.circular(30.0)
                   ),
                   child: Center(
                    child: Row( 
                     mainAxisAlignment: MainAxisAlignment.center,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [ 
                       Container(
                       width: 40.0,
                       height: 40.0,                      
                       child: ClipRRect(
                         borderRadius: BorderRadius.circular(50.0),
                         child:  Image.network(_google_image_uri,),
                       ),
                       ) ,
                       Padding(
                         padding: const EdgeInsets.only(left: 17.0),
                         child: Text("Google Sign In",style: TextStyle(color: Colors.black,fontSize: 16.0),),
                       ),
                     ],
                   )),
                  ),
                ),
                            ) ,
                          Padding(
                            padding: const EdgeInsets.only(top:18.0),
                            child: InkWell(
                              onTap: () => 
                                Navigator.push(
                                  context ,
                                  MaterialPageRoute(builder: (context) => SignUp()) 
                                ) 
                               , 
                               hoverColor: Colors.transparent, 
                               highlightColor: Colors.transparent , 
                               focusColor: Colors.transparent, 
                               splashColor: Colors.transparent,
                              child: Text("Don't have an account?",style: TextStyle(fontSize: 16.0),)),
                          ),
                       
                ],
              ),
            )
         ],
         ),
       ),
     )
    ) ;
  }
}
