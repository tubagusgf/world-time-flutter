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

    // set background
    String bgImage = data['isDaytime'] ? 'day.png' : 'night.png';
    Color bgColor = data['isDaytime'] ? Colors.blue : Colors.indigo[700]!;

    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/$bgImage'), fit: BoxFit.cover)),
        child: SafeArea(
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
                      color: Colors.grey[300],
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      'Edit Location',
                      style: TextStyle(color: Colors.grey[300]),
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
                  style: TextStyle(
                      fontSize: 28.0, letterSpacing: 2.0, color: Colors.white),
                )
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              data['time'],
              style: TextStyle(fontSize: 66.0, color: Colors.white),
            )
          ],
        )),
      ),
    );
  }
}
