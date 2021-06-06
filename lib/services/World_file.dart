import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
class WorldTime
{
  late String location; //Location name for UI
  late String time; // Time
  late String flag; //URL to asset of the flag
  late String url ;//location URL for API endpoint
  late bool isDaytime;
  WorldTime({required this.location,required this.flag,required this.url});
  Future<void> getTime() async
  {
    try{
      Response response = await get(Uri.parse('http://www.worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      // Getting prop from data
      String datetime = data['datetime'];
      // date time = 2021-06-05 18:13:41.828707Z
      // offset will be of form +01:00 or +03:00
      // but we only want number from index 1 and 2
      // therefore we store only a substring of utc_offset into offset
      String offset =data['utc_offset'].substring(1,3);
      //print(offset);
      //creating Date time object
      DateTime now = DateTime.parse(datetime);
      //print(now);
      now=now.add(Duration(hours: int.parse(offset)));
      //print(now);
      // OUTPUT
      // 01
      // 2021-06-05 18:19:27.893343Z
      // 2021-06-05 19:19:27.893343Z

      // Response response = await get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
      // Map data = jsonDecode(response.body);
      // print(data['title']);
      //time = now.toString();
      isDaytime =((now.hour>6)&&(now.hour<20))?true:false;
      time = DateFormat.jm().format(now);

    }
    catch(e){
      print("caught error is $e");
      time="COULD NOT GET TIME DATA!";
    }
  }
}

