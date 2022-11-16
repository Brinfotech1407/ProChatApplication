//*************   © Copyrighted by Thinkcreative_Technologies. An Exclusive item of Envato market. Make sure you have purchased a Regular License OR Extended license for the Source Code from Envato to use this product. See the License Defination attached with source code. *********************

import 'dart:async';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info/device_info.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:photofilters/filters/preset_filters.dart';
import 'package:photofilters/widgets/photo_filter.dart';
import 'package:prochat/Configs/Dbkeys.dart';
import 'package:prochat/Configs/Dbpaths.dart';
import 'package:prochat/Configs/app_constants.dart';
import 'package:prochat/Services/Providers/Observer.dart';
import 'package:prochat/Services/localization/language_constants.dart';
import 'package:prochat/Models/DataModel.dart';
import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ntp/ntp.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'package:prochat/Configs/Enum.dart';
import 'package:share/share.dart';
import 'package:path/path.dart' as p;
import 'package:image/image.dart' as imageLib;

class Prochat {
  static String? getNickname(Map<String, dynamic> user) =>
      user[Dbkeys.aliasName] ?? user[Dbkeys.nickname];

  static void toast(String message) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: fiberchatBlack.withOpacity(0.95),
        textColor: fiberchatWhite);
  }

  static void internetLookUp() async {
    try {
      await InternetAddress.lookup('google.com').catchError((e) {
        Prochat.toast(
            'No internet connection. Please check your Internet Connection.');
      });
    } catch (err) {
      Prochat.toast(
          'No internet connection. Please check your Internet Connection.');
    }
  }

  static void invite(BuildContext context) {
    final observer = Provider.of<Observer>(context, listen: false);
    String multilingualtext = Platform.isIOS
        ? '${getTranslated(context, 'letschat')} $Appname, ${getTranslated(context, 'joinme')} - ${observer.iosapplink}'
        : '${getTranslated(context, 'letschat')} $Appname, ${getTranslated(context, 'joinme')} -  ${observer.androidapplink}';
    Share.share(observer.isCustomAppShareLink == true
        ? (Platform.isAndroid
            ? observer.appShareMessageStringAndroid == ''
                ? multilingualtext
                : observer.appShareMessageStringAndroid
            : Platform.isIOS
                ? observer.appShareMessageStringiOS == ''
                    ? multilingualtext
                    : observer.appShareMessageStringiOS
                : multilingualtext)
        : multilingualtext);
  }

  static Widget avatar(Map<String, dynamic>? user,
      {File? image, double radius = 22.5, String? predefinedinitials}) {
    if (image == null) {
      if (user![Dbkeys.aliasAvatar] == null)
        return (user[Dbkeys.photoUrl] ?? '').isNotEmpty
            ? CircleAvatar(
                backgroundColor: Colors.grey[200],
                backgroundImage:
                    CachedNetworkImageProvider(user[Dbkeys.photoUrl]),
                radius: radius)
            : CircleAvatar(
                backgroundColor: fiberchatgreen,
                foregroundColor: Colors.white,
                child: Text(predefinedinitials ??
                    getInitials(Prochat.getNickname(user)!)),
                radius: radius,
              );
      return CircleAvatar(
        backgroundImage: Image.file(File(user[Dbkeys.aliasAvatar])).image,
        radius: radius,
      );
    }
    return CircleAvatar(
        backgroundImage: Image.file(image).image, radius: radius);
  }

  static Future<int> getNTPOffset() {
    return NTP.getNtpOffset();
  }

  static Widget getNTPWrappedWidget(Widget child) {
    return FutureBuilder(
        future: NTP.getNtpOffset(),
        builder: (context, AsyncSnapshot<int> snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            if (snapshot.data! > Duration(minutes: 1).inMilliseconds ||
                snapshot.data! < -Duration(minutes: 1).inMilliseconds)
              return Material(
                  color: fiberchatBlack,
                  child: Center(
                      child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30.0),
                          child: Text(
                            getTranslated(context, 'clocktime'),
                            style:
                                TextStyle(color: fiberchatWhite, fontSize: 18),
                          ))));
          }
          return child;
        });
  }

  getFilterImage(
    BuildContext context, {
    required File imageFileSelected,
    required Function(File file) onUpdatedImage,
  }) async {
    String fileName = '';
    File imageFile;
    imageFile = imageFileSelected;
    fileName = imageFileSelected.path;
    var image = imageLib.decodeImage(imageFileSelected.readAsBytesSync());
    fileName = p.basename(imageFile.path);
    image = imageLib.copyResize(image!, width: 600);
    Map? mapUpdatedFile = await Navigator.push(
      context,
      new MaterialPageRoute(
        builder: (context) => new PhotoFilterSelector(
          title: Text("Photo Filter"),
          image: image!,
          filters: presetFiltersList,
          filename: fileName,
          appBarColor: DESIGN_TYPE == Themetype.whatsapp
              ? fiberchatDeepBlue
              : fiberchatWhite,
          loader: Center(child: CircularProgressIndicator()),
          fit: BoxFit.contain,
        ),
      ),
    );


    if (mapUpdatedFile!=null && mapUpdatedFile.containsKey('image_filtered')) {
      onUpdatedImage(mapUpdatedFile['image_filtered']);
    }
  }

  static void showRationale(rationale) async {
    Prochat.toast(rationale);
    // await Future.delayed(Duration(seconds: 2));
    // Fiberchat.toast(
    //     'If you change your mind, you can grant the permission through App Settings > Permissions');
  }

  static Future<bool> checkAndRequestPermission(Permission permission) {
    Completer<bool> completer = new Completer<bool>();
    permission.request().then((status) {
      if (status != PermissionStatus.granted) {
        permission.request().then((_status) {
          bool granted = _status == PermissionStatus.granted;
          completer.complete(granted);
        });
      } else
        completer.complete(true);
    });
    return completer.future;
  }

  static String getInitials(String name) {
    try {
      List<String> names = name
          .trim()
          .replaceAll(new RegExp(r'[\W]'), '')
          .toUpperCase()
          .split(' ');
      names.retainWhere((s) => s.trim().isNotEmpty);
      if (names.length >= 2)
        return names.elementAt(0)[0] + names.elementAt(1)[0];
      else if (names.elementAt(0).length >= 2)
        return names.elementAt(0).substring(0, 2);
      else
        return names.elementAt(0)[0];
    } catch (e) {
      return '?';
    }
  }

  static String getChatId(String? currentUserNo, String? peerNo) {
    if (currentUserNo.hashCode <= peerNo.hashCode)
      return '$currentUserNo-$peerNo';
    return '$peerNo-$currentUserNo';
  }

  static AuthenticationType getAuthenticationType(
      bool biometricEnabled, DataModel? model) {
    if (biometricEnabled && model?.currentUser != null) {
      return AuthenticationType
          .values[model!.currentUser![Dbkeys.authenticationType]];
    }
    return AuthenticationType.passcode;
  }

  static ChatStatus getChatStatus(int index) => ChatStatus.values[index];

  static String normalizePhone(String phone) =>
      phone.replaceAll(new RegExp(r"\s+\b|\b\s"), "");

  static String getHashedAnswer(String answer) {
    answer = answer.toLowerCase().replaceAll(new RegExp(r"[^a-z0-9]"), "");
    var bytes = utf8.encode(answer); // data being hashed
    Digest digest = sha1.convert(bytes);
    return digest.toString();
  }

  static String getHashedString(String str) {
    var bytes = utf8.encode(str); // data being hashed
    Digest digest = sha1.convert(bytes);
    return digest.toString();
  }

  static Future<String> getDeviceID() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid == true) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return androidInfo.id + androidInfo.androidId;
    } else {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      return iosInfo.systemName + iosInfo.model + iosInfo.systemVersion;
    }
  }

  static subscribeToNotification(
      String currentUserNo, bool isFreshNewAccount) async {
    await FirebaseMessaging.instance
        .subscribeToTopic(
            '${currentUserNo.replaceFirst(new RegExp(r'\+'), '')}')
        .catchError((err) {
      print('ERROR SUBSCRIBING NOTIFICATION' + err.toString());
    });
    await FirebaseMessaging.instance
        .subscribeToTopic(Dbkeys.topicUSERS)
        .catchError((err) {
      print('ERROR SUBSCRIBING NOTIFICATION' + err.toString());
    });
    await FirebaseMessaging.instance
        .subscribeToTopic(Platform.isAndroid
            ? Dbkeys.topicUSERSandroid
            : Platform.isIOS
                ? Dbkeys.topicUSERSios
                : Dbkeys.topicUSERSweb)
        .catchError((err) {
      print('ERROR SUBSCRIBING NOTIFICATION' + err.toString());
    });

    if (isFreshNewAccount == false) {
      await FirebaseFirestore.instance
          .collection(DbPaths.collectiongroups)
          .where(Dbkeys.groupMEMBERSLIST, arrayContains: currentUserNo)
          .get()
          .then((query) async {
        if (query.docs.length > 0) {
          query.docs.forEach((doc) async {
            if (doc.data().containsKey(Dbkeys.groupMUTEDMEMBERS)) {
              if (doc[Dbkeys.groupMUTEDMEMBERS].contains(currentUserNo)) {
              } else {
                await FirebaseMessaging.instance
                    .subscribeToTopic(
                        "GROUP${doc[Dbkeys.groupID].replaceAll(RegExp('-'), '').substring(1, doc[Dbkeys.groupID].replaceAll(RegExp('-'), '').toString().length)}")
                    .catchError((err) {
                  print('ERROR SUBSCRIBING NOTIFICATION' + err.toString());
                });
              }
            } else {
              await FirebaseMessaging.instance
                  .subscribeToTopic(
                      "GROUP${doc[Dbkeys.groupID].replaceAll(RegExp('-'), '').substring(1, doc[Dbkeys.groupID].replaceAll(RegExp('-'), '').toString().length)}")
                  .catchError((err) {
                print('ERROR SUBSCRIBING NOTIFICATION' + err.toString());
              });
            }
          });
        }
      });
    }
  }
}
