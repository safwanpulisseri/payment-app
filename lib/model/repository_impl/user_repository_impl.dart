import '../data/user_data.dart';
import '../models/user_model.dart';
import '../repository/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final UserData userData;
  UserRepositoryImpl({
    required this.userData,
  });
  @override
  Future<UserModel?> getUserFromApi() async {
    return await userData.getUserFromApi();
  }
  
}
