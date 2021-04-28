import 'package:flutter/material.dart';

import 'package:rma_lv3_2/widgets/person_tile.dart';

import 'package:rma_lv3_2/entity/inspiring_person.dart';
import 'package:rma_lv3_2/dao/inspiring_person_dao.dart';

class PersonsList extends StatelessWidget {
  final InspiringPersonDao dao;

  PersonsList({required this.dao});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<InspiringPerson>>(
      stream: dao.getAllPersons(),
      builder: (_, snapshot) {
        if (!snapshot.hasData) return Container();

        final persons = snapshot.requireData;

        return ListView.builder(
          itemCount: persons.length,
          itemBuilder: (context, index) {
            final person = persons[index];
            return PersonTile(person: person, dao: dao);
          },
        );
      },
    );
  }
}
