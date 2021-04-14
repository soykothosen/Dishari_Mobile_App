import 'package:dishariapp/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'registration.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

bool condition = true ;
int i = 0;

class _HomeState extends State<Home> {

  bool condition = true ;
  int i = 0;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //backgroundColor: Color(0xFFD5FAFD),
        body: Container(
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage('imgs/1.png'),
    fit: BoxFit.cover,
    ),),


          child: Column(
            children: [
              SizedBox(height: 30.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(width: 5.0),
                  Image.asset('imgs/tlogo.png'),
                  SizedBox(width: 70.0),
                  LiteRollingSwitch(
                    //initial value
                    value: true,
                    textOn: ' Bangla',
                    textOff: 'English',
                    colorOn: Colors.black38,
                    colorOff: Colors.black38,
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
                  SizedBox(width: 5.0),
                ],
              ),
              SizedBox(height: 75.0),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Center(
                        child: Icon(
                          Icons.directions_boat,
                          color: Colors.white,
                          size: 50.0,
                        ),
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black38,
                      ),
                      width: 75.0,
                      height: 75.0,
                    ),
                    SizedBox(height: 20.0),
                    Image.asset('imgs/logoa.png'),
                    SizedBox(height: 20.0),
                    Text(
                      'Sail with Safety',
                      style: TextStyle(
                        fontFamily: 'Hindsiliguri',
                        fontSize: 24.0,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    FlatButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => registration()));
                      },
                      color: Color(0xFF25386A),
                      textColor: Colors.white,
                      padding:  condition == false ?
                      EdgeInsets.symmetric(vertical: 7.0, horizontal: 87.0):
                      EdgeInsets.symmetric(vertical: 7.0, horizontal: 74.0),

                      child: condition == false ?
                      Text(
                        'রেজিস্ট্রেশন',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontFamily: 'HindSiliguri',
                        ),
                      ) :
                      Text(
                        'Registration',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontFamily: 'HindSiliguri',
                        ),
                      ),

                    ),
                    SizedBox(height: 20.0),
                    FlatButton(
                      onPressed: () {
                        Navigator.push(context,
                            new MaterialPageRoute(builder: (context) => login()));
                      },
                      color: Color(0xFF25386A),
                      textColor: Colors.white,
                      padding:  condition == false ?
                      EdgeInsets.symmetric(vertical: 7.0, horizontal: 106.0):
                      EdgeInsets.symmetric(vertical: 7.0, horizontal: 106.0),

                      child: condition == false ?
                      Text(
                        'লগ ইন',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontFamily: 'HindSiliguri',
                        ),
                      ) :
                      Text(
                        'Log in',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontFamily: 'HindSiliguri',
                        ),
                      ),
                      ),

                    SizedBox(height: 80.0),

                    Text(
                      'Copyright by Dishari',
                      style: TextStyle(
                        color: Color(0xFF25386A),
                        fontSize: 18.0,
                        fontFamily: 'HindSiliguri',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
