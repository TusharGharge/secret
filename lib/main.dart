import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:user/Provider/QuizProvider.dart';
import 'package:user/helper/authenticate.dart';
import 'package:user/helper/constants.dart';
import 'package:user/views/add_question.dart';
import 'package:user/views/create_quiz.dart';
import 'package:user/views/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user/views/profileScreen.dart';
import 'package:user/views/quiz_play.dart';
import 'package:user/views/results.dart';
import 'package:user/views/signin.dart';
import 'package:user/views/signup.dart';
import './views/floatingContainer.dart';

List<CameraDescription> cameras;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isUserLoggedIn = false;

  @override
  void initState() {
    getLoggedInState();
    super.initState();
  }

  getLoggedInState() async {
    await Constants.getUerLoggedInSharedPreference().then((value) {
      setState(() {
        isUserLoggedIn = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => QuizProvider(),
      child: MaterialApp(
          title: 'Quiz App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: Home(),
          // home: Authenticate(),
          routes: {
            SignUp.idscreen: (ctx) => SignUp(),
            SignIn.idscreen: (ctx) => SignIn(),
            Results.idscreen: (ctx) => Results(),
            //QuizPlay.idscreen: (ctx) => QuizPlay(),
            ProfilePage.idscreen: (ctx) => ProfilePage(),
            CreateQuiz.idscreen: (ctx) => CreateQuiz(),
            //AddQuestion.idscreen: (ctx) =>AddQuestion(),
          }),
    );
  }
}
