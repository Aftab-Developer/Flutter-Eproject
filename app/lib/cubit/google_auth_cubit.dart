

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

sealed class GoogleCubitState{}  

final class GoogleInitial extends GoogleCubitState{} 
final class GoogleAuthAuccess extends GoogleCubitState{ 
  final String? message ;
  final bool? success ; 
  GoogleAuthAuccess({
   required this.message ,
   required this.success
  }) ;
} 
final class GoogleAuthFailure extends GoogleCubitState{
final String? message ;
  final bool? success ; 
  GoogleAuthFailure({
   required this.message ,
   required this.success
  }) ;

} 
final class GoogleLoading extends GoogleCubitState{
  final bool? loading ;
  GoogleLoading({
    required this.loading
  }) ;
} 




class GoogleAuth extends Cubit<GoogleCubitState> {
GoogleAuth():super(GoogleInitial()) ;  

Future<void> google_sign_in_handler({Map<String,dynamic>? map}) async {
  try {
     print("Handling sign in with map: $map");
    final _dio = Dio() ;  
    emit(GoogleLoading(loading:true)) ;
    final res = await _dio.post("http://localhost:3000/api/v1/auth/google-sign-in",data:map,options: Options(
      validateStatus: (_) => true 
    )) ; 
    emit(GoogleLoading(loading:false)) ; 
    print("${res.data}") ;
   if(res.data['success'] == true){
    emit(GoogleAuthAuccess(message: res.data['message'], success: res.data['success'])) ;
   }else{
    emit(GoogleAuthAuccess(message: res.data['message'], success: res.data['success'])) ;
   }
  } catch (e) {
    print(e.toString()) ;
  }
}

}