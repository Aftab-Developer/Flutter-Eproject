import 'dart:convert';

class ApiModel { 
  final String? message ; 
  final bool? success ;

  ApiModel({
  required this.message ,
   required this.success
  }) ; 
 
 factory ApiModel.fromMap(String json) {
      final map = jsonDecode(json);  
      return ApiModel(message: map["message"], success: map["success"]);

 } 



}