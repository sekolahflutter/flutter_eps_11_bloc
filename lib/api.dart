import 'package:dio/dio.dart';
import 'package:sharing_bloc_1/model.dart';

class ApiService {
  static Future<List<UserModel>> getUsers() async {
    try {
      final response = await Dio().get('https://reqres.in/api/users');
      return (response.data['data'] as List)
          .map((e) => UserModel.fromJson(e))
          .toList();
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<UserModel> getDetailUser(int id) async {
    try {
      final response = await Dio().get('https://reqres.in/api/users/$id');
      return UserModel.fromJson(response.data['data']);
    } catch (e) {
      throw Exception(e);
    }
  }
}
