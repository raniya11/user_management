import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_management/features/user/model/user_model.dart';
import 'package:user_management/features/viewmodels/user_viewmodel.dart';
import 'package:user_management/features/widgets/text_field.dart';
import 'package:uuid/uuid.dart';

class AddUser extends StatefulWidget {
  const AddUser({super.key});

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {


  final _userKey=GlobalKey<FormState>();
  TextEditingController _emailController=TextEditingController();
  TextEditingController _nameController=TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    super.dispose();
  }

 var uuid=Uuid();
  var id;

  @override
  void initState() {
    id=uuid.v1();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    final themeData=Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("User Management",style: themeData.textTheme.displayLarge,),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 20),
        child: Form(
          key: _userKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Add User"),
              CustomTextField(controller: _nameController,
              hintText: "Enter Name",
                inputtype: TextInputType.name,
              ),
              SizedBox(height: 20,),
              CustomTextField(controller: _emailController, hintText: "Enter Email",inputtype: TextInputType.emailAddress,),
              SizedBox(height: 20,),

              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: themeData.colorScheme.secondary
                  ),
                  onPressed: (){

                    if(_userKey.currentState!.validate()){
                      UserModel user=UserModel(
                          id: id,
                          name: _nameController.text,
                          email: _emailController.text,
                          status: 1,
                          createdat: DateTime.now()
                      );
                      Provider.of<UserViewModel>(context,listen:false).addUser(user).then((value){
                        Navigator.pop(context);
                      });
                    }


                  },
                  child: Text("Save",style: themeData.textTheme.bodySmall,),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


