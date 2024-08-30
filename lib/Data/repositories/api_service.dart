
import 'package:dio/dio.dart';
import 'package:darlemploi/Services/api_client.dart';
import 'package:darlemploi/config/app_url.dart';



class ApiService {
  final APIClient apiClient = APIClient();
  Future<Response> login({var params}) {
    return apiClient.post(url: AppUrl.loginUser, params: params);
  }
  Future<Response> registerUser({required Map<String , dynamic> params}) {
    return apiClient.post(url: AppUrl.registerUser, params: params);
  }
}
