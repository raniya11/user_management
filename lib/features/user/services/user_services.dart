import 'package:user_management/features/user/model/user_model.dart';
import 'package:user_management/features/viewmodels/user_viewmodel.dart';

class UserServices{

  UserViewModel userViewModel=UserViewModel();
  //add user

  Future addUser(UserModel user)async{
   final userdata=UserModel().toMap(user);
   userViewModel.addUser(user);


  }


  //deleting user

  Future deleteUser(UserModel user)async{
    final userdata=UserModel().toMap(user);
    userViewModel.addUser(user);
}
}