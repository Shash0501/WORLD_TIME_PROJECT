import 'package:flutter/material.dart';
import 'package:world_time/services/World_file.dart';
class ChooseLocation extends StatefulWidget {

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];
  void updateTime(index) async{
    WorldTime instance = locations[index];
    await instance.getTime();
    // Navigation back to home screen
    Navigator.pop(context,{
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDaytime':instance.isDaytime,
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellowAccent,
        iconTheme: IconThemeData(
        color: Colors.black),
        centerTitle: true,
        title: Text(
          "CHOOSE LOCATION",
          style: TextStyle(
            color: Colors.black87
          ),
          textAlign: TextAlign.center,),
      ),

      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.all(2.0),
                child: Card(
                  color: Colors.grey,
                  child: ListTile(
                    onTap: (){
                        updateTime(index);
                    },
                    title: Text(locations[index].location.toUpperCase(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/${locations[index].flag}'),
                    ),
                  )
                ),
              );
          }
          ),

    );
  }
}
