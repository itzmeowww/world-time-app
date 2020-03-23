import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async {
    WorldTime bangkok = WorldTime(
        location: 'Bangkok', flag: 'thailand.png', url: 'Asia/Bangkok');
    await bangkok.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': bangkok.location,
      'time': bangkok.time,
      'flag': bangkok.flag,
      'isDaytime' : bangkok.isDaytime,
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
      backgroundColor: Colors.blue,
        body: Center(
      child: SpinKitThreeBounce(
        color: Colors.white,
        size: 50.0,
      ),
    ));
  }
}
