
import 'package:activities/services/boredService.dart';
import 'package:dio/dio.dart';


class BoredService {
  final Dio _dio = Dio();
  final String _url = 'https://www.boredapi.com/api/activity';
  
  Future<BoredActivity> getBoredActivity() async {
    try {
      final response = await _dio.get(_url);
      return BoredActivity.fromJson(response.data);
    } catch (_) {
      print(_.toString());
      throw Exception();
    }
    
  }
}