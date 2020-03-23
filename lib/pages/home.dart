import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    Color textColor = data['isDaytime'] ? Colors.black : Colors.white;
    Color backgroundColor = data['isDaytime'] ? Colors.white : Colors.black;

    print(data);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 180, 0, 0),
        child: Column(
          children: <Widget>[
            FlatButton.icon(
              onPressed: () async {
                dynamic result = await Navigator.pushNamed(context, '/location');
                setState(() {
                  data = {
                    'time' : result['time'],
                    'location' : result['location'],
                    'flag' : result['flag'],
                    'isDaytime' : result['isDaytime'],

                  };
                });
              },
              icon: Icon(Icons.edit_location,color: textColor,),
              label: Text('Edit Location',style: TextStyle(color: textColor),),
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  data['location'],
                  style: TextStyle(
                    color: textColor,
                    fontSize: 28.0,
                    letterSpacing: 2.0,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              data['time'],
              style: TextStyle(
                color: textColor,
                fontSize: 66.0,
              ),
            ),
          ],
        ),
      )),
    );
  }
}
