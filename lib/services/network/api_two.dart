import 'package:blocexample/services/model/second_model.dart';
import 'package:dio/dio.dart';
import 'package:blocexample/services/model/first_model.dart';

class ApiServiceTwo {
  final Dio _dio = Dio();

  Future<SecondModel> fetchData() async {
    try {
      final response = await _dio.get(
          'https://easyenglishuzb.free.mockoapp.net/companies'); 

      if (response.statusCode == 200) {
        SecondModel secondModel = SecondModel.fromJson(response.data);
        return secondModel;
      } else {
        throw Exception('Request failed with status: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception(error.toString());
      
    }
  }
}
