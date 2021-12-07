import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lovebird/config/routes/routing.dart';
import 'package:lovebird/pages/auth/login.dart';
import 'package:lovebird/models/bio_model.dart';
import 'package:lovebird/pages/bio/bio_screen.dart';
import 'package:lovebird/pages/main/main_screen.dart';
import 'package:lovebird/pages/match/match_screen.dart';
import 'package:lovebird/pages/scan/scan_screen.dart';
import 'package:lovebird/services/bio_service.dart';
import 'package:lovebird/splash_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setEnabledSystemUIOverlays([]);
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //Size mediaQuery = MediaQuery.of(context).size;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        AppRouting.loginRoute: (context) => LoginScreen(),
        AppRouting.splashRoute: (context) => const SplashScreen(),
        AppRouting.scanRoute: (context) => const ScanScreen(),
        AppRouting.bioRoute: (context) => const BioScreen(),
        AppRouting.matchRoute: (context) => const MatchScreen(),
      },
      // routes: ,
      // ignore: prefer_const_constructors
      //   home: AnimatedSplashScreen(
      //       duration: 2000,
      //       splash: Image.asset("assets/img/lovebird.png"),
      //       nextScreen: ,
      //       splashTransition: SplashTransition.fadeTransition,
      //       // pageTransitionType: PageTransitionType.scale,
      //       backgroundColor: Colors.white),
      home: MainScreen(
        key: key,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  BioServices bioServices = BioServices();

  void uploadBio() async {
    // new Bio(sex: sex, avatar: avatar, background: background, nickName: nickName, hobbies: hobbies, name: name, address: address, socialUrl: socialUrl)
    // bioServices.update(bio, uuid)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => uploadBio(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
