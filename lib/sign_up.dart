import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MySignUpPage extends StatefulWidget {
  const MySignUpPage({super.key});

  @override
  State<MySignUpPage> createState() => _MySignUpPageState();
}

class _MySignUpPageState extends State<MySignUpPage> {
  TextEditingController userName = TextEditingController();
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(40),
        child: Form(
          key: _formKey,
            child: Column(
          children: [
            TextFormField(
              controller:userName,
              validator: (value) {
              if(value == null || value.isEmpty){
                return "User Name Cannot Be Empty!";
              }
              return null;
              },
              decoration: const InputDecoration(
                label: Text("User Name")
              ),
            ),
            TextFormField(
              controller:userEmail,
              validator: (value) {
                if(value == null || value.isEmpty){
                  return "Email is mandatory!";
                }
                return null;
              },
              decoration: const InputDecoration(
                label: Text("User Email")
              ),
            ),
            TextFormField(
              controller:userPassword,
              obscureText: true,
              validator: (value) => value!.isEmpty  ? "Please Enter Password" : null,
              decoration: const InputDecoration(
                label: Text("Password")
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(onPressed: (){
            if(_formKey.currentState!.validate()){
              FirebaseAuth.instance.createUserWithEmailAndPassword(email: userEmail.text, password: userPassword.text);
            }
            }, child: Text("Sign Up"))
          ],
        )),
      ),
    );
  }
}
