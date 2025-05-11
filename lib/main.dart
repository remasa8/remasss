import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/Screens/Login.dart';
import 'package:untitled/Screens/Signup.dart';
import 'package:untitled/providers/register_provider.dart';
import 'package:untitled/providers/user_provider.dart';
void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => RigisterProvider(),),
        ChangeNotifierProvider(create: (context) => UserProvider(),)
      ],
      child: MaterialApp(
        title: " Random User ",

        home: Signup(),
      ),
    );
  }
}
//fady
