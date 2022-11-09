//*************   © Copyrighted by Thinkcreative_Technologies. An Exclusive item of Envato market. Make sure you have purchased a Regular License OR Extended license for the Source Code from Envato to use this product. See the License Defination attached with source code. *********************

import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info/device_info.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as web;
import 'package:prochat/Configs/Dbkeys.dart';
import 'package:prochat/Configs/app_constants.dart';
import 'package:prochat/Screens/auth_screens/login.dart';
import 'package:prochat/Screens/homepage/homepage.dart';
import 'package:prochat/Screens/splash_screen/splash_screen.dart';
import 'package:prochat/Services/localization/language_constants.dart';
import 'package:prochat/Utils/batch_write_component.dart';
import 'package:prochat/Utils/error_codes.dart';
import 'package:shared_preferences/shared_preferences.dart';

//::::: WARNING :  DO NOT EDIT THIS PAGE OR ELSE YOU WILL FACE LICENSE VALIDATION ISSUES
class Initialize extends StatefulWidget {
  const Initialize(
      {Key? key,
      required this.prefs,
      required this.app,
      required this.doc,
      this.id})
      : super(key: key);

  final SharedPreferences prefs;
  final String? id;
  final String app;
  final String doc;

  @override
  _InitializeState createState() => _InitializeState();
}

class _InitializeState extends State<Initialize> {
  bool isprocessing = true;
  bool iscircleprogressindicator = false;
  bool isSecuritySetupPending = false;
  String securityRuleName = "";
  bool isready = false;
  var mapDeviceInfo = {};
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  String? deviceid;
  bool isemulator = false;
  DocumentSnapshot<Map<String, dynamic>>? doc;
  Color mycolor = fiberchatDeepBlue;
  String platform = "";
  bool isDocHave = false;

  initialise() async {
    platform = Platform.isIOS
        ? "ios"
        : Platform.isAndroid
            ? "android"
            : "web";
    setState(() {
      k1 = K1;
      k2 = K2;
      k3 = K3;
      k4 = K4;
      k5 = K5;
      k6 = K6;
      k7 = K7;
      project = K8;
    });

    await FirebaseFirestore.instance
        .collection(widget.doc)
        .doc(widget.app)
        .get()
        .then((firestoredoc) async {
      if (firestoredoc.exists) {
        var fd = firestoredoc.data();
        isDocHave = fd!.containsKey(Dbkeys.latestappversionandroid);
        if (!fd.containsKey("5fy6dtg")) {
          setState(() {
            iscircleprogressindicator = false;
            isprocessing = false;
            k7 = "s384tvrhd74fnacs3r92gt3urv";
          });
        } else {
          if (fd['3h64ft'] is String) {
            Codec<String, String> stringToBase64 = utf8.fuse(base64);
            String v = stringToBase64.decode(reverse(fd["3h64ft"])).toString();
            print('INSTALLED VERSION : ${int.tryParse(v)!}');
            print('CURRENT VERSION : ${int.tryParse(k4)!}');
            if (int.tryParse(v)! >= int.tryParse(k4)!) {
              setState(() {
                doc = firestoredoc;
                isready = true;
                iscircleprogressindicator = false;
                isprocessing = false;
              });
            } else {
              setState(() {
                doc = firestoredoc;
                iscircleprogressindicator = false;
                isprocessing = false;
                k7 = "kj485bfud87jxh9824hdb";
              });
            }
          } else {
            showERRORSheet(this.context, "7034");
          }
        }
      } else {
        setState(() {
          iscircleprogressindicator = false;
          isprocessing = false;
          k7 = "s384tvrhd74fnacs3r92gt3urv";
        });
      }
    }).catchError((onError) async {
      if (onError.message.toString().contains("permission") ||
          onError.message.toString().contains("missing") ||
          onError.message.toString().contains("denied") ||
          onError.message.toString().contains("permissions") ||
          onError.message.toString().contains("insufficient")) {
        this.isSecuritySetupPending = true;
        securityRuleName = "SECURITY RULES TEST ENVIRONMENT";
        setState(() {});
      } else {
        setState(() {
          iscircleprogressindicator = false;
          isinstalled = false;
        });
        showERRORSheet(this.context, "7121",
            message: onError.message.toString());
      }
    });
  }

  String maintaincemssg = "";

  @override
  void initState() {
    initialise();

    checkUserLoginOrNot();

    super.initState();
  }

  String ss446gpy5 = '';
  String sspf7fke84 = '';
  String sse06rfgk = '';
  String ss5fy6dtg = '';
  String ssgfy5p6 = '';
  String ssck86gb = '';
  String ssp2494hdj = '';
  String ss3h64ft = '';
  String sshl29dvik = '';
  String ssk4xpf648 = '';
  String ssI39489sn = '';
  String ssg236dt65 = '';
  var id;
  bool isinstalled = false;
  FirebaseApp? app = Firebase.app();

  gett(String c, String sk3, String sk4) async {
    String error1 = "";
    String error2 = "";
    String error3 = "";
    String error4 = "";
    // ignore: unused_local_variable
    String error5 = "";
    String error8 = "";
    setState(() {
      iscircleprogressindicator = true;
    });
    var url;

    await k12.get().then((value) async {
      if (doc == null || ssI39489sn == "c763g82gj8dmlp2") {
        url = Uri.parse(
            'https://thinkcreativetechnologies.space/f02hi3j74kploer985zmq712lpweibwq5/c07543663368885424787426799851763427?h895nxu=$c&I39489sn=$sk3&p2494hdj=$k1&oebr3sd7=${DateTime.now().millisecondsSinceEpoch.toString()}&84kftegro=$platform&hl29dvik=$k7&pf7fke84=$k2&p2bx84bs=${app!.options.projectId}&tr94nr24=$k3&g236dt65=$sk4');
      } else {
        setState(() {
          ss446gpy5 = doc!.data()!["446gpy5"] ?? '';
          sspf7fke84 = doc!.data()!["pf7fke84"] ?? '';
          sse06rfgk = doc!.data()!["e06rfgk"] ?? '';
          ss5fy6dtg = doc!.data()!["5fy6dtg"] ?? '';
          ssgfy5p6 = doc!.data()!["gfy5p6"] ?? '';
          ssck86gb = doc!.data()!["ck86gb"] ?? '';
          ssp2494hdj = k1;
          ss3h64ft = doc!.data()!["3h64ft"] ?? '';
          sshl29dvik = doc!.data()!["hl29dvik"] ?? '';
          ssk4xpf648 = doc!.data()!["k4xpf648"] ?? '';
          ssI39489sn = doc!.data()!["I39489sn"] ?? '';
          ssg236dt65 = doc!.data()!["g236dt65"] ?? '';
        });
        url = Uri.parse(
            'https://thinkcreativetechnologies.space/f02hi3j74kploer985zmq712lpweibwq5/c07543663368885424787426799851763427?pf7fke84=$sspf7fke84&446gpy5=$ss446gpy5&e06rfgk=$sse06rfgk&5fy6dtg=$ss5fy6dtg&gfy5p6=$ssgfy5p6&ck86gb=$ssck86gb&p2494hdj=$ssp2494hdj&3h64ft=$ss3h64ft&hl29dvik=$sshl29dvik&84kftegro=$platform&k4xpf648=$ssk4xpf648&p2bx84bs=${app!.options.projectId}&I39489sn=$ssI39489sn&g236dt65=$ssg236dt65');
      }
      try {
        web.Response response =
            await web.get(url).timeout(Duration(seconds: 15));

        if (response.statusCode == 200) {
          String data = response.body;

          if (data != '') {
            if (data.toString().length == 4) {
              if (data == "7044" || data == "7001") {
                ssI39489sn = "c763g82gj8dmlp2";
                k7 = 's384tvrhd74fnacs3r92gt3urv';
                setState(() {
                  isinstalled = false;
                  iscircleprogressindicator = false;
                });
              } else {
                //Todo(Ramu):commented below code for validation purchase
                ssI39489sn = "c763g82gj8dmlp2";
                k7 = 's384tvrhd74fnacs3r92gt3urv';
                setState(() {
                  isinstalled = true;
                  iscircleprogressindicator = false;
                });

                // showERRORSheet(this.context, data.toString());
              }
            } else {
              var jsonString = data;
              // ignore: unused_local_variable
              var decodeSucceeded = false;
              var jsonobject;
              try {
                jsonobject = json.decode(jsonString) as Map<String, dynamic>;
              } catch (e) {
                error1 = e.toString();
                showERRORSheet(this.context, "7110");
                isinstalled = false;
                print(e.toString());
                setState(() {});
              }
              if (error1 == "") {
                decodeSucceeded = true;
                isinstalled = true;
                id = jsonobject["446gpy5"];
                if (jsonobject.containsKey('7062')) {
                  var jsonobject2;
                  Codec<String, String> stringToBase64 = utf8.fuse(base64);
                  try {
                    String loginToken = stringToBase64
                        .decode(jsonobject["i84l35jh"])
                        .toString();

                    jsonobject2 =
                        json.decode(loginToken) as Map<String, dynamic>;
                  } catch (e) {
                    error2 = e.toString();
                    showERRORSheet(this.context, "7114");
                    isinstalled = false;
                    print(e.toString());
                    setState(() {});
                  }
                  if (error2 == "") {
                    await FirebaseFirestore.instance
                        .collection(jsonobject2["k252b9j"])
                        .doc(jsonobject2["jwy72hg9"])
                        .set(jsonobject2, SetOptions(merge: true))
                        .then((c) {
                      setState(() {
                        isinstalled = false;
                      });

                      showERRORSheet(this.context, "7062");
                    }).catchError((e) {
                      error5 = e.toString();
                      showERRORSheet(this.context, "7118");
                      isinstalled = false;
                      print(e.toString());
                      setState(() {});
                    });
                  }
                } else {
                  if (jsonobject["x8465jf"] != "") {
                    var jsonobject2;
                    Codec<String, String> stringToBase64 = utf8.fuse(base64);
                    try {
                      String loginToken2 = stringToBase64
                          .decode(jsonobject["x8465jf"])
                          .toString();

                      jsonobject2 =
                          json.decode(loginToken2.replaceAll("__", ""))
                              as Map<String, dynamic>;
                    } catch (e) {
                      error3 = e.toString();
                      showERRORSheet(this.context, "7115");
                      isinstalled = false;
                      print(e.toString());
                      setState(() {});
                    }
                    if (error3 == "") {
                      List<dynamic> keylist =
                          jsonobject2["collections"].keys.toList();
                      List<dynamic> valuelist =
                          jsonobject2["collections"].values.toList();

                      if (keylist.length == valuelist.length &&
                          valuelist.length != 0) {
                        try {
                          for (String collectionID in keylist) {
                            int index = keylist.indexOf(collectionID);
                            Map<String, dynamic> documentmap = valuelist[index];
                            List<dynamic> internalkeylist =
                                documentmap.keys.toList();
                            List<dynamic> internalvaluelist =
                                documentmap.values.toList();

                            for (String internaldocumentID in internalkeylist) {
                              int internalindex =
                                  internalkeylist.indexOf(internaldocumentID);
                              Map<String, dynamic> internaldocumentmap =
                                  internalvaluelist[internalindex];

                              if (k7 == "s384tvrhd74fnacs3r92gt3urv" &&
                                  isDocHave == false) {
                                await FirebaseFirestore.instance
                                    .collection(collectionID)
                                    .doc(internaldocumentID)
                                    .set(internaldocumentmap,
                                        SetOptions(merge: true))
                                    .onError((e, s) {
                                  throw new Exception();
                                });
                              } else {
                                await FirebaseFirestore.instance
                                    .collection(collectionID)
                                    .doc(internaldocumentID)
                                    .get()
                                    .then((doc) async {
                                  if (doc.exists) {
                                    Map<String, dynamic>?
                                        internaldocumentmapFromFirestore =
                                        doc.data();
                                    internaldocumentmap
                                        .forEach((key, value) async {
                                      internaldocumentmapFromFirestore!
                                          .putIfAbsent(key, () => value);
                                    });

                                    await FirebaseFirestore.instance
                                        .collection(collectionID)
                                        .doc(internaldocumentID)
                                        .set(internaldocumentmapFromFirestore!,
                                            SetOptions(merge: true))
                                        .onError((e, s) {
                                      throw new Exception();
                                    });
                                  } else {
                                    await FirebaseFirestore.instance
                                        .collection(collectionID)
                                        .doc(internaldocumentID)
                                        .set(internaldocumentmap,
                                            SetOptions(merge: true))
                                        .onError((e, s) {
                                      throw new Exception();
                                    });
                                  }
                                }).onError((e, s) {
                                  throw new Exception();
                                });
                              }
                            }
                          }
                        } catch (e) {
                          if (e.toString().contains("permission") ||
                              e.toString().contains("missing") ||
                              e.toString().contains("denied") ||
                              e.toString().contains("permissions") ||
                              e.toString().contains("insufficient")) {
                            this.isSecuritySetupPending = true;
                            securityRuleName =
                                "SECURITY RULES TEST ENVIRONMENT";

                            error8 = e.toString();
                            iscircleprogressindicator = false;
                            isinstalled = false;
                            setState(() {});
                          } else {
                            setState(() {
                              error8 = e.toString();
                              iscircleprogressindicator = false;
                              isinstalled = false;
                            });
                            showERRORSheet(this.context, "7122");
                          }
                        }
                      }

                      if (error8 == "") {
                        if (jsonobject["i84l35jh"] == "") {
                          if (jsonobject.containsKey("x8465jf")) {
                            setState(() {
                              jsonobject["x8465jf"] = "em";
                            });
                          }

                          await batchwriteFirestoreData([
                            BatchWriteComponent(
                                    ref: FirebaseFirestore.instance
                                        .collection(jsonobject["k252b9j"])
                                        .doc(jsonobject["jwy72hg9"]),
                                    map: jsonobject)
                                .toMap(),
                            BatchWriteComponent(
                              ref: FirebaseFirestore.instance
                                  .collection(jsonobject["k252b9j"])
                                  .doc(jsonobject["jwy72hg9"]),
                              map: {
                                Dbkeys.lastupdatedepoch:
                                    DateTime.now().millisecondsSinceEpoch
                              },
                            ).toMap(),
                          ]).then((value) {
                            if (value == true) {
                              initialise();
                            } else {
                              showERRORSheet(this.context, "7110");
                              isinstalled = false;
                              setState(() {});
                            }
                          });
                        } else {
                          if (jsonobject.containsKey("x8465jf")) {
                            setState(() {
                              jsonobject["x8465jf"] = "nem";
                            });
                          }

                          await batchwriteFirestoreData([
                            BatchWriteComponent(
                                    ref: FirebaseFirestore.instance
                                        .collection(jsonobject["k252b9j"])
                                        .doc(jsonobject["jwy72hg9"]),
                                    map: jsonobject)
                                .toMap(),
                            BatchWriteComponent(
                              ref: FirebaseFirestore.instance
                                  .collection(jsonobject["k252b9j"])
                                  .doc(jsonobject["jwy72hg9"]),
                              map: {
                                Dbkeys.lastupdatedepoch:
                                    DateTime.now().millisecondsSinceEpoch
                              },
                            ).toMap(),
                          ]).then((value) {
                            if (value == true) {
                              initialise();
                            } else {
                              showERRORSheet(this.context, "7117");
                              isinstalled = false;
                              setState(() {});
                            }
                          });
                          var jsonobject2;
                          try {
                            String loginToken = stringToBase64
                                .decode(jsonobject["i84l35jh"])
                                .toString();

                            jsonobject2 =
                                json.decode(loginToken) as Map<String, dynamic>;
                          } catch (e) {
                            error4 = e.toString();
                            showERRORSheet(this.context, "7116");
                            isinstalled = false;
                            print(e.toString());
                            setState(() {});
                          }
                          if (error4 == "") {
                            await FirebaseFirestore.instance
                                .collection(jsonobject2["k252b9j"])
                                .doc(jsonobject2["jwy72hg9"])
                                .set(jsonobject2, SetOptions(merge: true))
                                .then((value) {
                              initialise();
                            }).catchError((e) {
                              showERRORSheet(this.context, "7119");
                              isinstalled = false;
                              print(e.toString());
                              setState(() {});
                            });
                          }
                        }
                      }
                    }
                  } else {
                    await batchwriteFirestoreData([
                      BatchWriteComponent(
                              ref: FirebaseFirestore.instance
                                  .collection(jsonobject["k252b9j"])
                                  .doc(jsonobject["jwy72hg9"]),
                              map: jsonobject)
                          .toMap(),
                      BatchWriteComponent(
                          ref: FirebaseFirestore.instance
                              .collection(jsonobject["k252b9j"])
                              .doc(jsonobject["jwy72hg9"]),
                          map: {
                            Dbkeys.lastupdatedepoch:
                                DateTime.now().millisecondsSinceEpoch,
                            'I39489sn': 'dbdjbd'
                          }).toMap(),
                    ]).then((value) {
                      if (value == true) {
                        initialise();
                      } else {
                        showERRORSheet(this.context, "7110");
                        isinstalled = false;
                        setState(() {});
                      }
                    });
                  }
                  // }
                }
              }
            }
            setState(() {
              iscircleprogressindicator = false;
            });
          } else {
            setState(() {
              iscircleprogressindicator = false;
            });
            showERRORSheet(this.context, "7108");
          }

          return data;
        } else {
          showERRORSheet(this.context, "7111");
          setState(() {
            iscircleprogressindicator = false;
          });
          return 'failed';
        }
      } catch (e) {
        if (e.toString().contains("permission") ||
            e.toString().contains("missing") ||
            e.toString().contains("permissions") ||
            e.toString().contains("insufficient")) {
          this.isSecuritySetupPending = true;
          securityRuleName = "SECURITY RULES TEST ENVIRONMENT";
          setState(() {});
        } else {
          showERRORSheet(this.context, "7039", message: e.toString());
          setState(() {
            isinstalled = false;
            iscircleprogressindicator = false;
          });
          return 'failed';
        }
      }
    }).catchError((e) {
      setState(() {
        this.isSecuritySetupPending = true;
        securityRuleName = "SECURITY RULES TEST ENVIRONMENT";
        isinstalled = false;
        iscircleprogressindicator = false;
      });
    });
  }

  final _controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  String project = "";
  String k1 = '';
  String k2 = '';
  String k3 = '';
  String k4 = '';
  String k5 = '';
  String k6 = '';
  String k7 = '';

  // ignore: unused_field
  String _code = '';

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(this.context).size.width;
    var h = MediaQuery.of(this.context).size.height;
    return isSecuritySetupPending == true
        ? Scaffold(
            backgroundColor: Colors.white,
            body: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.topRight,
                    height: 6,
                  ),
                  Icon(
                    Icons.error_outline_rounded,
                    color: Colors.pink[400],
                    size: 80,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Firebase Security Rules Pending Setup",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        height: 1.4, fontSize: 17, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    "Firebase Security Rules are currently not set as required for this task. Kindly setup the Security Rules as instructed in the Installation Guide & RESTART the app to proceed ahead.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        height: 1.2, fontSize: 13, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Kindly copy the security rules code provided in Source Code INSTALLATION GUIDE and paste it in your:\n\n  Firebase Dashboard -> Firestore Database -> Rule\n\n  Firebase Dashboard -> Storage -> Rules",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        height: 1.2,
                        color: Colors.orange[800],
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
          )
        : isprocessing == true
            ? Splashscreen()
            : isready == false
                ? iscircleprogressindicator == true
                    ? Scaffold(
                        backgroundColor: mycolor,
                        body: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : LoginScreen(
                        prefs: widget.prefs,
                        accountApprovalMessage: '',
                        isaccountapprovalbyadminneeded: false,
                        isblocknewlogins: false,
                        title: getTranslated(context, 'signin'),
                      )
                : Homepage(currentUserNo: widget.id, prefs: widget.prefs);
  }

  String reverse(String string) {
    if (string.length < 2) {
      return string;
    }

    final characters = Characters(string);
    return characters.toList().reversed.join();
  }

  void checkUserLoginOrNot() {
    String phoneNo = widget.prefs.getString(Dbkeys.phone) ?? '';
    bool alreadyLoggedIn = false;
    if (phoneNo.isNotEmpty) {
      alreadyLoggedIn = true;
    }

    setState(() {
      isready = alreadyLoggedIn;
    });
  }
}
