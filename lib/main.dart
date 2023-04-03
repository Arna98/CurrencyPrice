import 'package:currencyprice/DataModels/CurrencyDataModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:developer' as developer;

import 'package:intl/intl.dart';

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
      home: BodyWidget(),
    );
  }
}

class BodyWidget extends StatefulWidget {
  const BodyWidget({
    super.key,
  });

  @override
  State<BodyWidget> createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  // ignore: prefer_final_fields
  List<CurrencyDataModel> _currencyList = [];
   bool? _status;

  Future _getResponse() async {
    if (_currencyList.isEmpty) {
      developer.log("getResponse", name: "wLifeCycle");
      var url =
          "https://sasansafari.com/flutter/api.php?access_key=flutter123456";
      var value = await http.get(Uri.parse(url));
      if (value.statusCode == 200) {
        List jsonList = convert.jsonDecode(value.body);
        setState(() {
          for (int count = 0; count < jsonList.length; count++) {
            CurrencyDataModel currencyDataModel = CurrencyDataModel();
            currencyDataModel.setId = jsonList[count]['id'];
            currencyDataModel.setTitle = jsonList[count]['title'];
            currencyDataModel.setPrice = jsonList[count]['price'];
            currencyDataModel.setChanges = jsonList[count]['changes'];
            currencyDataModel.setStatus = jsonList[count]['status'];
            _currencyList.add(currencyDataModel);
          }
        });
        if(_status!){
          if (!mounted) return;
          _showSnackBar(context: context, msg: "بروزرسانی با موفقیت انجام شد.");
        }
      }
      return value;
    }else{
      return _currencyList;
    }
  }

  @override
  void initState() {
    super.initState();
    _status = false;
  }

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
          //child 1
          Row(
            children: [
              Image.asset("assets/images/question.png"),
              const SizedBox(width: 8),
              Text("نرخ ازاد ارز چیست؟",
                  style: Theme.of(context).textTheme.titleLarge)
            ],
          ),
          //child 2
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 16),
            child: Text(
              "نرخ ارزها در معاملات نقدی و رایج روزانه است معاملات نقدی معاملاتی هستند که خریدار و فروشنده به محض انجام معامله، ارز و ریال را با هم تبادل می نمایند.",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          //child 3
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
          //child 4 : listview
          SizedBox(
            height: 350,
            width: double.infinity,
            child: _futureBuilderList(),
          ),
          //child 5 : Update Button Box
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Container(
              width: double.infinity,
              height: 50,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 232, 232, 232),
                  borderRadius: BorderRadius.all(Radius.circular(1000))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 50,
                    child: TextButton.icon(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 202, 193, 255)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(1000)))),
                        ),
                        onPressed: () {
                          _status = true;
                          _currencyList.clear();
                          _futureBuilderList();
                        },
                        icon: const Icon(CupertinoIcons.refresh_bold,
                            color: Colors.black),
                        label: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                          child: Text("بروزرسانی",
                              style: Theme.of(context).textTheme.titleLarge),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 26),
                    child: Text(
                      "آخرین بروزرسانی   ${_getTime()}",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }

  FutureBuilder<dynamic> _futureBuilderList() {
    return FutureBuilder(
            future: _getResponse(),
            builder: (context, snapshot) {
              return snapshot.hasData
                  ? ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemCount: _currencyList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListviewItem(
                            currencyList: _currencyList, position: index);
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return (index + 1) % 4 == 0
                            ? const ListviewItemSeparator()
                            : const SizedBox.shrink();
                      },
                    )
                  : const Center(child: CircularProgressIndicator());
            },
          );
  }

  String _getTime() {
    developer.log("getTime", name: "wLifeCycle");
    DateTime dateTime = DateTime.now();
    return DateFormat("kk:mm:ss").format(dateTime);
  }
}

class ListviewItemSeparator extends StatelessWidget {
  const ListviewItemSeparator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Container(
          width: double.infinity,
          height: 50,
          decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(Radius.circular(1000)),
              boxShadow: <BoxShadow>[
                BoxShadow(blurRadius: 1.0, color: Colors.grey)
              ]),
          child: Center(
            child:
                Text("تبلیغات", style: Theme.of(context).textTheme.bodyLarge),
          )),
    );
  }
}

class ListviewItem extends StatelessWidget {
  late List<CurrencyDataModel> _currencyList;
  late int _position;

  ListviewItem(
      {required List<CurrencyDataModel> currencyList,
      required int position,
      super.key}) {
    this._currencyList = currencyList;
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
              BoxShadow(blurRadius: 1.0, color: Colors.grey)
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(_currencyList[_position].getTitle!,
                style: Theme.of(context).textTheme.bodyLarge),
            Text(_currencyList[_position].getPrice!,
                style: Theme.of(context).textTheme.bodyLarge),
            Text(_currencyList[_position].getChanges!,
                style: _currencyList[_position].getStatus! == "p"
                    ? Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .apply(color: Colors.green)
                    : Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .apply(color: Colors.red))
          ],
        ),
      ),
    );
  }
}

void _showSnackBar({required BuildContext context,required String msg}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg, style: Theme.of(context).textTheme.titleLarge),
      backgroundColor: Colors.green));
}
