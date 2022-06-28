// ignore_for_file: unnecessary_string_interpolations, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:warikan_photo/trip1.dart';
import 'package:warikan_photo/tripadd.dart';
import 'package:warikan_photo/friends.dart';
import 'package:warikan_photo/profile.dart';
import 'package:warikan_photo/abouts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Warikan Photo',
      theme: ThemeData(
          primarySwatch: Colors.lightGreen,
          textTheme: Theme.of(context).textTheme.apply(
                fontSizeFactor: 1.1,
                fontSizeDelta: 2.0,
              )),
      home: const MyHomePage(),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> nameList = [
    "東京",
    "北海道",
    "ハワイ",
  ];
  final List<String> dateList = [
    "2022/03/30～2022/03/31",
    "2022/09/15～2022/09/20",
    "2023/02/03～2022/02/07",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("旅行一覧"),
      ),
      drawer: Drawer(
        child: ListView(children: <Widget>[
          SizedBox(
            height: 200,
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.lightGreen,
              ),
              accountName: Text(
                "和里 夏太",
                style: TextStyle(fontSize: 20),
              ),
              accountEmail: Text("wari.kanta.00h@st.kyoto-u.ac.jp"),
            ),
          ),
          ListTile(
            title: Text("旅行一覧"),
            leading: Icon(Icons.card_travel),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage()),
              );
            },
          ),
          ListTile(
            title: Text("友だち一覧"),
            leading: Icon(Icons.people),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Friends()),
              );
            },
          ),
          ListTile(
            title: Text("プロフィール"),
            leading: Icon(Icons.account_circle),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Profile()),
              );
            },
          ),
          ListTile(
            title: Text("このアプリについて"),
            leading: Icon(Icons.feedback),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Abouts()),
              );
            },
          ),
          Divider(
            color: Colors.black,
          ),
          ListTile(title: Text("ログアウト"), leading: Icon(Icons.logout)),
        ]),
      ),
      //
      //
      //
      body: Center(
          child: Padding(
        padding: EdgeInsets.only(top: 20),
        child: SizedBox(
          width: double.infinity,
          child: ListView.separated(
              itemCount: nameList.length,
              separatorBuilder: (BuildContext context, int index) => Divider(
                    color: Colors.black,
                  ),
              itemBuilder: (context, index) {
                return ListTile(
                  title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("${nameList[index]}"),
                        Text(
                          "${dateList[index]}",
                          style: TextStyle(color: Colors.black45, fontSize: 16),
                        )
                      ]),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Trip1(
                              name: nameList[index], date: dateList[index])),
                    );
                  },
                );
              }),
        ),
      )),
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 50.0),
        child: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => TripAdd()));
          },
          shape: StadiumBorder(),
          icon: Icon(Icons.add),
          label: Text("旅行を追加"),
        ),
      ),
    );
  }
}