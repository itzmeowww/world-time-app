import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(location: 'Bangkok', flag: 'thailand.png', url: 'Asia/Bangkok'),
    WorldTime(location: 'London', flag: 'england.png', url: 'Europe/London'),
    WorldTime(location: 'Bangkok', flag: 'thailand.png', url: 'Asia/Bangkok'),
    WorldTime(location: 'London', flag: 'england.png', url: 'Europe/London'),
    WorldTime(location: 'Bangkok', flag: 'thailand.png', url: 'Asia/Bangkok'),
    WorldTime(location: 'London', flag: 'england.png', url: 'Europe/London'),
    WorldTime(location: 'Bangkok', flag: 'thailand.png', url: 'Asia/Bangkok'),
    WorldTime(location: 'London', flag: 'england.png', url: 'Europe/London'),
    WorldTime(location: 'Bangkok', flag: 'thailand.png', url: 'Asia/Bangkok'),
    WorldTime(location: 'London', flag: 'england.png', url: 'Europe/London'),
    WorldTime(location: 'Bangkok', flag: 'thailand.png', url: 'Asia/Bangkok'),
    WorldTime(location: 'London', flag: 'england.png', url: 'Europe/London'),
    WorldTime(location: 'Bangkok', flag: 'thailand.png', url: 'Asia/Bangkok'),
    WorldTime(location: 'London', flag: 'england.png', url: 'Europe/London'),
    WorldTime(location: 'Bangkok', flag: 'thailand.png', url: 'Asia/Bangkok'),
    WorldTime(location: 'London', flag: 'england.png', url: 'Europe/London'),
    WorldTime(location: 'Bangkok', flag: 'thailand.png', url: 'Asia/Bangkok'),
    WorldTime(location: 'London', flag: 'england.png', url: 'Europe/London'),
  ];

  void updateTime(index) async {
    WorldTime choose = locations[index];
    await choose.getTime();

    Navigator.pop(context, {
      'location': choose.location,
      'time': choose.time,
      'flag': choose.flag,
      'isDaytime' : choose.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 1.0),
            child: Card(
              child: ListTile(
                onTap: (){
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: Text('This is pic'),
              ),
            ),
          );
        },
      ),
    );
  }
}
