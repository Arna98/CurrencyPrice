import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('fa'), // Farsi
      ],
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 243, 243, 243),
          appBarTheme: const AppBarTheme(elevation: 0),
          fontFamily: 'nazanin',
          textTheme: const TextTheme(
              headlineLarge: TextStyle(
                  color: Colors.black,
                  fontFamily: 'nazanin',
                  fontWeight: FontWeight.w700),
              headlineSmall: TextStyle(
                  color: Colors.black,
                  fontFamily: 'nazanin',
                  fontWeight: FontWeight.w700),
              titleSmall: TextStyle(
                  color: Colors.white,
                  fontFamily: 'nazanin',
                  fontWeight: FontWeight.w300),
              bodyMedium: TextStyle(
                  color: Colors.black,
                  fontFamily: 'nazanin',
                  fontWeight: FontWeight.w300))),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          actions: [
            Image.asset("assets/images/icon.png"),
            const Padding(
                padding: EdgeInsets.only(right: 8),
                child: Align(
                    alignment: Alignment.centerRight,
                    child: Text("قیمت به روز ارز",
                        style: TextStyle(color: Colors.black)))),
            Expanded(
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Image.asset("assets/images/menu.png"))),
            const SizedBox(width: 8)
          ],
        ),
      ),
    );
  }
}
