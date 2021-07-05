import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:myfirstapp/Services/WorldTime.dart';
class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = 'loading';

  void setupWorldTime() async
  {
    WorldTime x = WorldTime(location: 'Berlin', flag: 'germany.jpg', url: 'Europe/Berlin');
    await x.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {'location': x.location,
      'flag': x.flag, 'time': x.time, 'isday': x.isday});
  }


@override
void initState(){
     
    super.initState();
    setupWorldTime();
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
          child: SpinKitWave(
            color: Colors.white,
            size: 80.0,),
          ),
    );
  }
}
