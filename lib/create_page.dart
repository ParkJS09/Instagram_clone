import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreatePage extends StatefulWidget {
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
