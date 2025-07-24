
import 'package:app/models/Api_model.dart';
import 'package:app/repository/Auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part '../action/auth_action.dart';
part '../state/auth_state.dart'; 
 
 class AuthBloc extends Bloc<AuthAction,AuthState>{ 
  final AuthRepo ? repo ;
  AuthBloc({
    required this.repo
  }):super(AuthInitial(message: "no login requests")) {
   on<AuthLoginRequest>(login_handler) ;  
   on<AuthSignUpRequest>(signup_handler) ;
   on<OtpRequest>(send_otp_handler) ;
  }
   Future<void> login_handler(AuthLoginRequest event , Emitter<AuthState> emit) async {
     try { 
      print("called");
        final email = event.email ;  
        final password = event.password;  
        if(email != null || password != null) { 

          emit(Loading(loading: true)) ; 

       final ApiModel? data =  await  repo?.login_repo_handler(email, password) ;   
       print("bloc data") ;
       print(data);
       emit(Loading(loading: false)) ;
       if(data?.success == true) {
       emit(AuthSuccess(message: data?.message, success: data?.success)) ;
       
       } else {
        emit(AuthFailure(message: data?.message, success: data?.success)) ;
       }
        }
     } catch (e) {
       print(e.toString()) ;
     }
   }
  
  Future<void> signup_handler(AuthSignUpRequest event , Emitter<AuthState> emit) async {
    try { 
      print("reached bloc") ;
      final String? username = event.username ;
      final String? email = event.email ;
      final String? password = event.password ; 
      emit(SignUpLoading(loading: true)) ;
    
    final ApiModel? apiRes =  await  repo?.signup_respo_handler(username, email, password); 
    if(apiRes?.success == true) {
      emit(SignUpLoading(loading: false)) ; 
      emit(SignUpAuthSuccess(message: apiRes?.message, success: apiRes?.success)) ;
    } else {
      emit(SignUpAuthFailure(message: apiRes?.message, success: apiRes?.success)) ;

    }
    } catch (e) {
      print(e.toString()) ;
    }
  }
  
  Future<void> send_otp_handler(OtpRequest event , Emitter<AuthState> emit) async {
    try { 
      final String? email = event.email ; 
      emit(OtpLoading(loading: true)) ;
    final ApiModel? model =  await repo?.send_otp_handler(email); 
      emit(OtpLoading(loading: false)) ;

   if(model?.success == true) {
     emit(OtpSuccessState(message: model?.message, success: model?.success)) ;

   } else {
     emit(OtpFailureState(message: model?.message, success: model?.success)) ;

   }
    } catch (e) {
      print(e.toString()) ;
    }
  }

  }
 


