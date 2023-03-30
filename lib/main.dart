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
              headlineSmall: TextStyle(
                  color: Colors.black,
                  fontFamily: 'nazanin',
                  fontWeight: FontWeight.w700),
              titleLarge: TextStyle(
                  color: Colors.black,
                  fontFamily: 'nazanin',
                  fontWeight: FontWeight.w700),
              titleMedium: TextStyle(
                  color: Colors.white,
                  fontFamily: 'nazanin',
                  fontWeight: FontWeight.w300),
              bodyLarge: TextStyle(
                  color: Colors.black,
                  fontFamily: 'nazanin',
                  fontWeight: FontWeight.w300))),
      home: const BodyWidget(),
    );
  }
}

class BodyWidget extends StatelessWidget {
  const BodyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          Image.asset("assets/images/icon.png"),
          Padding(
              padding: EdgeInsets.only(right: 8),
              child: Align(
                  alignment: Alignment.centerRight,
                  child: Text("قیمت به روز ارز",
                      style: Theme.of(context).textTheme.headlineSmall))),
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
              Text("نرخ ازاد ارز چیست؟",
                  style: Theme.of(context).textTheme.titleLarge)
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 16),
            child: Text(
              "نرخ ارزها در معاملات نقدی و رایج روزانه است معاملات نقدی معاملاتی هستند که خریدار و فروشنده به محض انجام معامله، ارز و ریال را با هم تبادل می نمایند.",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          Container(
            height: 40,
            width: double.infinity,
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 130, 130, 130),
                borderRadius: BorderRadius.all(Radius.circular(1000))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("نام ارز", style: Theme.of(context).textTheme.titleMedium),
                Text("قیمت", style: Theme.of(context).textTheme.titleMedium),
                Text("تغییرات", style: Theme.of(context).textTheme.titleMedium),
              ],
            ),
          ),
          //listview
          SizedBox(
            height: 350,
            width: double.infinity,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
                itemCount: 20,
                itemBuilder: (BuildContext context, int position) {
                  return ListviewItem(context: context, position: position);
                }),
          )
        ]),
      ),
    );
  }
}

class ListviewItem extends StatelessWidget {
  late BuildContext _context;
  late int _position;

  ListviewItem({required BuildContext context, required int position, super.key}){
    this._context = context;
    this._position = position;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(1000)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              blurRadius: 1.0,
              color: Colors.grey
            )
          ]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("دلار", style: Theme.of(context).textTheme.bodyLarge),
            Text("46000R", style: Theme.of(context).textTheme.bodyLarge),
            Text("+200", style: Theme.of(context).textTheme.bodyLarge)
          ],
        ),
      ),
    );
  }
}
