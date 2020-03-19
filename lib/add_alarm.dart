import 'package:flutter/material.dart';
import 'widgets/circle_day.dart';
class AddAlarm extends StatefulWidget {
  AddAlarm({Key key}) : super(key: key);
  _AddAlarmState createState() => _AddAlarmState();
}

class _AddAlarmState extends State<AddAlarm> {

  TimeOfDay _selectedTime;
  ValueChanged<TimeOfDay> selectTime;

  @override
  void initState() {
     _selectedTime = new TimeOfDay(hour: 12, minute: 30);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0E21),
      appBar: AppBar(
        backgroundColor: Color(0xFF0A0E21),
        title: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left:60.0),
              child: Text('Add Alarm', style: TextStyle(
                color: Colors.white,
                fontSize: 25.0
              )),
            )
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(height: 60.0,),
              new GestureDetector(
                child: Text(_selectedTime.format(context), style: TextStyle(
                  fontSize: 60.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),),
                onTap: () {
                  _selectTime(context);
                },
              ),
              SizedBox(height: 40.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  circleDay('Mon', context, false),
                  circleDay('Tue', context, true),
                  circleDay('Wed', context, true),
                  circleDay('Thu', context, true),
                  circleDay('Fri', context, false),
                  circleDay('Sat', context, true),
                  circleDay('Sun', context, false),
                ],
              ),
              SizedBox(height: 60.0,),
              SizedBox(height: 2.0, child: Container(color: Colors.white30,),),
              ListTile(
                leading: Icon(Icons.notifications_none, color: Colors.white,),
                title: Text('Alarm Notification', style: TextStyle(color: Colors.white)),
              ),
              SizedBox(height: 2.0, child: Container(color: Colors.white30,),),
              ListTile(
                leading: Icon(Icons.check_box, color: Colors.white,),
                title: Text('Vibrate', style: TextStyle(color: Colors.white)),
              ),
              SizedBox(height: 2.0, child: Container(color: Colors.white30,),),
              SizedBox(height: 60.0,),
              FlatButton(
                color: Color(0xFFEB1555),
                child: Text('Save', style: TextStyle(color: Colors.white)),
                onPressed: () {
                },
              )
            ],
          ),
        )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () =>  Navigator.of(context).pop(),
        backgroundColor: Colors.white,
        child: Icon(
          Icons.delete,
          size: 20.0,
          color:Color(0xFFEB1555),
        ),
      )
    );
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay picked =  await showTimePicker(
      context: context, 
      initialTime: _selectedTime
    );
    setState(() {
      _selectedTime = picked;
    });
  }
}