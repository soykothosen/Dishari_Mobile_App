import 'package:dishariapp/team.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:core';



class operation extends StatefulWidget {

  final String name;
  final String token;
  final String number;

  operation({@required this.name, @required this.token, @required this.number});



  @override
  _operationState createState() => _operationState();
}

class _operationState extends State<operation> {
  bool condition = true ;
  int i = 0,k=0;
  bool rescue = false;
  int load = 0;



  myLocation() async {


    try {
      Position position = await Geolocator().getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      final double lat = position.latitude;
      final double lng = position.longitude;


      print(lat);
      print(lng);
    } catch(e){
      print(e);

    }





  }









  @override
  Widget build(BuildContext context) {

    String name = widget.name;
    String token = widget.token;
    String number = widget.number;

    print('$token');

    Timer interval(Duration duration, func) {
      Timer function() {
        Timer timer = new Timer(duration, function);

        func(timer);

        return timer;
      }

      return new Timer(duration, function);
    }

    @override
    void State() {
      //super.initState();
      int k = 0;

      interval(new Duration(seconds: 40), (timer) async {
        print(k++);

        print('$token');

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



        //if (i > 5) timer.cancel();
      });
    }

    State();


    return MaterialApp(
      home: Scaffold(
        //backgroundColor: Color(0xFFD5FAFD),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 15.0),
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
              SizedBox(height: 50.0),
              Container(
                child: Center(
                  child: Icon(
                    Icons.person,
                    color: Color(0xFF25386A),
                    size: 50.0,
                  ),
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(color: Colors.black38,),
                ),
                width: 75.0,
                height: 75.0,
              ),
              SizedBox(height: 10.0),
              Text(
                '$name',
                style: TextStyle(
                  fontFamily: 'Hindsiliguri',
                  fontSize: 20.0,
                ),
              ),
              SizedBox(height: 5.0),
              Text(
                '$number',
                style: TextStyle(
                  fontFamily: 'Hindsiliguri',
                  fontSize: 20.0,
                ),
              ),
              SizedBox(height: 20.0),
              FlatButton(
                onPressed: () async {

                  setState(() {
                    load = 1;
                  });

                  if(rescue == true){

                    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

                    final double lat = position.latitude;
                    final double lng = position.longitude;

                    print(lat);
                    print(lng);

                    final url = "http://dishari-codestudio.herokuapp.com/api/v1/boat/help/off/";
                    final payload = {"token": token, "lat": lat.toString() , "lng": lng.toString()};
                    final response = await http.post(url, body: payload);
                    print(response.statusCode);
                    print (response.body);

                    String outPut2 = response.body;
                    String msg2 = json.decode(outPut2)['msg'];

                    if(response.statusCode != 201){

                      setState(() {
                        load = 0;
                      });

                    }

                    setState(() {

                      rescue = false;
                    });

                  } else {

                    Position position = await Geolocator().getCurrentPosition(
                        desiredAccuracy: LocationAccuracy.high);

                    final double lat = position.latitude;
                    final double lng = position.longitude;


                print(lat);
                print(lng);

                    final url = "http://dishari-codestudio.herokuapp.com/api/v1/boat/help/on/";
                    final payload = {"token": token, "lat": lat.toString(), "lng": lng.toString()};
                    final response = await http.post(url, body: payload);
                    print(response.statusCode);
                    print (response.body);

                    String outPut2 = response.body;
                    String msg2 = json.decode(outPut2)['msg'];

                    if(response.statusCode != 201){

                      setState(() {
                        load = 0;
                      });

                    }

                    if(msg2 == "Help alert sent."){

                      setState(() {

                        rescue = true;
                      });

                    }

                  }

                  //myLocation();



                },
                child: (rescue == false)
                    ? Container(
                        child: Center(
                          child: Center(
                            child: condition == false ?
                            Column(
                              children: [

                                SizedBox(height: 25.0,),
                                Image.asset('imgs/d1.png'),
                                Text(
                                  'বিপদ সংকেত পাঠান',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontFamily: 'HindSiliguri',
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ):
                            Center(
                              child: Column(
                                children: [
                                  SizedBox(height: 25.0,),
                                  Image.asset('imgs/d1.png'),
                                  Text(
                                    'I am in danger',
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontFamily: 'HindSiliguri',
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFB71C1C),
                        ),
                        width: 175.0,
                        height: 175.0,
                      )
                    : Container(
                        child: Center(
                          child: condition == false ?
                          Text(
                            'সংকেত পাঠানো হয়েছে',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontFamily: 'HindSiliguri',
                              color: Colors.white,
                            ),
                          ):
                          Text(
                            'Done',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontFamily: 'HindSiliguri',
                              color: Colors.white,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF1B5E20),
                        ),
                        width: 175.0,
                        height: 175.0,
                      ),
              ),
              SizedBox(height: 50.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlatButton(
                      onPressed: () async {

                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => team()));



                      },
                      color: Color(0xFF25386A),
                      textColor: Colors.white,
                      padding: condition == false ?
                      EdgeInsets.symmetric(vertical: 7.0, horizontal: 55.0):
                      EdgeInsets.symmetric(vertical: 7.0, horizontal: 35.0),
                      child: condition == false ?
                      Text(
                        'টিম',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontFamily: 'HindSiliguri',
                        ),
                      ):
                      Text(
                        'Team',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontFamily: 'HindSiliguri',
                        ),
                      )
                  ),
                  FlatButton(
                      onPressed: () async {

                        setState(() {
                          load = 1;
                        });


                        final url = "http://dishari-codestudio.herokuapp.com/api/v1/boat/logout/";
                        final payload = {"token":token};
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

                          Navigator.pop(context);

                          //Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context)=> Home()));

                        }


                      },
                      color: Color(0xFF25386A),
                      textColor: Colors.white,
                      padding: condition == false ?
                      EdgeInsets.symmetric(vertical: 7.0, horizontal: 30.0):
                      EdgeInsets.symmetric(vertical: 7.0, horizontal: 32.0),
                      child: condition == false ?
                      Text(
                        'লগ আউট',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontFamily: 'HindSiliguri',
                        ),
                      ):
                      Text(
                        'Log out',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontFamily: 'HindSiliguri',
                        ),
                      )
                  ),
                ],
              ),
              SizedBox(height: 5.0),
              load == 1 ?
              SpinKitFadingCircle(
                color: Color(0xFF25386A),
                size: 50.0,
              ):
              SizedBox(height: 5.0),
              SizedBox(height: 60.0),
            ],
          ),
        ),
      ),
    );
  }
}
