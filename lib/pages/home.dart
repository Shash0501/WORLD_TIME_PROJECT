import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:world_time/services/World_file.dart';
import 'package:world_time/pages/Data.dart';
class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    //upd_worldtime data = ModalRoute.of(context)!.settings.arguments as upd_worldtime;
    data = data.isNotEmpty ? data : (ModalRoute.of(context)!.settings.arguments) as Map;
    print(data);
    String bgImage = data['isDaytime']?'download3.jpg':'download1.jpg';
    Color c = data['isDaytime']?(Color(0xFF3AADE7)):Color(0xFF000428);
    Color c2 = data['isDaytime']?Colors.black87:Colors.white;

    return Scaffold(
      backgroundColor: c,
      floatingActionButton: FloatingActionButton(
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)
        ),
        hoverColor: Colors.yellow[700],
        autofocus: true,
        backgroundColor:Colors.yellowAccent,
        foregroundColor: Colors.black87,
        heroTag: "btn3",
        onPressed: () async{
          dynamic result = await Navigator.pushNamed(context, '/choose_location');
          setState(() {
            data={
              'time':result['time'],
              'location':result['location'],
              'isDaytime':result['isDaytime'],
              'flag':result['flag']
            };
          });
          },
        child: Icon(
          Icons.edit_location,
        ),
      ),

      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,120,0,0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                    onPressed: (){
                      Navigator.pushNamed(context,'/choose_location');
                    },
                    icon: Icon(Icons.edit_location,
                    color: c2,),
                    label: Text("Edit Location",
                    style: TextStyle(
                      color: c2,
                    ),)),
                SizedBox(height: 20.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'].toUpperCase(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: c2,
                        fontSize: 35.0,
                        letterSpacing: 2.0,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20.0,),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: c2,
                    fontSize: 40.0,
                    letterSpacing: 2.0,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
