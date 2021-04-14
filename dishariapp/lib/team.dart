import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';




class team extends StatefulWidget {



  @override
  _teamState createState() => _teamState();
}

class _teamState extends State<team> {


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
              image: AssetImage('imgs/2.png'),
              fit: BoxFit.cover,
            ),),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //SizedBox(height: 5.0),
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


              SizedBox(height: 55.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(width: 5.0),
                  Column(
                    children: [Text(
                      '“ Work hard until you will\nget the desire things ”',
                      style: TextStyle(
                        fontFamily: 'Hindsiliguri',
                        fontSize: 20.0,
                        //decoration: TextDecoration.underline,
                      ),
                    ),Text(
                      'Abu Ismail Siddique | CEO',
                      style: TextStyle(
                        fontFamily: 'Hindsiliguri',
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),],
                  ),
                  Image.asset('imgs/t1.png'),
                  SizedBox(width: 5.0),
                ],
              ),



              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(width: 5.0),
                  Image.asset('imgs/t3.png'),
                  Column(
                    children: [Text(
                      '“ It is better to fail on your\nown than to imitate others ”',
                      style: TextStyle(
                        fontFamily: 'Hindsiliguri',
                        fontSize: 20.0,
                        //decoration: TextDecoration.underline,
                      ),
                    ),Text(
                      'Oishi Jyoti | CFO',
                      style: TextStyle(
                        fontFamily: 'Hindsiliguri',
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),],
                  ),

                  SizedBox(width: 5.0),
                ],
              ),

              SizedBox(height: 200.0),


            ],
          ),
        ),
      ),
    );
  }
}
