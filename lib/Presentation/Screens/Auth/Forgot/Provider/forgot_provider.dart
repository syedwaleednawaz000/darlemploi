import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import '../../../../../Data/repositories/api_service.dart';

class ForgotProvider extends ChangeNotifier{
  final ApiService _apiService = ApiService();
  Future<void> forgotPassword({required Map<String , dynamic> params})async{
    try{
      Response response = await _apiService.registerUser(params: params);
      if(response.statusCode == 200){
        print(" response in else ${response.data}");
      }else{
        print(" response in else ${response.data}");
      }

    }catch(error){
      print("this is error ${error.toString()}");
    }
  }

}