import 'package:flutter/material.dart';

import 'package:rma_lv3_2/database/database.dart';
import 'package:rma_lv3_2/dao/inspiring_person_dao.dart';

import 'package:rma_lv3_2/screens/persons_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  final dao = database.inspiringPersonDao;

  runApp(MyApp(dao: dao));
}

class MyApp extends StatelessWidget {
  final InspiringPersonDao dao;

  MyApp({required this.dao});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PersonsScreen(dao: dao),
    );
  }
}
