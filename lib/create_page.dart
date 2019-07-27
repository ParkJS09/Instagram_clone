import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CreatePage extends StatefulWidget {
  final FirebaseUser user;
  CreatePage(this.user);

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {

  //화면이 없이지거나 해야할때 없어져야 하는 객체
  final textEditingController = TextEditingController();
   File _image;
  @override
  void dispose() {
    textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(onPressed: _getImage,
        child: Icon(Icons.add_a_photo)
      )
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      actions: <Widget>[
        IconButton(
           icon: Icon(Icons.send),
          onPressed: (){
             final firebaseStorageRef = FirebaseStorage.instance
                 .ref()
                 .child('post')
                 .child('${DateTime.now().millisecondsSinceEpoch}.png');

             final task = firebaseStorageRef.putFile(
              _image, StorageMetadata(contentType: 'image/phg')
             );

             task.onComplete.then((value) {
               var downloadUel = value.ref.getDownloadURL();
               downloadUel.then((uri){
                 var doc = Firestore.instance.collection('post').document();
                 print('user Info' + widget.user.toString());
                 doc.setData({
                   'id' : doc.documentID,
                    'photoUrl' : uri.toString(),
                    'contents' :  textEditingController.text,
                    'email' : widget.user.email,
                    'displayName' : widget.user.displayName,
                    'userPhotoUrl' : widget.user.photoUrl
                 }).then((onValue) {
                   Navigator.pop(context);
                 });
               });
             });
          },
        )
      ],
    );
  }

  Widget _buildBody() {
    return  SingleChildScrollView  (
      child: Column(
        children: <Widget>[
          _image  == null ? Text('No Image') : Image.file(_image),
//        Text 입력 위젯 -> Container 필요
        TextField(
          decoration: InputDecoration( hintText :  '내용을 입력하세요.'),
            controller: textEditingController
        )
        ],
      ),
    );
  }

  Future _getImage() async {
    //비동기처리
    File image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState((){
      _image = image;
    });
  }
}
