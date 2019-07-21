import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


 class HomePage extends StatelessWidget {

   final FirebaseUser user;

   HomePage(this.user);

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text('Instagram Clone',
         style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold ))
       ),
       body: _buildBody()
     );
   }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: SafeArea(child:SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Text('Instagram에 오신것을 환영합니다.',
              style : TextStyle(
                fontSize: 24.0)),
              Padding(padding:  EdgeInsets.all(8.0)),
              Text('사진과 동영상을 보시려면 팔로우 하세요.',
              style : TextStyle(
                fontSize: 12.0)),
              Padding(padding:  EdgeInsets.all(16.0)),
              SizedBox (
                width: 260,
                child: Card(
                  elevation: 4.0 ,
                  child: Column(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.all(8.0)),
                      SizedBox(
                       width:80.0, height: 80.0,
                        child: CircleAvatar(
                           backgroundImage:
                           NetworkImage(
                                user.photoUrl
                           ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(8.0)),
                      Text(user.email,style: TextStyle(fontWeight: FontWeight.bold)),
                      Padding(padding: EdgeInsets.all(4.0)),
                       Text(user.displayName),
                      Padding(padding: EdgeInsets.all(8.0)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            width: 70, height: 70,
                            child: Image.network('http://imgnews.naver.net/image/109/2019/02/14/0003952406_001_20190214144515374.jpg', fit:  BoxFit.cover ),
                          ),
                          Padding(padding: EdgeInsets.all(4)),
                          SizedBox(
                            width: 70, height: 70,
                            child: Image.network('http://imgnews.naver.net/image/5353/2019/04/10/0000521909_001_20190410172238922.jpg', fit:  BoxFit.cover),
                          ),
                          Padding(padding: EdgeInsets.all(4)),
                          SizedBox(
                            width: 70, height: 70,
                            child: Image.network('http://imgnews.naver.net/image/5353/2019/03/08/0000510175_002_20190308144820881.jpg' ),
                          )
                        ],
                      ),
                      Padding(padding: EdgeInsets.all(8.0)),
                      Text('FaceBook 친구'),
                      Padding(padding: EdgeInsets.all(4.0)),
                      RaisedButton(
                        child: Text('팔로우'),
                        color: Colors.blueAccent,
                        textColor: Colors.white,
                        onPressed: () {},
                      ),
                      Padding(padding: EdgeInsets.all(4.0))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

      )),
    );
  }

 }
