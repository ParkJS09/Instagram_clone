import 'package:flutter/material.dart';
import 'package:instagram_clone/home_page.dart';

class TabPage extends StatefulWidget {
  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  //상태 변화르 위해 저장하는 변수
  int _seletedIdx = 0;
  List _pages = [
    HomePage(),
    Text('Page2'),
    Text('Page3'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : Center(child: _pages[_seletedIdx ] ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.black,
        onTap: _onItemTapped,
        currentIndex: _seletedIdx ,
        items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon:  Icon(Icons.home), title: Text('HOME')),
        BottomNavigationBarItem(icon:  Icon(Icons.search), title: Text('SEARCH')),
        BottomNavigationBarItem(icon:  Icon(Icons.account_circle), title: Text('ACCOUNT '))
      ]),
    );
  }

  void _onItemTapped(int idx) {
    setState(() {
      _seletedIdx = idx;
    });
  }
}
