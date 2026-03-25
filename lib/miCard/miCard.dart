import 'package:flutter/material.dart';

class MiCard extends StatelessWidget {
  const MiCard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage('assets/panda.jpg'),
                ),
                Text(
                    "Basil Thomas",
                    style: TextStyle(
                        fontFamily: 'Trebuchet MS',
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    )
                ),
                Text(
                    "FLUTTER DEVELOPER",
                    style: TextStyle(
                        fontFamily: 'Times New Roman',
                        letterSpacing: 4,
                        fontSize: 20,
                        color: Colors.white60,
                        fontWeight: FontWeight.w500
                    )
                ),
                SizedBox(
                  height: 20,
                  width: 150,
                  child: Divider(
                    color: Colors.white60,
                  ),
                ),
                Card(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child:
                    ListTile(
                      leading: Icon(Icons.phone,),
                      title: Text(
                          "+91 888888888",
                          style: TextStyle(
                              fontFamily: 'Times New Roman',
                              fontSize: 20,
                              fontWeight: FontWeight.w500
                          )
                      ),
                    )
                ),
                Card(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child:
                    ListTile(
                      leading: Icon(Icons.email,),
                      title: Text(
                          "basilthomas@gmail.com",
                          style: TextStyle(
                              fontFamily: 'Times New Roman',
                              fontSize: 20,
                              fontWeight: FontWeight.w500
                          )
                      ),
                    )
                )
              ],
            )
        ),
      ),
    );
  }
}
