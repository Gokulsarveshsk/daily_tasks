import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notes/utils.dart';
import 'package:provider/provider.dart';
import 'package:notes/page/home_page.dart';
import 'package:notes/provider/todos.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'DailyNotes';

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => TodosProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: title,
          theme: ThemeData(
            primarySwatch: Palette.kToDark,
            scaffoldBackgroundColor: Color.fromRGBO(232, 232, 232, 1),
          ),
          home: HomePage(),
        ),
      );
}
