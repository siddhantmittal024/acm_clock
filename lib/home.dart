import 'package:flutter/material.dart';
import 'package:my_clock/add_alarm.dart';
import 'dart:async';

import 'package:my_clock/timer.dart';

class HomeScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}
Future navigateToTimer(context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => TimerApp()));
}
Future navigateToAlarm(context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => AddAlarm()));
}

class HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{
  Animation animation;
  AnimationController animationController;
  HomeScreenState();
  _currentTime(){
    return "${DateTime.now().hour} : ${DateTime.now().minute} : ${DateTime.now().second}";
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this,duration: Duration(seconds: 1));
    animationController.addListener((){

      if(animationController.isCompleted){
        animationController.reverse();
      } else if(animationController.isDismissed){
        animationController.forward();
      }
      setState(() {

      });
    });
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Clock',style: TextStyle(
            fontSize: 40.0
        ),)),
        backgroundColor: Color(0xFF0A0E21),
        elevation: 0.0,
      ),
      body: Container(
        color: Color(0xFF0A0E21),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top:30.0),
                child: Material(
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  elevation: 10.0,
                  color: Color(0xFFEB1555),
                  child: Container(
                    width: 360,
                    height: 300,
                    child: Center(
                      child: Text(_currentTime(),style: TextStyle(
                          fontSize: 60.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                      ),),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top:100.0, bottom: 25.0),
                child: Container(
                  child: Text(
                    'TIMER',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0
                    ),
                  ),
                ),
              ),
              FloatingActionButton(
                elevation: 10,
                onPressed: ()
                {
                  navigateToTimer(context);
                },
                backgroundColor: Color(0xFFEB1555),
                child:
                Icon(
                  Icons.timer,
                  size: 30.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:50.0, bottom: 25.0),
                child: Container(
                  child: Text(
                    'ALARM',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0
                    ),
                  ),
                ),
              ),
              FloatingActionButton(
                heroTag: Null,
                elevation: 10,
                onPressed: ()
                {
                  navigateToAlarm(context);
                },
                backgroundColor: Color(0xFFEB1555),
                child:
                Icon(
                  Icons.alarm,
                  size: 30.0,
                ),
              ),


            ],

          ),
        ),

      ),

    );
  }

}
