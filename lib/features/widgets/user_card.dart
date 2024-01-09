import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_management/features/user/model/user_model.dart';
import 'package:user_management/features/viewmodels/user_viewmodel.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    super.key,
    required this.themeData,
    required this.index,
    required this.user,
  });

  final ThemeData themeData;
  final int index;
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      child: ListTile(
        trailing: IconButton(
          icon: Icon(
            Icons.delete,
            color: themeData.colorScheme.secondary,
          ),
          onPressed: () {
            // Show a confirmation dialog
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Confirm Delete"),
                  content: Text("Are you sure you want to delete this item?"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the dialog
                      },
                      child: Text("Cancel",style: themeData.textTheme.bodySmall,),
                    ),
                    TextButton(
                      onPressed: () {
                        // Add your delete logic here
                        // For example, call a function to delete the user
                        // e.g., deleteUserFunction();
                        Provider.of<UserViewModel>(context,listen:false).deleteUser(user).then((value){
                          Navigator.of(context).pop();

                        });

                        // After deletion, close the dialog
                      },
                      child: Text("Delete",style: themeData.textTheme.bodySmall,),
                    ),
                  ],
                );
              },
            );
          },
        )
        ,
        leading: CircleAvatar(
          backgroundColor: themeData.colorScheme.secondary,
          child: Center(
            child: Text("${index+1}",style: themeData.textTheme.bodySmall,),
          ),
        ),
        title: Text(
          "${user.name}",
          style: themeData.textTheme.titleMedium,
        ),
        subtitle: Text(
          "${user.email}",
          style: themeData.textTheme.titleMedium,
        ),
      ),
    );
  }
}
