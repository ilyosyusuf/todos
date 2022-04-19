import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todosapp/providers/db_provider.dart';
import 'package:todosapp/providers/ontap_provider.dart';
import 'package:todosapp/routes/my_route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> OnTapProvider()),
        ChangeNotifierProvider(create: (context)=> DbProvider()),
      ],
    child: MyApp())
    );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  MyRoute _myRoute =  MyRoute();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: '/splash',
      onGenerateRoute: _myRoute.onGenerateRoute,
    );
  }
}
