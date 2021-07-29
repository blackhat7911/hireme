import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:frontend/models/login_model.dart';
import 'package:frontend/routes/router.dart';
import 'package:frontend/routes/routes.dart';
import 'package:frontend/screens/home_screen.dart';
import 'package:frontend/screens/splash_screen.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  var appDir = await path.getApplicationDocumentsDirectory();
  Hive.init(appDir.path);
  Hive.registerAdapter(LoginAdapter());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: splashRoute,
      onGenerateRoute: CustomRouter.generatedRoute,
      home: FutureBuilder(
        future: Hive.openBox('login'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return HomeScreen();
            }
          } else {
            return SplashScreen();
          }
        },
      ),
    );
  }
}
