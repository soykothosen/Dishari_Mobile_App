import 'package:dishariapp/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'registration.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:dishariapp/main.dart';

class offline extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

bool condition = true ;
int i = 0;

class _HomeState extends State<offline> {

  bool condition = true ;
  int i = 0;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //backgroundColor: Color(0xFFD5FAFD),
        body: Column(
          children: [
            SizedBox(height: 50.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                LiteRollingSwitch(
                  //initial value
                  value: true,
                  textOn: ' Bangla',
                  textOff: 'English',
                  colorOn: Colors.black12,
                  colorOff: Colors.black12,
                  iconOn: Icons.done,
                  iconOff: Icons.remove_circle_outline,
                  textSize: 16.0,
                  onChanged: (bool state) {
                    //Use it to manage the different states
                    if(i>0){
                      setState(() {
                        condition = state;
                      });}
                    i++;

                    print('Current State of SWITCH IS: $condition');
                  },
                ),
                SizedBox(width: 20.0),
              ],
            ),
            SizedBox(height: 230.0),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  condition == false ?
                  Text(
                    'আপনার ইন্টারনেট কানেকশন বন্ধ আছে',
                    style: TextStyle(
                      fontFamily: 'Hindsiliguri',
                      fontSize: 24.0,
                    ),
                  ):
                  Text(
                    'You are in offline',
                    style: TextStyle(
                      fontFamily: 'Hindsiliguri',
                      fontSize: 24.0,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  FlatButton(
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          new MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    color: Color(0xFF25386A),
                    textColor: Colors.white,
                    padding:  condition == false ?
                    EdgeInsets.symmetric(vertical: 7.0, horizontal: 60.0):
                    EdgeInsets.symmetric(vertical: 7.0, horizontal: 67.0),

                    child: condition == false ?
                    Text(
                      'লোড করুন',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontFamily: 'HindSiliguri',
                      ),
                    ) :
                    Text(
                      'Reload',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontFamily: 'HindSiliguri',
                      ),
                    ),

                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
