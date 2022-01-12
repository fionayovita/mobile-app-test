import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia/api/api_service.dart';
import 'package:suitmedia/common/styles.dart';
import 'package:suitmedia/provider/email_provider.dart';
import 'package:suitmedia/provider/next_page_provider.dart';
import 'package:suitmedia/ui/first_screen.dart';
import 'package:suitmedia/ui/second_screen.dart';
import 'package:suitmedia/ui/third_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(apiService: ApiService()),
        ),
        ChangeNotifierProvider(
            create: (_) => NextPageProvider(apiService: ApiService())),
      ],
      child: MaterialApp(
        title: 'Suitmedia',
        initialRoute: FirstScreen.routeName,
        theme: themeData,
        routes: {
          FirstScreen.routeName: (context) => FirstScreen(),
          SecondScreen.routeName: (context) => SecondScreen(
              name: ModalRoute.of(context)?.settings.arguments as String),
          ThirdScreen.routeName: (context) => ThirdScreen()
        },
      ),
    );
  }
}
