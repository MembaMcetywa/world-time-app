import 'package:flutter/material.dart';
import 'package:myfirstapp/Services/WorldTime.dart';
class Choose_Location extends StatefulWidget {
  @override
  _Choose_LocationState createState() => _Choose_LocationState();
}

class _Choose_LocationState extends State<Choose_Location> {

List<WorldTime> locations = [
  WorldTime(url:'Europe/London', location: 'London', flag: 'uk.jpg'),
  WorldTime(url:'Europe/Berlin', location: 'Berlin', flag: 'germany.jpg'),
  WorldTime(url:'Africa/Johannesburg', location: 'Johannesburg', flag: 'sa.jpg'),
  WorldTime(url:'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.webp'),
  WorldTime(url:'Africa/Lagos', location: 'Lagos', flag: 'naija.jpg'),
  WorldTime(url:'America/New_York', location: 'New York', flag: 'us.jpg'),
  WorldTime(url:'America/Chicago', location: 'Chicago', flag: 'us.jpg'),
  WorldTime(url:'America/Mexico_City', location: 'Mexico City', flag: 'mexico.jpg'),
  WorldTime(url:'Asia/Seoul', location: 'Seoul', flag: 'south_korea.webp'),
  WorldTime(url:'Asia/Beijing', location: 'Beijing', flag: 'china.png')
];

 void UpdateTime(index) async
 {
   WorldTime x = locations[index];
   await x.getTime();

   //back to home screen
   Navigator.pop(context, {
     'location': x.location,
     'flag': x.flag, 'time': x.time, 'isday': x.isday
   });

 }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("Choose a location"),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: (){
                  UpdateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      )
    );
  }
}
