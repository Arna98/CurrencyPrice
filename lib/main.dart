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
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(children: [
            Row(
              children: [
                Image.asset("assets/images/question.png"),
                const SizedBox(width: 8),
                const Text("نرخ ازاد ارز چیست؟")
              ],
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 8, 0, 16),
              child: Text(
                  "نرخ ارزها در معاملات نقدی و رایج روزانه است معاملات نقدی معاملاتی هستند که خریدار و فروشنده به محض انجام معامله، ارز و ریال را با هم تبادل می نمایند."),
            ),
            Container(
              height: 40,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 102, 102, 102),
                  borderRadius: BorderRadius.all(Radius.circular(1000))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Text("ارز", style: TextStyle(color: Colors.white)),
                  Text("قیمت", style: TextStyle(color: Colors.white)),
                  Text("تغییرات", style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
