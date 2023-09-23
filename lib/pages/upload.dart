import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

class Upload extends StatefulWidget {
  const Upload({Key? key}) : super(key: key);

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  File? image;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if(image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);

    } catch(e) {
      print('Failed to pick image: $e');
    }
  }

  CollectionReference users = FirebaseFirestore.instance.collection('posts');
  TextEditingController titleController = TextEditingController();
  TextEditingController descripltion = TextEditingController();
  TextEditingController location = TextEditingController();

  Future<void> addUser() {
    // Call the user's CollectionReference to add a new user
    return users
        .add({
      'title': titleController.text,
      'description':descripltion.text ,
      'locatoin': location.text,
    })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
  sendReg(){

  }
  @override
  Widget build(BuildContext context) {
    print("${image}");
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            TextFormField(
              controller: titleController,
              decoration: InputDecoration(hintText: "Enter the Title"),
            ),
            TextFormField(
              controller: descripltion,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(hintText: "Enter the Descripition"),
            ),
            TextFormField(
              controller: location,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(hintText: "Enter The Location"),
            ),
            image == null?TextButton(
              onPressed: (){pickImage();},
              child: Text("Upload The pic"),
            ):Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: FileImage(image!)
                )
              ),
            ),
            image != null? TextButton(onPressed: () async{
              var request = http.MultipartRequest("post", Uri.http("192.168.187.158:8888", "/classify-flood"));
              request.files.add(
                  http.MultipartFile(
                      'picture',
                      File("${image}").readAsBytes().asStream(),
                      File("${image}").lengthSync(),
                      filename: "${image}".split("/").last
                  )
              );
              var res = await request.send();
              print(res);
              addUser();
            }, child: Text("Analyze Image")):Text(""),
          ],
        ),
      ),
    );
  }
}
