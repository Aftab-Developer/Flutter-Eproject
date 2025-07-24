import 'dart:convert';

import 'package:app/models/Api_model.dart';
import 'package:dio/dio.dart';

class AuthData {
   final _dio = Dio() ;
  Future<dynamic> login_response_handler(Map<String,dynamic>? data) async {  
    print("called data provider");
    
   final res =  await _dio.post("http://localhost:3000/api/v1/auth/login",data: data) ; 
  print(res.data);
     final dataJson = jsonEncode(res.data); 
     print(dataJson); 
     return dataJson ;
  } 


  Future<dynamic> signup_response_handler(Map<String,dynamic> data) async { 
    print("reached data provider sign up") ;
   final res =  await _dio.post("http://localhost:3000/api/v1/auth/sign-up",data:data );   
   print(res.data) ;
   final json = jsonEncode(res.data) ;   
   print(json);

   return json ;
    
  }

  Future<dynamic> send_otp_handler(Map<String,dynamic> map) async{
   final res = await _dio.post("http://localhost:3000/appi/auth/send-mail",data: map); 
   final json = jsonEncode(res.data()) ; 
   return json ;

  }
  

}