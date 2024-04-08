import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:practice_crud/fetchImg.dart';
import 'package:uuid/uuid.dart';

class ClassImgUploading extends StatefulWidget {
  const ClassImgUploading({super.key});

  @override
  State<ClassImgUploading> createState() => _ClassImgUploadingState();
}

class _ClassImgUploadingState extends State<ClassImgUploading> {
  File? userProfile;

  void sendImage() async{
    String ImageId = Uuid().v1();
    UploadTask uploadTask = FirebaseStorage.instance.ref().child("person-images").child(ImageId).putFile(userProfile!);
    TaskSnapshot taskSnapshot = await uploadTask;
    String imgLink = await taskSnapshot.ref.getDownloadURL();
    
    FirebaseFirestore.instance.collection("Persons").add({
      "image" : imgLink
    });

    Navigator.push(context, MaterialPageRoute(builder: (context) => FetchImage()));

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             GestureDetector(
               onTap: () async {
                 XFile? imagePick = await ImagePicker().pickImage(source: ImageSource.camera);
                 if(imagePick != null){
                   File convertedFile = File(imagePick.path);
                   setState(() {
                     userProfile = convertedFile;
                   });
                 }
                 else{
                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Image not selected!")));
                 }
               },
              child: userProfile != null ? CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.blue,
                 backgroundImage: FileImage(userProfile!),
                ) : CircleAvatar(
                radius: 60,
                backgroundColor: Colors.blue,
                backgroundImage: NetworkImage("https://via.placeholder.com/150"),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(onPressed: sendImage, child: Text("Upload"))
          ],
        ),
      ),
    );
  }
}
