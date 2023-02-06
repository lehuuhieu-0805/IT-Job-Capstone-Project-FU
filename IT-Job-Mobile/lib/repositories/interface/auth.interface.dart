import '../../models/base/base_model.dart';

abstract class IAuthRepository {
  Future<BaseModel> login(String username, String password);
}
