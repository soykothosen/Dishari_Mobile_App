import 'package:dishariapp/operation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'alert.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';




class login extends StatefulWidget {

  @override
  _loginState createState() => _loginState();
}



class _loginState extends State<login> {

  bool condition = true ;
  int i = 0;
  int load = 0;
  double lat ;
  double lng ;







 void myLocation() async {


    try {
      Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

      final double lat = position.latitude;
      final double lng = position.longitude;

      print(lat);
      print(lng);
    } catch(e){
      print(e);

    }





  }


  final TextEditingController mobileNumber = TextEditingController();

  final TextEditingController pinNumber = TextEditingController();

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
              padding: const EdgeInsets.symmetric( vertical: 20.0),
              children: [
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
                SizedBox(height: 100.0),
                Center(
                  child: Column(

                    mainAxisAlignment: MainAxisAlignment.center,

                    children: <Widget>[


                      condition == false ?
                      Text(
                        'আপনার  মোবাইল নাম্বার লিখুন',
                        style: TextStyle(
                          fontFamily: 'Hindsiliguri',
                          fontSize: 24.0,
                        ),
                      ):
                      Text(
                        'Write your mobile number',
                        style: TextStyle(
                          fontFamily: 'Hindsiliguri',
                          fontSize: 24.0,
                        ),
                      ),

                      SizedBox(height: 5.0),

                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 35.0),
                        child: TextField(
                          controller: mobileNumber,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white10,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 5.0),

                      condition == false ?
                      Text(
                        'আপনার ৪ ডিজিটের পিন নাম্বার লিখুন',
                        style: TextStyle(
                          fontFamily: 'Hindsiliguri',
                          fontSize: 24.0,
                        ),
                      ):
                      Text(
                        'Write your 4 digit PIN number',
                        style: TextStyle(
                          fontFamily: 'Hindsiliguri',
                          fontSize: 24.0,
                        ),
                      ),

                      SizedBox(height: 5.0),

                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 35.0),
                        child: TextField(
                          controller: pinNumber,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white10,
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 5.0),

                      SizedBox(height: 10.0),

                      SizedBox(height: 10.0),

                      FlatButton(

                        onPressed: () async {

                          setState(() {
                            load = 1;
                          });

//                        if( mobileNumber.text == null || mobileNumber.text.isEmpty ){
//
//                          setState(() {
//                            load = 0;
//                          });
//
//                          showMyDialog(context, 'দুঃখিত, লগইন সম্পন্ন হয় নি' , 'মোবাইল নাম্বার দিন');
//
//                        } else if ( pinNumber.text == null || pinNumber.text.isEmpty ){
//
//                          setState(() {
//                            load = 0;
//                          });
//
//                          showMyDialog(context, 'দুঃখিত, লগইন সম্পন্ন হয় নি' , '৪ ডিজিটের পিন নাম্বার দিন');
//
//                        }else{
//
//                          setState(() {
//                            load = 0;
//                          });
//
//                          showMyDialog(context, 'দুঃখিত, লগইন সম্পন্ন হয় নি' , 'মোবাইল নাম্বার ও ৪ ডিজিটের পিন নাম্বার দিন');
//
//                        }

                          // Sending a POST request
                          final url = "http://dishari-codestudio.herokuapp.com/api/v1/boat/login/";
                          final payload = {"phone":mobileNumber.text, "pin": pinNumber.text};
                          final response = await http.post(url, body: payload);
                          print(response.statusCode);
                          print (response.body);

                          String outPut = response.body;

                          if(response.statusCode != 201){

                            setState(() {
                              load = 0;
                            });

                          }


                          if(response.statusCode == 201){

                            String token = json.decode(outPut)['token'];
                            String name = json.decode(outPut)['data']['name'];
                            String phone = json.decode(outPut)['data']['phone'];
                            print(token);
                            print(name);
                            print(phone);


                            Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

                            final double lat = position.latitude;
                            final double lng = position.longitude;

                            print(lat);
                            print(lng);

                            final url = "http://dishari-codestudio.herokuapp.com/api/v1/boat/location/update/";
                            final payload = {"token": token, "lat":  lat.toString(), "lng": lng.toString()};
                            final response = await http.post(url, body: payload);
                            print(response.statusCode);
                            print (response.body);

                            String outPut1 = response.body;
                            String msg1 = json.decode(outPut1)['msg'];

                            if(msg1 != "Location updated.") {

                            setState(() {
                              load = 0;
                            });
                            String title = condition == false ? 'দুঃখিত, লগ ইন সম্পন্ন হয় নি': 'Sorry, log is not complete';
                            String actionText = condition == false ? 'আবার চেষ্টা করুন': 'Try again';

                            showMyDialog(context, title, condition == false ?'কিছু ভুল হয়েছে':'Something went wrong',actionText);
                          }

                            if(msg1 == "Location updated."){

                              Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context)=> operation(name: name, token: token , number: phone)));

                            }



                          }else{

                            String msg = json.decode(outPut)['msg'];


                            print(msg);
                            String title = condition == false ? 'দুঃখিত, লগ ইন সম্পন্ন হয় নি': 'Sorry, log is not complete';
                            String actionText = condition == false ? 'আবার চেষ্টা করুন': 'Try again';

                            if(msg == 'Phone number does not exist.'){


                              setState(() {
                                load = 0;
                              });

                              showMyDialog(context, title, condition == false ?'এই মোবাইল নাম্বারে কোনো একাউন্ট খোলা নেই':'No Account by this mobile number',actionText);

                            }

                            else if (msg == 'Pin must be 4 characters long.' || msg == 'Pin can only be numeric'){

                              setState(() {
                                load = 0;
                              });
                              showMyDialog(context, title, condition == false ?'আপনি ভুল পাসওয়ার্ড দিয়েছেন':'Password is wrong',actionText);

                            }else {
                              setState(() {
                                load = 0;
                              });
                              showMyDialog(context, title, condition == false ?'কিছু ভুল হয়েছে':'Something went wrong',actionText);
                            }



                          }








                        },

                        color: Color(0xFF25386A),
                        textColor: Colors.white,
                        padding: condition == false ?
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

                      SizedBox(height: 10.0),
                      load == 1 ?
                      SpinKitFadingCircle(
                        color: Color(0xFF25386A),
                        size: 50.0,
                      ):
                      SizedBox(height: 5.0),





                    ],

                  ),
                ),
                SizedBox(height: 150.0),
              ],
            ),
          ),
        ),


      ),


    );
  }
}
