import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:flutter_app/service/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  // void getData() async{
  //   Response response = await get('https://jsonplaceholder.typicode.com/todos/1');
  //   Map data = jsonDecode(response.body);
  //   print(data);
  //   print(data['title']);
  // }

  void setupWorldTime() async{
    WorldTime instance = WorldTime(location: 'Berlin',flag: 'germany.png', url: 'Europe/Berlin');
    await instance.getTime();
    //print(instance.time);
    Navigator.pushReplacementNamed(context, '/home', arguments: {
       'location': instance.location,
       'flat': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //print('InitState function Run');
    //getData();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
         child: SpinKitFadingCube(
           color: Colors.white,
           size: 50.0,
         ),
      )
    );
  }
}
