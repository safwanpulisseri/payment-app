import 'package:http/http.dart' as http;
import '../../core/api/api_url.dart';
import '../models/user_model.dart';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';


class UserData {
  Future<UserModel?> getUserFromApi() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      log(response.body);
      if (response.statusCode == 200) {
        final decodedData = jsonDecode(response.body);
        // Check what `decodedData` actually contains
        List<dynamic> results = decodedData['results'];

        if (results.isNotEmpty) {
          // Assuming results is a list of user maps
          UserModel user = UserModel.fromJson(map: results[0]);
          log(user.toString());
          return user;
        } else {
          log('No users found in results.');
          return null;
        }
      } else {
        log('Failed to load data');
        return null;
      }
    } on SocketException catch (e) {
      log("Network error: $e");
    } on HttpException catch (e) {
      log("Http error: $e");
    } catch (e) {
      log("Error: $e");
      return null;
    }
    return null;
  }
}
