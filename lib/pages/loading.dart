import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:world_time/services/World_file.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time ="loading";
  void setWorldTime() async{
    WorldTime instance = WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
    await instance.getTime();
    //await Future.delayed(Duration(seconds: 2));
    Navigator.pushReplacementNamed(
        context,
        '/home',
        arguments:{
          'location':instance.location,
          'flag':instance.flag,
          'time':instance.time,
          'isDaytime':instance.isDaytime,
        }
        );
    //print(instance.time);
    // setState(() {
    //   time=instance.time;
    // });

  }
  @override
  void initState() {
    super.initState();
    setWorldTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: SpinKitFadingCube(

          color: Colors.white,
          size: 50.0,
        ),
      )
    );
  }
}
