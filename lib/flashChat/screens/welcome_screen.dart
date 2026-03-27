import 'package:flutter/material.dart';
import 'package:mi_card/flashChat/screens/registration_screen.dart';
import '../components/roundButton.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static String routeName = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController( duration: Duration(seconds: 2), vsync: this,);
    animation = ColorTween(begin: Colors.yellow, end: Color(0xFF0A0E23)).animate(controller);
    controller.forward();
    controller.addListener((){
      setState(() {});
      // print(controller.value);
    });
  }

 @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('assets/images/logo.png'),
                    height: 60.0,
                  ),
                ),
                Text(
                  'Flash Chat',
                  style: TextStyle(
                    fontSize: 45.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox( height: 48.0,),
            RoundButton(
                (){Navigator.pushNamed(context, LoginScreen.routeName);},
                'Log In',
                Colors.yellow,
            ),
            RoundButton(
              (){Navigator.pushNamed(context, RegistrationScreen.routeName);},
              'Register',
              Colors.yellowAccent,
            ),
          ],
        ),
      ),
    );
  }
}
