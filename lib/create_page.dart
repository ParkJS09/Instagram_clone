import 'package:flutter/material.dart';


class CreatePage extends StatefulWidget {
  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {

  //화면이 없이지거나 해야할때 없어져야 하는 객체
  final textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(onPressed: null,
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
    return  Column(
      children: <Widget>[
        Text('No Image'),
//        Text 입력 위젯 -> Container 필요
      TextField(
        decoration: InputDecoration( hintText :  '내용을 입력하세요.'),
          controller: textEditingController
      )
      ],
    );
  }
}
