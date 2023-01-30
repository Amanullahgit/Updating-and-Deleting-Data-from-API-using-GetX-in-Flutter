import 'package:api_update/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  UserController userController = Get.put(UserController());
  TextEditingController userIdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('API Update & Delete'), actions: [
        TextButton(
            onPressed: () {
              userController.nameController.clear();
              userController.emailController.clear();
              userController.genderController.clear();
              userController.statusController.clear();
            },
            child: Text(
              'clear',
              style: TextStyle(color: Colors.white),
            ))
      ]),
      body: Container(
        margin: EdgeInsets.all(20),
        child: ListView(children: [
          TextField(
            controller: userController.nameController,
            decoration: InputDecoration(hintText: 'name'),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: userController.emailController,
            decoration: InputDecoration(hintText: 'email'),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: userController.genderController,
            decoration: InputDecoration(hintText: 'gender'),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: userController.statusController,
            decoration: InputDecoration(hintText: 'status'),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: userIdController,
            decoration: InputDecoration(hintText: 'user id'),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              userController.fetchUserData(userIdController.text);
            },
            child: Text('get data'),
          ),
          ElevatedButton(
            onPressed: () {
              userController.updateUserData(userIdController.text);
            },
            child: Text('update data'),
          ),
          ElevatedButton(
            onPressed: () {
              userController.deleteUserData(userIdController.text);
            },
            child: Text('delete data'),
          )
        ]),
      ),
    );
  }
}
