import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime
{




String location; //location name for UI
String time; //Time in that location
String flag; //url to an asset flag icon
String url; //location url for api endpoint
bool isday;

WorldTime({this.location, this.flag, this.url});

Future <void> getTime() async
{
  try{
  var Url = Uri.parse("https://worldtimeapi.org/api/timezone/$url");
  //make the request
  Response response = await get(Url);
  Map data = jsonDecode(response.body);
  //get properties from data
  String datetime = data['datetime'];
  String offset = data['utc_offset'].substring(1,3);

  //print(datetime);
  //print(offset);

  DateTime now = DateTime.parse(datetime);
  now = now.add(Duration(hours:int.parse(offset)));
  isday = now.hour > 6 && now.hour < 20 ?true : false;
  time = DateFormat.jm().format(now);
}
catch(e)
{
  //var $e;
  print('Caught error:' + e);
  time = 'Could not get time';
}
}
}
WorldTime x = WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
