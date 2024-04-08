import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';



class YtImgUpload extends StatefulWidget {
  const YtImgUpload({super.key});

  @override
  State<YtImgUpload> createState() => _YtImgUploadState();
}

class _YtImgUploadState extends State<YtImgUpload> {
  // TextEditingController id = TextEditingController();
  // TextEditingController name = TextEditingController();
  // TextEditingController age = TextEditingController();
  // TextEditingController gender = TextEditingController();


  TextEditingController category = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController price = TextEditingController();

  PlatformFile? pickedFile;
  UploadTask? uploadTask;

  Future selectImage() async{
   final result = await FilePicker.platform.pickFiles();
   if(result == null) return;
   setState(() {
     pickedFile = result.files.first;
   });
  }

  Future uploadImage() async{
    final path = 'product-imgs/${pickedFile!.name}';
   final file = File(pickedFile!.path!);

   final ref = FirebaseStorage.instance.ref().child(path);

   setState(() {
     uploadTask = ref.putFile(file);
   });

   final snapshot = await uploadTask!.whenComplete(() => (){});

   final urlDownload = await snapshot.ref.getDownloadURL();
   //print('Download Link $urlDownload');

   // Map<String, dynamic> PersonData = {
   // "PersonId": id.text,
   // "PersonName": name.text,
   // "PersonAge": age.text,
   // "PersonGender": gender.text,
   //   "PersonImage": pickedFile!.name
   // };

    Map<String, dynamic> ProductData = {
      "ProductName": name.text,
      "ProductPrice": price.text,
      "ProductCategory": category.text,
      "image": urlDownload
    };

 FirebaseFirestore.instance.collection("Products").add(ProductData);
   setState(() {
     uploadTask = null;
   });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(pickedFile != null) 
              Expanded(child: Container(
                width: 200,
                color: Colors.blue,
                // child: Text(pickedFile!.name),
                child: Image.file(
                  File(pickedFile!.path!),
                  width:double.infinity,
                  fit: BoxFit.cover,
                )
              )),
            Form(
                child: Column(
                  children: [
                // TextFormField(
                //   controller: id,
                //   decoration: const InputDecoration(
                //     label: Text("Person Id")
                //   ),
                // ),
                TextFormField(
                  controller: name,
                  decoration: const InputDecoration(
                      label: Text("Person Name")
                  ),
                ),
                TextFormField(
                  controller: price,
                  decoration: const InputDecoration(
                      label: Text("Person Age")
                  ),
                ),
                TextFormField(
                  controller: category,
                  decoration: const InputDecoration(
                      label: Text("Person gender")
                  ),
                ),
                    const SizedBox(height: 30),
                    ElevatedButton(onPressed: selectImage, child: const Text("Select Image")),
                    const SizedBox(height: 30),
                    ElevatedButton(onPressed: uploadImage, child: const Text("Upload Image")),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
