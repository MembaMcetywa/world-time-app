import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myfirstapp/Services/WorldTime.dart';
import 'package:myfirstapp/Pages/Choose_Location.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments; //
    print(data);

    String setBg = data['isday'] ? 'daytime.jpg' : 'nighttime.jpg';
    Color bgColor = data['isday'] ? Colors.blue : Colors.indigo;

    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/$setBg'),
            fit: BoxFit.cover,
          )
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120.0,0,0),
          child: SafeArea(child:Column(
            children: <Widget> [
              FlatButton.icon(onPressed: () async {
                  dynamic result = await Navigator.pushNamed(context, '/location');
                setState(() {
                  data = {
                    'location' : result['location'],
                    'flag': result['flag'],
                    'time': result['time'],
                    'isday': result['isday']
                  };
                });
              },
                icon: Icon(Icons.edit_location),
                label: Text("Edit Location"),
              ),
              SizedBox(height:20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    data['location'],
                    style: TextStyle(
                      color: Colors.grey[300],
                      fontSize: 28.0,
                      letterSpacing: 2.0,
                    ),
                  )
                ],
              ),
              SizedBox(height: 20.0),
              Text(
                data['time'],
                style: TextStyle(
                  color: Colors.grey[300],
                  fontSize: 66.0,
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}
