import 'dart:developer';

import '../../apis/path_api.dart';
import '../../apis/rest_api.dart';
import '../../models/base/base_model.dart';
import '../interface/auth.interface.dart';
import '../request/login.request.dart';

class AuthRepository implements IAuthRepository {
  RestAPI restAPI = RestAPI();
  @override
  Future<BaseModel<String>> login(String username, String password) async {
    BaseModel<String> response = BaseModel();
    try {
      LoginRequest payload =
          LoginRequest(username: username, password: password);
      response = await restAPI.post<BaseModel<String>>(
          PathAPI.login, payload.toJson());
      return response;
    } catch (e) {
      log(e.toString());
    }
    return response;
  }
}
