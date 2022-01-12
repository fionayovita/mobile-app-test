import 'dart:convert';

import 'package:suitmedia/model/email_model.dart';
import 'package:http/http.dart' as http;
import 'package:suitmedia/ui/third_screen.dart';

class ApiService {
  static final String _baseUrl = 'https://reqres.in/';
  static final String _api = 'api/';
  static final String _users = 'users';
  static final String _page = 'page=';
  static final String _amp = 'amp;';
  static final String _per_page = 'per_page=';

  Future<UserResult> listUser() async {
    final response = await http.get(Uri.parse(_baseUrl +
        _api +
        _users +
        '?' +
        _page +
        '${ThirdScreen().currentPage}' +
        _amp +
        _per_page +
        '20'));
    if (response.statusCode == 200) {
      ThirdScreen().currentPage++;
      // ThirdScreen().totalPages = response.;

      return UserResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load top headlines');
    }
  }

  Future<UserResult> nextPage() async {
    final response = await http.get(Uri.parse(_baseUrl +
        _api +
        _users +
        '?' +
        _page +
        '2&' +
        _amp +
        _per_page +
        '20'));
    if (response.statusCode == 200) {
      return UserResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load top headlines');
    }
  }
}
