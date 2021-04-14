import 'package:dishariapp/login.dart';
import 'alert.dart';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class registration extends StatefulWidget {
  @override
  _registrationState createState() => _registrationState();
}



class _registrationState extends State<registration> {
  bool condition = true;
  int i = 0;
  int load = 0;

  final TextEditingController name1 = TextEditingController();

  final TextEditingController mobilenumber = TextEditingController();

  final TextEditingController nidnumber = TextEditingController();

  final TextEditingController pinnumber = TextEditingController();

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
          child: Center(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              children: <Widget>[
                SizedBox(height: 5.0),
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
                SizedBox(height: 25.0),
                Container(
                  alignment: Alignment.center,
                  child: condition == false
                      ? Text(
                          'আপনার নাম লিখুন',
                          style: TextStyle(
                            fontFamily: 'Hindsiliguri',
                            fontSize: 24.0,
                          ),
                        )
                      : Text(
                          'Write your name',
                          style: TextStyle(
                            fontFamily: 'Hindsiliguri',
                            fontSize: 24.0,
                          ),
                        ),
                ),
                SizedBox(height: 5.0),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 35.0),
                  child: TextField(
                    controller: name1,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white10,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                    ),
                  ),
                ),
                SizedBox(height: 5.0),
                Container(
                  alignment: Alignment.center,
                  child: condition == false
                      ? Text(
                          'আপনার  মোবাইল নাম্বার লিখুন',
                          style: TextStyle(
                            fontFamily: 'Hindsiliguri',
                            fontSize: 24.0,
                          ),
                        )
                      : Text(
                          'Write your mobile number',
                          style: TextStyle(
                            fontFamily: 'Hindsiliguri',
                            fontSize: 24.0,
                          ),
                        ),
                ),
                SizedBox(height: 5.0),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 35.0),
                  child: TextField(
                    controller: mobilenumber,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white10,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                    ),
                  ),
                ),
                SizedBox(height: 5.0),
                Container(
                  alignment: Alignment.center,
                  child: condition == false
                      ? Text(
                          'আপনার NID নাম্বার লিখুন',
                          style: TextStyle(
                            fontFamily: 'Hindsiliguri',
                            fontSize: 24.0,
                          ),
                        )
                      : Text(
                          'Write your NID number',
                          style: TextStyle(
                            fontFamily: 'Hindsiliguri',
                            fontSize: 24.0,
                          ),
                        ),
                ),
                SizedBox(height: 5.0),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 35.0),
                  child: TextField(
                    controller: nidnumber,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white10,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                    ),
                  ),
                ),
                SizedBox(height: 5.0),
                Container(
                  alignment: Alignment.center,
                  child: condition == false
                      ? Text(
                          'আপনার ৪ ডিজিটের পিন নাম্বার লিখুন',
                          style: TextStyle(
                            fontFamily: 'Hindsiliguri',
                            fontSize: 24.0,
                          ),
                        )
                      : Text(
                          'Write your 4 digit PIN number',
                          style: TextStyle(
                            fontFamily: 'Hindsiliguri',
                            fontSize: 24.0,
                          ),
                        ),
                ),
                SizedBox(height: 5.0),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 35.0),
                  child: TextField(
                    controller: pinnumber,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white10,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                    ),
                  ),
                ),
                SizedBox(height: 5.0),
                SizedBox(height: 10.0),
                SizedBox(height: 10.0),
                Container(
                  alignment: Alignment.center,
                  child: FlatButton(
                    onPressed: () async {

                      setState(() {
                        load = 1;
                      });

                      final String name = name1.text;
                      final String phone = mobilenumber.text;
                      final String nid = nidnumber.text;
                      final String pin = pinnumber.text;

// Sending a POST request
                      final url =
                          "http://dishari-codestudio.herokuapp.com/api/v1/boat/reg/";
                      final payload = {
                        "name": name,
                        "phone": phone,
                        "nid": nid,
                        "pin": pin
                      };

                      final response = await http.post(url, body: payload);
                      print(response.statusCode);
                      print(response.body);

                      String outPut = response.body;

                      String msg = json.decode(outPut)['msg'];

                      print(msg);

                      if (response.statusCode == 201) {
                        Navigator.pushReplacement(context,
                            new MaterialPageRoute(builder: (context) => login()));
                      } else {
                        String title = condition == false ? 'দুঃখিত, রেজিস্ট্রেশন সম্পন্ন হয় নি': 'Sorry, registration is not complete';
                        String actionText = condition == false ? 'আবার চেষ্টা করুন': 'Try again';

                        if (msg ==
                            'Boat name must be at least 2 characters long.') {
                          setState(() {
                            load = 0;
                          });
                          showMyDialog(context, title, condition == false ? 'নাম ভালোভাবে লিখুন': 'Write your name',actionText);
                        } else if (msg == 'NID can only be numeric') {
                          setState(() {
                            load = 0;
                          });
                          showMyDialog(context, title, condition == false ?'NID নাম্বার ভুল করেছেন': 'NID Number is incorrect',actionText);
                        } else if (msg == 'Invalid Phone Number.') {
                          setState(() {
                            load = 0;
                          });
                          showMyDialog(
                              context, title, condition == false ? 'মোবাইল নাম্বার ভুল হয়েছে': 'Mobile Number is incorrect',actionText);
                        } else if (msg == 'Pin can only be numeric') {
                          setState(() {
                            load = 0;
                          });
                          showMyDialog(
                              context, title, condition == false ?'পিন নাম্বার সংখ্যায় লিখুন':'Write pin number in numeric',actionText);
                        } else if (msg == 'Pin must be 4 characters long.') {
                          setState(() {
                            load = 0;
                          });
                          showMyDialog(
                              context, title, condition == false ?'পিন নাম্বার ৪ ডিজিটের হবে': 'PIN number must be 4 digit',actionText);
                        } else if (msg == 'Phone number already exists.') {
                          setState(() {
                            load = 0;
                          });
                          showMyDialog(
                              context, title, condition == false ? 'এই নাম্বার দিয়ে একাউন্ট খোলা আছে': 'Phone number is already exist',actionText);
                        } else {
                          setState(() {
                            load = 0;
                          });
                          showMyDialog(context, title,condition == false ? 'কিছু ভুল হয়েছে':'Something went wrong',actionText);
                        }
                      }
                    },
                    color: Color(0xFF25386A),
                    textColor: Colors.white,
                    padding: condition == false
                        ? EdgeInsets.symmetric(vertical: 7.0, horizontal: 87.0)
                        : EdgeInsets.symmetric(vertical: 7.0, horizontal: 74.0),
                    child: condition == false
                        ? Text(
                            'রেজিস্ট্রেশন',
                            style: TextStyle(
                              fontSize: 24.0,
                              fontFamily: 'HindSiliguri',
                            ),
                          )
                        : Text(
                            'Registration',
                            style: TextStyle(
                              fontSize: 24.0,
                              fontFamily: 'HindSiliguri',
                            ),
                          ),
                  ),
                ),
                load == 1 ?
                SpinKitFadingCircle(
                  color: Color(0xFF25386A),
                  size: 50.0,
                ):
              SizedBox(height: 5.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
