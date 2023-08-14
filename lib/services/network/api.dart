import 'package:dio/dio.dart';
import 'package:blocexample/services/model/first_model.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<FirstModel> fetchData() async {
    try {
      final response = await _dio.get(
          'https://easyenglishuzb.free.mockoapp.net/countries'); // Replace with your API endpoint

      if (response.statusCode == 200) {
        FirstModel firstModel = FirstModel.fromJson(response.data);
        return firstModel;
      } else {
        throw Exception('Request failed with status: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception(error.toString());
      print('Error: $error');
    }
  }
}
