import 'dart:convert';

import 'package:app/data_provider/Auth_data.dart';
import 'package:app/models/Api_model.dart';

class AuthRepo { 
  final AuthData? authData ;
  AuthRepo(
    {
   this.authData 
  });  

  Future<ApiModel?> login_repo_handler(String? email , String? password) async{
    print("called repo") ;
   final map = { 
    "email":email ,
    "password":password
   } ; 
  
   final json =  await authData!.login_response_handler(map) ;     

   print(json); 

   
   
   final ApiModel model = ApiModel.fromMap(json) ; 
   print(model.message) ;
   return model ;
   
   
  }
  
  Future<ApiModel?> signup_respo_handler(String? username , String? email , String? password) async{ 
    try {  
      print("signup repo reached");
      final Map<String,dynamic> map = {
        "username" : username , 
        "email" : email ,
        "password":password
      } ;  
      final json = await authData!.signup_response_handler(map) ;
     print(json);
      final ApiModel resModel =  ApiModel.fromMap(json);   
    print(ApiModel) ;
       return resModel ;
    } catch (e) {
      print(e.toString()) ;
    }

  }
   
   Future<ApiModel?> send_otp_handler (String? email) async{
      try{  
        print("otp repo");
        final map = {
          "email":email
        } ;
       final json =  await authData!.send_otp_handler(map); 
        print("otp repo $json");

       ApiModel model = ApiModel.fromMap(json); 
       return model ;
      }catch(e) {
        print(e.toString());
      }
        }
} 