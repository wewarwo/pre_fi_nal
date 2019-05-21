import 'package:final_01/file.dart';
import 'package:final_01/friend_model.dart';
import 'package:final_01/login.dart';
import 'package:final_01/user.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

FriendProvider f = FriendProvider();
List<Friend> friends;

class myfriend extends StatefulWidget {
  @override
  _myfriendState createState() => _myfriendState();
}

class _myfriendState extends State<myfriend> {
  int _id;
  String _user;
  String _pass;
  String _name;
  String _age;
  String _quote;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  // @override
  // void initState() {
  //   super.initState();
  //   f.loadDatas("https://jsonplaceholder.typicode.com/users").then((r) {
  //     friends = r;
  //     print(friends);
  //   });
  // }
  Future<void> getit() async {
    f.loadDatas("https://jsonplaceholder.typicode.com/users").then((r) {
      friends = r;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        theme: ThemeData(primaryColor: Color.fromRGBO(156, 39, 176, 1.0)),
        home: Scaffold(
          appBar: AppBar(
            title: Text("Friend list"),
          ),
          body: new FutureBuilder(
              future: f.loadDatas("https://jsonplaceholder.typicode.com/users"),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data) {
                    return Text(friends[index].name.toString());
                  }
                } else {
                  return Text("data");
                }
              }),
        ));
  }
  // ···
}
