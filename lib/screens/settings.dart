import 'package:flutter/material.dart';
class Settting extends StatelessWidget {
  const Settting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                width: 100,height: 120,
                child: ClipRRect(borderRadius: BorderRadius.circular(100),child: Image(image: AssetImage('./assets/images/robot.jpg')),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
