import 'dart:math';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:rma_lv3_2/dao/inspiring_person_dao.dart';
import 'package:rma_lv3_2/entity/inspiring_person.dart';

import 'package:rma_lv3_2/screens/add_person_screen.dart';

class PersonTile extends StatelessWidget {
  final InspiringPerson person;
  final InspiringPersonDao dao;

  PersonTile({required this.person, required this.dao});

  String formatDateTime() {
    String birthDate = DateFormat('dd.MM.yyyy.').format(person.birthDate);
    String deathDate = person.deathDate != DateTime(1970)
        ? DateFormat('dd.MM.yyyy.').format(person.deathDate)
        : 'present';

    return birthDate + ' - ' + deathDate;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddPersonScreen(person: person, dao: dao),
            ),
          );
        },
        isThreeLine: true,
        leading: GestureDetector(
          onTap: () {
            List<String> quotes = [person.quote1, person.quote2, person.quote3];

            Fluttertoast.showToast(
              msg: quotes[Random().nextInt(quotes.length)],
            );
          },
          child: AspectRatio(
            aspectRatio: 1 / 1,
            child: Image.network(person.imageUrl, fit: BoxFit.cover),
          ),
        ),
        title: Text(person.name),
        subtitle: Text(formatDateTime() + '\n' + person.description),
        trailing: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            dao.deletePerson(person);
          },
        ),
      ),
    );
  }
}
