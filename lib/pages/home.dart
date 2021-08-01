import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/location');
            },
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.edit_location,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 5.0,
                ),
                Text(
                  'Edit Location',
                  style: TextStyle(color: Colors.black),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
