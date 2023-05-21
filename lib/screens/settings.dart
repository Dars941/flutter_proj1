import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import '../widgets/Settingscomponents/SettingComponent.dart';
import 'ForgetPasswordScreen.dart';

class Settting extends StatelessWidget {
  const Settting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
     // DeviceOrientation.portrait,

      DeviceOrientation.landscapeLeft,
    ]);
    final user = FirebaseAuth.instance.currentUser!;

    // sign user out method
    void signUserOut() async {
      FirebaseAuth.instance.signOut();
    }

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Settings"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                width: 120,
                height: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: CircleAvatar(
                      child: Image(
                          image: AssetImage('./assets/images/robot.jpg'))),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text("Robot id  "),
              Text(
                user.email!,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                //color: Colors.yellow,
                height: 50,
                width: 200,

                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    //  primary: Colors.yellow,
                    backgroundColor: Colors.yellow,
                    side: BorderSide(
                      width: 5,
                      color: Colors.black,
                    ),
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                  ),
                  onPressed: () {

                        SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
                      },
                  child: const Text(
                    " Edit Profile ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.black),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Divider(),
              SettingsContent(
                tittle: "About Us",
                icon: Icons.info_outline,
                onPress: () {},
                endIcon: true,
              ),
              SizedBox(
                height: 10,
              ),
              SettingsContent(
                tittle: "Change Password ",
                icon: Icons.lock_reset_outlined,
                onPress: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => ForgetPassword(),),);
                },
                endIcon: true,
              ),
              SizedBox(
                height: 10,
              ),
              SettingsContent(
                tittle: "Log Out ",
                icon: Icons.logout,
                onPress: () {
                  signUserOut();
                  Navigator.pop(context);
                },
                endIcon: true,
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
