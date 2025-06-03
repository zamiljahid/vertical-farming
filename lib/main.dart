import 'package:flutter/material.dart';
import 'package:vertical_farming/screens/splash_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // await SharedPrefs.init();
  runApp(const ProviderScope(child: MainClass()));
}

class MainClass extends StatefulWidget {
  const MainClass({Key? key}) : super(key: key);

  @override
  MainClassState createState() => MainClassState();
}

class MainClassState extends State<MainClass> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme:getThemeFromCode(appThemeCode),
      // onGenerateRoute: RouterGenerator.generateRoute,
      home: SplashScreen(),
    );
  }
}
