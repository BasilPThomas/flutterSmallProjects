import 'package:flutter/material.dart';
import 'package:mi_card/todoList/screens/taskScreen.dart';
import 'flashChat/screens/chat_screen.dart';
import 'flashChat/screens/login_screen.dart';
import 'flashChat/screens/registration_screen.dart';
import 'flashChat/screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(MyApp());
}

// class PageRouter extends StatelessWidget {
//   const PageRouter({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return  SafeArea(
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         theme: ThemeData.dark().copyWith(
//           primaryColor: Color(0xFF0A0E23),
//           scaffoldBackgroundColor: Color(0xFF0A0E23),
//         ),
//         initialRoute: WelcomeScreen.routeName,
//         routes: {
//           WelcomeScreen.routeName: (context) => WelcomeScreen(),
//           LoginScreen.routeName: (context) => LoginScreen(),
//           RegistrationScreen.routeName: (context) => RegistrationScreen(),
//           ChatScreen.routeName: (context) => ChatScreen(),
//         },
//       ),
//     );
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TaskScreen(),
    );
  }
}



