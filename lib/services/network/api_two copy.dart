import 'package:blocexample/services/model/second_model.dart';
import 'package:blocexample/services/model/third_model.dart';
import 'package:dio/dio.dart';
import 'package:blocexample/services/model/first_model.dart';

class ApiServicethree {
  final Dio _dio = Dio();

  Future<ThirdModel> fetchData(int id) async {
    try {
      final response = await _dio.get(
          'https://easyenglishuzb.free.mockoapp.net/companies/$id'); 

      if (response.statusCode == 200) {
        ThirdModel secondModel = ThirdModel.fromJson(response.data);
        return secondModel;
      } else {
        throw Exception('Request failed with status: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception(error.toString());
      
    }
  }
}
