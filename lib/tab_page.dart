import 'package:flutter/material.dart';
import 'package:instagram_clone/account_page.dart';
import 'package:instagram_clone/home_page.dart';
import 'package:instagram_clone/search_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TabPage extends StatefulWidget {
  final FirebaseUser user;
  TabPage(this.user);
  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  //상태 변화르 위해 저장하는 변수
  int _seletedIdx = 0;
  List _pages;

  //생성자 다음에 호출되는 initState 초기화 같은 작업을 진
  @override
  void initState() {
    _pages = [
      HomePage(widget.user),
      SearchPage(widget.user),
      AccountPage(widget.user),
    ];
  }

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
