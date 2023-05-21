import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:firebase_core/firebase_core.dart';

import '../components/AppBarConsole/console_appbar.dart';

import '../widgets/ButtonWidget/ButtonWidget.dart';
import '../widgets/console_widgets/joystick_control.dart';

class HomePageCosole extends StatefulWidget {
  @override
  State<HomePageCosole> createState() => _HomePageCosoleState();
}

class _HomePageCosoleState extends State<HomePageCosole> {
  bool booleanValue = false;
  DatabaseReference? _databaseReference;
  void initState() {
    super.initState();
    initializeFirebase();
  }

  // HomePage({super.key});
  void callback(x, y) {
    log('callback x => $x and y $y');
  }
  Future<void> initializeFirebase() async {
    await Firebase.initializeApp();

    _databaseReference = FirebaseDatabase.instance.ref().child('');
  }
  void updateon() {
    _databaseReference!.update({'on': true});
    debugPrint(_databaseReference.toString());
  }

  void updateoff() {
    _databaseReference!.update({'off': true});
    debugPrint(_databaseReference.toString());
  }
  void updateauto() {
    _databaseReference!.update({'auto': true});
    debugPrint(_databaseReference.toString());
  }
  // final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
             // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(flex: 1, child: ConsoleAppBar()),
                Expanded(
                  flex: 9,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          color:  Color.fromARGB(255, 71, 71, 71),
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: Image.asset(
                              "./assets/images/consoleview.jpeg",
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: Colors.amber,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [

                            //SizedBox(height: 100,),
                            ToggleSwitch(
                            minWidth: 60.0,
                            cornerRadius: 20.0,
                            inactiveFgColor: Colors.white,
                              activeBgColors: [
                                [Colors.green],
                                [Colors.red],
                                [Colors.orange]
                              ],
                              icons: [Icons.lightbulb,Icons.lightbulb_outline,Icons.hdr_auto_rounded],
                            initialLabelIndex: null,
                            doubleTapDisable: true, // re-tap active widget to de-activate
                            totalSwitches: 3,
                            labels: ['ON', 'OFF', ''],
                            customTextStyles: [

                              TextStyle(
                                  color: Colors.white,
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.w900),
                              TextStyle(
                                  color: Colors.brown,
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.w900),
                              TextStyle(
                                  color: Colors.black,
                                  fontSize: 10.0,
                                  fontStyle: FontStyle.italic)
                            ],
                            onToggle: (index) {
                                    switch (index) {
                                    case 0:
                                    // Perform function for index 0
                                      updateon();
                                    break;
                                    case 1:
                                    // Perform function for index 1
                                      updateoff();
                                    break;
                                    case 2:
                                   // Perform function for index 2
                                      updateauto();
                                   break;
                                   default:
                                    break;
                                   }
                                    },

                          ),
                                SizedBox(height: 10,),
                                ToggleSwitch(
                                 // changeOnTap: true,

                                  minWidth: 60.0,
                                  cornerRadius: 20.0,
                                  activeBgColors: const [
                                    [Colors.green],
                                    [Colors.red],
                                    [Colors.orange]
                                  ],
                                  icons: [Icons.alarm_on,Icons.alarm_off,Icons.hdr_auto_rounded],
                                  inactiveFgColor: Colors.white,
                                  initialLabelIndex: null,
                                  doubleTapDisable: true, // re-tap active widget to de-activate
                                  totalSwitches: 3,
                                  labels: ['ON', 'OFF', ''],
                                  customTextStyles: [
                                    TextStyle(
                                        color: Colors.white,
                                        fontSize: 10.0,
                                        fontWeight: FontWeight.w900),
                                    TextStyle(
                                        color: Colors.brown,
                                        fontSize: 10.0,
                                        fontWeight: FontWeight.w900),
                                    TextStyle(
                                        color: Colors.black,
                                        fontSize: 10.0,
                                        fontStyle: FontStyle.italic)
                                  ],
                                  onToggle: (index) {
                                    switch (index) {
                                      case 0:
                                      // Perform function for index 0
                                        updateon();
                                        break;
                                      case 1:
                                      // Perform function for index 1
                                        updateoff();
                                        break;
                                      case 2:
                                      // Perform function for index 2
                                        updateauto();
                                        break;
                                      default:
                                        break;
                                    }
                                  },
                                ),
                                SizedBox(height: 10,),
                                ToggleSwitch(
                                  minWidth: 60.0,
                                  cornerRadius: 20.0,
                                  activeBgColors: [
                                  [Colors.green],
                                  [Colors.red],
                                  [Colors.orange]
                                  ],
                                  icons: [Icons.lock,Icons.lock_open,Icons.hdr_auto_rounded],
                                  inactiveFgColor: Colors.white,
                                  initialLabelIndex: null,
                                  doubleTapDisable: true, // re-tap active widget to de-activate
                                  totalSwitches: 3,
                                  labels: ['ON', 'OFF', ''],
                                  customTextStyles: [
                                    TextStyle(
                                        color: Colors.white,
                                        fontSize: 10.0,
                                        fontWeight: FontWeight.w900),
                                    TextStyle(
                                        color: Colors.brown,
                                        fontSize: 10.0,
                                        fontWeight: FontWeight.w900),
                                    TextStyle(
                                        color: Colors.black,
                                        fontSize: 10.0,
                                        fontStyle: FontStyle.italic)
                                  ],
                                  onToggle: (index) {
                                    print('switched to: $index');
                                  },
                                ),
                                SizedBox(height: 10,),
                                ToggleSwitch(
                                  minWidth: 60.0,
                                  initialLabelIndex: 1,
                                  cornerRadius: 20.0,
                                  activeFgColor: Colors.black,
                                  inactiveBgColor: Colors.grey,
                                  inactiveFgColor: Colors.white,
                                  totalSwitches: 2,
                                  labels: ['','OFF'],
                                  icons : [Icons.cleaning_services, Icons.clear],
                                  activeBgColors: [[Colors.green],[Colors.red]],
                                  onToggle: (index) {
                                    print('switched to: $index');
                                  },
                                ),
                          // SizedBox(height: 30,),
                           // Expanded(child: SizedBox()),

                                Container(
                                  height: 134,
                                  color:  Color.fromARGB(255, 71, 71, 71),
                                  child: JoyStick(
                                      radius: 60.0,
                                      stickRadius: 20,
                                      callback: callback),
                                ),
                          ]),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

