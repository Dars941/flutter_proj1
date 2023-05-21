import 'package:flutter/material.dart';

import '../../screens/settings.dart';

class ConsoleAppBar extends StatefulWidget {

 // const ConsoleAppBar({super.key});

  @override
  State<ConsoleAppBar> createState() => _ConsoleAppBarState();
}

class _ConsoleAppBarState extends State<ConsoleAppBar> {

  @override

  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
    String dateStr = today.toString().substring(0, 10);
    return Container(
      color:  Colors.deepPurple,
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: SizedBox(
              child: Padding(
                padding: EdgeInsets.only(left: 18.0),
                child: Text(
                  "Aura",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
              flex: 2,

              child: Text("${dateStr}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ))),
           Expanded(
              flex: 3,
              child: Text("connected",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ))),
          Expanded(
              flex: 2,
              child: IconButton(
                  onPressed: () {},
                  icon:  Padding(
                    padding: EdgeInsets.only(right: 12.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: IconButton( onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => Settting(),),);
                      } ,
                         icon: Icon(Icons.settings),
                        color: Colors.white,
                      ),
                    ),
                  )))
        ],
      ),
    );
  }
}
