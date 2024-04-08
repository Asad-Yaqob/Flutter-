import 'package:flutter/material.dart';
import 'package:practice_crud/uihelper.dart';

class MySignInPage extends StatefulWidget {
  const MySignInPage({super.key});

  @override
  State<MySignInPage> createState() => _MySignInPageState();
}

class _MySignInPageState extends State<MySignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          UiHelper.CustomTextFormField(emailController, "abc@gmail.com",Icons.email, false),
            UiHelper.CustomTextFormField(passController, "*******", Icons.lock, true)
          ],
        ),
      ),
    );
  }
}
