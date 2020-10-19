import './Models/user.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final User user;

  DetailScreen({Key key, @required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: Text(user.name),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(user.name),
            Text(user.username),
            Text(user.email)
          ],
        ),
      ),
    );
  }
}