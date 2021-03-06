import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ritco_app/colors/colorswitch.dart';
import 'package:ritco_app/screens/GettingStartedScreens/finishing_password.dart';
import 'package:ritco_app/screens/GettingStartedScreens/sign_up_started.dart';
import 'package:ritco_app/screens/chosen_screen.dart';
import 'package:ritco_app/screens/getting_started.dart';
import 'package:ritco_app/screens/home_screen.dart';
import 'package:ritco_app/screens/landing_services.dart';
import 'package:ritco_app/screens/login_screen.dart';
import 'package:ritco_app/screens/message_screen.dart';
import 'package:ritco_app/screens/taking_survey.dart';
import 'package:ritco_app/services/data_manupilation.dart';
import 'package:ritco_app/wrapper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import "firebase_options.dart";
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Firebase.initializeApp();

// Ideal time to initialize
  await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String routeNameGlobal = '';
  String userId = '';

  @override
  void initState() {
    getAvailableTokenHandler();
    super.initState();
  }

  getAvailableTokenHandler() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final String? username = pref.getString('username');
    final String? uid = pref.getString('uid');

    // final user = FirebaseAuth.instance.currentUser;

    dashboardChoosen() {
      var routeName = '/login';
      if (uid != null) {
        print(uid);
        setState(() {
          userId = uid;
        });
        return routeName = "/landing-services";
      }

      if (uid == null) {
        return routeName = "/getting-Started";
      }
      return routeName;
    }

    setState(() {
      routeNameGlobal = dashboardChoosen();
    });
  }

  @override
  Widget build(BuildContext context) {
    MaterialColor primeColor = MaterialColor(0xFF7CB211, color);
    // print(pref.);

    return StreamProvider<RitcoUser>.value(
      value: RitcoAPI().userChanges,
      initialData: RitcoUser(uid: null),
      child: MaterialApp(
        title: 'Ritco Surveys',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: primeColor,
        ),
        home: ChosenScreen(routeNameGlobal, userId),
        routes: {
          // '/'
          "/getting-Started": (context) => const GettingStartedScreen(),
          "/getting-started-signup": (context) => const SignUpStarted(),
          "/sign-up-credetials": (context) => const FinishingSignUp(),
          '/login': (context) => const Login(),
          "/home-screen": (context) => const HomeScreen(),
          "/message-screen": (context) => const MessageScreen(),
          "/survey-details-answers": (context) => const SurveyQuestionaire(),
          "/landing-services": (context) => const ServicesProvider(),
          "wrapper": (context) => Wrapper()
        },
      ),
    );
  }
}
