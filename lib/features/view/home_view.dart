import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_management/core/services/theme_services.dart';
import 'package:user_management/features/viewmodels/user_viewmodel.dart';
import 'package:user_management/features/widgets/user_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    final themeData=Theme.of(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, "/newuser");
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text("User Management",style: themeData.textTheme.displayLarge,),
        actions: [
          Switch(
            trackOutlineColor: MaterialStateProperty.all(Colors.transparent),
              activeTrackColor: Colors.green,
              activeColor: Colors.greenAccent,
              value: Provider.of<ThemeServiceProvider>(context).isDarkModeOn, onChanged: (_){
            Provider.of<ThemeServiceProvider>(context,listen: false).toggleTheme();
          }),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("All Users",style: themeData.textTheme.displayLarge,),
            SizedBox(height: 15,),
            Expanded(
              child: Consumer<UserViewModel>(
                builder: (context,userprovider,child){
                  if(userprovider.users.isEmpty){
                    return Center(
                      child: Text("no users"),
                    );
                  }
                  return ListView.builder(
                    itemCount: userprovider.users.length,
                    itemBuilder: (context,index){
                      return UserCard(themeData: themeData,
                          index:index,
                        user:userprovider.users[index],
                      );
                    });
                },
              ),
                )
          ],
        ),
      ),
    );
  }
}


