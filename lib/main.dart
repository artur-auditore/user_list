import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:user_list/DetailScreen.dart';
import 'Models/user.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{
  var users = new List<User>();

  _getUsers(){
    var url = 'https://jsonplaceholder.typicode.com/users';
    http.get(url).then((response) => {
      setState((){
        Iterable list = json.decode(response.body);
        users = list.map((model) => User.fromJson(model)).toList();
      })
    });
  }
  @override
  void initState() {
    super.initState();
    _getUsers();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("User List"),
        ),
        body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(users[index].name),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => DetailScreen(user: users[index],)
                ));
              },
            );
          }
        ),
      )
    );
  }
}