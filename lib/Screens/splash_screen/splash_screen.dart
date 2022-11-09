//*************   © Copyrighted by Thinkcreative_Technologies. An Exclusive item of Envato market. Make sure you have purchased a Regular License OR Extended license for the Source Code from Envato to use this product. See the License Defination attached with source code. *********************

import 'package:flutter/material.dart';
import 'package:prochat/Configs/app_constants.dart';

class Splashscreen extends StatelessWidget {
  final bool? isShowOnlySpinner;

  Splashscreen({this.isShowOnlySpinner = false});

  @override
  Widget build(BuildContext context) {
    return IsSplashOnlySolidColor == true || this.isShowOnlySpinner == true
        ? Scaffold(
            backgroundColor: SplashBackgroundSolidColor,
            body: Center(
              child: CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation<Color>(fiberchatLightBlue)),
            ))
        : Scaffold(
            backgroundColor: fiberchatBlue,
            body: Center(
              child: Text(
                'Prochat',
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
  }
}
