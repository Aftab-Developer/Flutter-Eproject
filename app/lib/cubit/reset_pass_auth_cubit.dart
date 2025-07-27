import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

sealed class CubitState {

} 

final class Loading extends CubitState { 
  final bool? loading ;
Loading({
 required this.loading
}) ;
}

final class Initial extends CubitState { 
 
}
 
final class Success extends CubitState { 
  final String? message ;
  final bool? success ;
  Success({
    required this.message ,
    required this.success ,
  }) ;
}

final class Failure extends CubitState { 
  final String? message ;
  final bool? success ;
  Failure({
    required this.message ,
    required this.success ,
  }) ;
}



class ResetPassAuthCubit extends Cubit<CubitState>{
ResetPassAuthCubit():super(Initial()) ; 
final _dio = Dio() ;
Future<CubitState?> reset_password_handler({required String? resetPassword , required String? email}) async{
  emit(Loading(loading: true)) ;
  final res = await _dio.post("http://localhost:3000/api/v1/auth/reset-pass/$email",data:{"resetPassword":resetPassword},options: Options(
    validateStatus: (_) => true 
  )) ;  
  emit(Loading(loading: false)) ;
  if(res.data['success'] == true) {
    emit(Success(message: res.data['message'], success: res.data['success']));
  } else if(res.data['success'] == false) {
       emit(Success(message: res.data['message'], success: res.data['success']));

    
  }
  
}
}