import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments as Map;
    print(data);

    return Scaffold(
      body: SafeArea(
          child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/location');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                data['location'],
                style: TextStyle(fontSize: 28.0, letterSpacing: 2.0),
              )
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            data['time'],
            style: TextStyle(fontSize: 66.0),
          )
        ],
      )),
    );
  }
}
