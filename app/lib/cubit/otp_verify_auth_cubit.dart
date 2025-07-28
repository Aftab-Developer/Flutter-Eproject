import 'package:app/models/Api_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtpVerifyAuthCubit extends Cubit<ApiModel>{  
  OtpVerifyAuthCubit():super(ApiModel(message: "initalized", success: false)) ; 
  final _dio = Dio() ; 
  Future<ApiModel?> verify_otp_handler({String? email , Map<String,int>? map}) async { 
  emit(ApiModel(message: "loading", success: false, loading: true));

  final res = await _dio.post(
    "http://localhost:3000/api/v1/auth/check-otp/$email",
    data: map,
    options: Options(validateStatus: (status) => true),
  );

print(res.data); 
print("commit") ;
  final success = res.data?["success"] == true;
  final message = res.data?["message"];

  emit(ApiModel(message: message, success: success, loading: false));
}


}