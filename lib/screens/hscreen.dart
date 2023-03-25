import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../components/AppBarConsole/console_appbar.dart';
import '../components/joystick/joy_stick.dart';
import '../widgets/console_widgets/joystick_control.dart';

class HomePageCosole extends StatefulWidget {
  @override
  State<HomePageCosole> createState() => _HomePageCosoleState();
}

class _HomePageCosoleState extends State<HomePageCosole> {
 // HomePage({super.key});
  void callback(x, y) {
    log('callback x => $x and y $y');
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
              children: [
                Expanded(flex: 1, child: ConsoleAppBar()),
                Expanded(
                  flex: 9,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 4,
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
                          color: Colors.yellow,
                          child: Column(children: [
                            Expanded(child: SizedBox()),
                            Expanded(
                                child: Container(
                                  color:  Color.fromARGB(255, 71, 71, 71),
                                  child: JoyStick(
                                      radius: 50.0,
                                      stickRadius: 20,
                                      callback: callback),
                                )),
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

