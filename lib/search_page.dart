import 'package:flutter/material.dart';
import 'package:instagram_clone/create_page.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
//        화면전환!
       onPressed: (){
         Navigator.push(context, MaterialPageRoute(builder: (context)  => CreatePage()));
       },
       child: Icon(Icons.create),
     backgroundColor: Colors.blue,),
    );
  }

  Widget _buildBody() {
    return GridView.builder(
//      gridDelegate에서 모양같은 것을 설정할 수 있다.
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1.0,
        mainAxisSpacing: 1.0,
        crossAxisSpacing: 1.0
      ),
      itemCount: 5,
      itemBuilder: (context, index){
         return _buildListItem(context, index);
     },
    );
  }

  Widget _buildListItem(BuildContext context, int index) {
    return Image.network(
        'http://imgnews.naver.net/image/609/2018/12/14/201812141930000710_3_20181214193728323.jpg',
        fit: BoxFit.cover);
  }
}
