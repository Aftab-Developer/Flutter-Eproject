part of "../bloc/auth_bloc.dart" ;

sealed class AuthAction {} 

final class AuthLoginRequest extends AuthAction{ 
  final String? email ;
  final String? password ;

      AuthLoginRequest({
      this.email , 
      this.password
      }) ;
}


final class AuthSignUpRequest extends AuthAction{ 
  final String? email ;
  final String? username ;
  final String? password ;

      AuthSignUpRequest({
      this.email , 
      this.username , 
      this.password
      }) ;
} 

final class OtpRequest extends AuthAction { 
  final String?  email ;
  OtpRequest({
    required this.email
  }) ;
}




