
import 'package:dio/dio.dart';
import 'package:darlemploi/Services/api_client.dart';
import 'package:darlemploi/config/app_url.dart';



class ApiService {
  final APIClient apiClient = APIClient();
  Future<Response> login({var params}) {
    return apiClient.post(url: "", params: params);
  }
  Future<Response> registerUser({required Map<String , dynamic> params}) {
    return apiClient.post(url: "", params: params);
  }
  Future<Response> getAllJobs({required Map<String , dynamic> params}) {
    return apiClient.post(url: "", params: params);
  }  Future<Response> createJob({required Map<String , dynamic> params}) {
    return apiClient.post(url: "", params: params);
  }
}
