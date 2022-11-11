import 'package:flutter/material.dart';
import 'package:prochat/Configs/app_constants.dart';
import 'package:prochat/Models/multiAccountData.dart';
import 'package:prochat/Screens/homepage/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WaitingScreen extends StatefulWidget {
  final bool? isShowWaitingScreen;
  final MultiAccount arrItem;
  final SharedPreferences prefs;

  const WaitingScreen({this.isShowWaitingScreen = false,
    required this.arrItem,
    required this.prefs,
  });

  @override
  _WaitingScreenState createState() => _WaitingScreenState();
}


class _WaitingScreenState extends State<WaitingScreen> {

  @override
  void initState() {
    super.initState();
    getUserDetailsFromUID(
      uid:widget.arrItem.uid,
      prefs: widget.prefs,
      phoneNo: widget.arrItem.phoneNo,
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fiberchatLightBlue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                'Please wait we are setting up',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),
            ),
        SizedBox(height: 8),
        CircularProgressIndicator(
          color: Colors.white,
        ),
          ],
        ),
      ),
    );
  }
}
