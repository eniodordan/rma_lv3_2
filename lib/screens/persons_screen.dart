import 'package:flutter/material.dart';

import 'package:rma_lv3_2/dao/inspiring_person_dao.dart';

import 'package:rma_lv3_2/widgets/persons_list.dart';
import 'package:rma_lv3_2/screens/add_person_screen.dart';

class PersonsScreen extends StatelessWidget {
  final InspiringPersonDao dao;

  PersonsScreen({required this.dao});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('rma_lv2'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddPersonScreen(dao: dao),
                ),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: PersonsList(dao: dao),
        ),
      ),
    );
  }
}
