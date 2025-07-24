part of "../bloc/auth_bloc.dart"; 

sealed class AuthState {} 

final class AuthInitial extends AuthState { 
  final String? message ;
  AuthInitial(
     {
  required   this.message 
  }) ;
} 

final class Loading extends AuthState{ 
  final bool? loading  ;  
  Loading({
    required this.loading
  }) ;




}

final class AuthSuccess extends AuthState { 
  final String? message ;
  final bool? success ;
      AuthSuccess({
      required this.message , 
      required this.success
      }) ;
}

final class AuthFailure extends AuthState {
final String? message ;
  final bool? success ;
      AuthFailure({
      required this.message , 
      required this.success
      }) ;
}




final class SignUpLoading extends AuthState{ 
  final bool? loading  ;  
  SignUpLoading({
    required this.loading
  }) ;




}

final class SignUpAuthSuccess extends AuthState { 
  final String? message ;
  final bool? success ;
      SignUpAuthSuccess({
      required this.message , 
      required this.success
      }) ;
}

final class SignUpAuthFailure extends AuthState {
final String? message ;
  final bool? success ;
      SignUpAuthFailure({
      required this.message , 
      required this.success
      }) ;
} 


final class OtpSuccessState extends AuthState {
  final String? message ; 
  final bool? success ;  
  OtpSuccessState({
    required this.message  ,
    required this.success
  }) ;

} 



final class OtpFailureState extends AuthState {
  final String? message ; 
  final bool? success ;  
  OtpFailureState({
    required this.message  ,
    required this.success
  }) ;

}




final class OtpLoading extends AuthState{ 
  final bool? loading  ;  
  OtpLoading({
    required this.loading
  }) ;




}