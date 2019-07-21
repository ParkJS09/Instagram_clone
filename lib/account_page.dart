import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class  AccountPage extends StatefulWidget {
  final FirebaseUser user;
  AccountPage(this.user);
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody()
    );
  }

  Widget _buildAppBar() {
     return AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app), onPressed: () {
              FirebaseAuth.instance.signOut();
              _googleSignIn.signOut();
          },
          )
        ],
     );
  }

  Widget _buildBody() {
    return   Padding(
      padding:  EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  SizedBox(
                    width: 80,
                    height: 80,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage('http://imgnews.naver.net/image/609/2019/03/22/201903222152396710_2_20190322220008953.jpg'),
                    ),
                  ),
                   Container(
                     width: 80,
                     height: 80,
                     alignment: Alignment.bottomRight,
                      child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          SizedBox(
                            width: 28,
                            height: 28,
                            child: FloatingActionButton(onPressed: null,
                            backgroundColor: Colors.white,),
                           ),
                          SizedBox(
                            width: 25,
                            height: 25,
                            child: FloatingActionButton(
                              backgroundColor: Colors.blue,
                              onPressed: () {},
                              child: Icon(Icons.add ),
                          ),
                    ),
                        ],
                      ),
                  )
                ],
              ),
              Padding(padding: EdgeInsets.all(4.0)),
              Text(widget.user.displayName,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),)
            ],
          ),
          Text('0\n게시물', textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18)) ,
          Text('0\n팔로워', textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18)) ,
          Text('0\n팔로잉', textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18))
        ],
      ),
    );
  }
}
