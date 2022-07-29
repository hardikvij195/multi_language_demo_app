import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

//Google Translate -> copy paste json -> https://translate.google.co.in/?sl=auto&tl=hi&text=%7B%0A%20%20%20%20%22settings%22%3A%22Settings%22%2C%0A%20%20%20%20%22profile%22%3A%22Profile%22%2C%0A%20%20%20%20%22gender%22%3A%22Gender%22%2C%0A%20%20%20%20%22male%22%3A%22Male%22%2C%0A%20%20%20%20%22female%22%3A%22Female%22%0A%7D&op=translate

//Medium Article -> https://medium.com/swlh/flutter-internationalization-with-easy-localization-790e46ca30e8  ( Open in InCognito Mode )

//Language Code -> http://www.lingoes.net/en/translator/langcode.htm

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
        supportedLocales: const [
          Locale('en', 'UK'),
          Locale('es', 'SP'),
          Locale('hi', 'IN')
        ],
        path: 'assets/translations',
        fallbackLocale: const Locale('en', 'UK'),
        child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        home: const MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // String hello = "Hello";

    // var abc = utf8.encode("hardik");

    return Scaffold(
      appBar: AppBar(
        title: const Text("Demo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              // utf8.decode(abc),
              //hello
              'title'.tr(),
              // utf8.decode("Hello"),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  context.setLocale(const Locale("en", "UK"));
                });
              },
              child: const Text("Switch To English"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  context.setLocale(const Locale("hi", "IN"));
                });
              },
              child: const Text("Switch To Hindi"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  context.setLocale(const Locale("es", "SP"));
                });
              },
              child: const Text("Switch To Spanish"),
            ),
          ],
        ),
      ),
    );
  }
}
