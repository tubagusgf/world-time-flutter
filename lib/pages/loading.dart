import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = 'Loading...';

  void setupWorldTime() async {
    WorldTime worldtime = WorldTime(
        location: 'Jakarta', flag: 'indonesia.png', url: 'Asia/Jakarta');
    await worldtime.getTime();
    setState(() {
      time = worldtime.time;
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('$time')),
    );
  }
}
