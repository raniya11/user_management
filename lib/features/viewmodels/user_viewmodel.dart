import 'package:flutter/foundation.dart';
import 'package:user_management/features/user/model/user_model.dart';

class UserViewModel extends ChangeNotifier{
  List<UserModel> _users=[];
  List<UserModel> get users=>_users;

  //add user

  Future addUser(UserModel user)async{

    _users.add(user);
    notifyListeners();
    print(_users);
  }

  Future deleteUser(UserModel user)async{
    _users.remove(user);
    notifyListeners();
    print(_users);
  }

}