// import 'package:review_web_app/data/repositories/user_repository/user_repository.dart';
// import 'package:review_web_app/models/user.dart' as local_user;
// import 'package:http/http.dart' as server_user;

// class ClientUserRepository extends UserRepository {
//   local_user.User? _user;

//   @override
//   Future<local_user.User?> getUser() async {
//     final server_user.User? serverUser; // = server_user.get(user object);

//     if (serverUser == null) return null;

//     _user = await _fromServerUserToModelUser(serverUser);
//     return  _user; 
//   }

//   Future<local_user.User?> _fromServerUserToModelUser(server_user.User user){

//   }

//   @override
//   Future<void> createNewUser({required Map<String, dynamic> user, required String uuid}) {}

//   @override
//   User? get getLoggedInUser => throw UnimplementedError();
// }
