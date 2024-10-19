import 'package:mobx/mobx.dart';
import 'package:dio/dio.dart';
import '../model/user_model.dart';

part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  @observable
  ObservableList<UserModel> users = ObservableList<UserModel>();

  @observable
  ObservableList<UserModel> visitors = ObservableList<UserModel>();

  Dio _dio = Dio();

@action
Future<void> fetchUsers() async {
  try {
    print("Fetching users...");
    var response = await _dio.get('https://randomuser.me/api/?results=100&gender=male');
    
    var data = response.data['results'] as List;
    print("API Data: ${data}"); // Print the raw API data
    
    users = ObservableList.of(data.map((user) => UserModel(
      name: user['name']['first'] + " " + user['name']['last'],
      profilePictureUrl: user['picture']['thumbnail'],
    )));
    
    print("User list: ${users.length}"); // Print number of users added to the store
  } catch (e) {
    print("Error: $e");
  }
}




  @action
  void updatePayment(UserModel user, String method, double amount) {
    user.paymentMethod = method;
    user.paymentAmount = amount;
  }

  @action
  void addVisitor() {
    visitors.add(UserModel(name: "Visitor", profilePictureUrl: "", paymentAmount: 1000));
  }

  @action
  void clearAllData() {
    users.clear();
    visitors.clear();
  }
}
