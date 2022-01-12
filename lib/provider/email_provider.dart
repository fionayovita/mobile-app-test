import 'package:flutter/cupertino.dart';
import 'package:suitmedia/api/api_service.dart';
import 'package:suitmedia/model/email_model.dart';
import 'package:suitmedia/utils/result_state.dart';

class UserProvider extends ChangeNotifier {
  final ApiService apiService;

  UserProvider({required this.apiService}) {
    fetchAllUser();
  }

  late UserResult _userResult;
  late ResultState _state;
  String _message = '';

  String get message => _message;
  UserResult get result => _userResult;
  ResultState get state => _state;

  UserProvider getUsers() {
    fetchAllUser();
    return this;
  }

  Future<dynamic> fetchAllUser() async {
    try {
      _state = ResultState.Loading;
      notifyListeners();
      final user = await apiService.listUser();
      if (user.data.isEmpty) {
        _state = ResultState.NoData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.HasData;

        notifyListeners();
        return _userResult = user;
      }
    } catch (e) {
      _state = ResultState.Error;
      notifyListeners();
      print('No Internet Connection');
      return _message = 'Error: No Internet Connection';
    }
  }
}
