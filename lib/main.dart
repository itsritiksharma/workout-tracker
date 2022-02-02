import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/calendar_screen.dart';
import './widgets/home_page.dart';
import 'providers/app_mode.dart';
import './providers/app_mode.dart';

void main() =>
    runApp(ChangeNotifierProvider(create: (ctx) => AppMode(), child: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final app = Provider.of<AppMode>(context);
    // final appMode = app.appMode;
    // print(appMode);
    return Consumer<AppMode>(
      builder: (_, mode, __) {
        return MaterialApp(
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            primaryColor: Colors.black,
            accentColor: Colors.orange,
            errorColor: Colors.red,
            // canvasColor:
            // colorScheme: ThemeData().colorScheme.copyWith(
            //     secondary: Colors.orange,
            //     primary: Colors.black,
            //     brightness: Brightness.dark,
            //     error: Colors.red),
          ),
          themeMode: mode.appMode,
          debugShowCheckedModeBanner: false,
          title: 'Workout Tracker',
          theme: ThemeData(
            // colorScheme: ThemeData().colorScheme.copyWith(
            //     secondary: Colors.orange,
            //     secondaryVariant: Colors.orange,
            //     primary: Colors.deepOrange,
            //     error: Colors.red,
            //     brightness: Brightness.light),
            primarySwatch: Colors.deepOrange,
            errorColor: Colors.red,
            accentColor: Colors.orange,
            // canvasColor: Color.fromRGBO(255, 254, 229, 1),
            canvasColor: Color.fromRGBO(255, 255, 255, 1),
            // fontFamily: 'Raleway',
            textTheme: ThemeData.light().textTheme.copyWith(
                  bodyText1: TextStyle(
                    color: Color.fromRGBO(20, 51, 51, 1),
                  ),
                  bodyText2: TextStyle(
                    color: Color.fromRGBO(20, 51, 51, 1),
                  ),
                  headline6: TextStyle(
                    fontSize: 20,
                    // fontFamily: 'RobotoCondensed',
                    fontWeight: FontWeight.bold,
                  ),
                ),
          ),
          routes: {
            '/': (_) => HomePage(),
            CalendarScreen.routName: (_) => CalendarScreen()
          },
        );
      },
    );
  }
}
