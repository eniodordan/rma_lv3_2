import 'package:flutter/material.dart';

import 'package:rma_lv3_2/entity/inspiring_person.dart';
import 'package:rma_lv3_2/dao/inspiring_person_dao.dart';

class AddPersonScreen extends StatelessWidget {
  final InspiringPerson? person;
  final InspiringPersonDao dao;

  AddPersonScreen({Key? key, this.person, required this.dao}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final _deathFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;

    String newPersonName = "";
    String newPersonDescription = "";
    DateTime newPersonBirthDate = DateTime(1970);
    DateTime newPersonDeathDate = DateTime(1970);
    String newPersonQuote1 = "";
    String newPersonQuote2 = "";
    String newPersonQuote3 = "";
    String newPersonImageUrl = "";

    return Scaffold(
      appBar: AppBar(
        title: Text('rma_lv2'),
      ),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            reverse: true,
            padding: EdgeInsets.fromLTRB(20, 20, 20, 20 + bottom),
            child: Column(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextFormField(
                        initialValue: person != null ? person!.name : null,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Name',
                        ),
                        onSaved: (newName) {
                          newPersonName = newName!;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text.';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15.0),
                      TextFormField(
                        initialValue:
                            person != null ? person!.description : null,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Description',
                        ),
                        onSaved: (newDescription) {
                          newPersonDescription = newDescription!;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text.';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15.0),
                      TextFormField(
                        initialValue: person != null ? person!.imageUrl : null,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Image URL',
                        ),
                        onSaved: (newImageUrl) {
                          newPersonImageUrl = newImageUrl!;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text.';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15.0),
                      TextFormField(
                        initialValue: person != null ? person!.quote1 : null,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Quote #1',
                        ),
                        onSaved: (newQuote) {
                          newPersonQuote1 = newQuote!;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text.';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15.0),
                      TextFormField(
                        initialValue: person != null ? person!.quote2 : null,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Quote #2',
                        ),
                        onSaved: (newQuote) {
                          newPersonQuote2 = newQuote!;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text.';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15.0),
                      TextFormField(
                        initialValue: person != null ? person!.quote3 : null,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Quote #3',
                        ),
                        onSaved: (newQuote) {
                          newPersonQuote3 = newQuote!;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text.';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15.0),
                      InputDatePickerFormField(
                        initialDate: person != null ? person!.birthDate : null,
                        fieldLabelText: 'Birth Date',
                        firstDate: DateTime(1899),
                        lastDate: DateTime.now(),
                        onDateSaved: (newBirthDate) {
                          newPersonBirthDate = newBirthDate;
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15.0),
                Form(
                  key: _deathFormKey,
                  child: InputDatePickerFormField(
                    initialDate: person != null
                        ? (person!.deathDate != DateTime(1970)
                            ? person!.deathDate
                            : null)
                        : null,
                    fieldLabelText: 'Death Date',
                    firstDate: DateTime(1899),
                    lastDate: DateTime.now(),
                    onDateSaved: (newDeathDate) {
                      newPersonDeathDate = newDeathDate;
                    },
                  ),
                ),
                SizedBox(height: 15.0),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ElevatedButton(
                    child: Text(person != null ? 'Update' : 'Add'),
                    onPressed: () async {
                      _formKey.currentState!.save();
                      _deathFormKey.currentState!.save();

                      if (_formKey.currentState!.validate()) {
                        if (person == null) {
                          InspiringPerson newPerson = new InspiringPerson(
                            id: null,
                            name: newPersonName,
                            description: newPersonDescription,
                            birthDate: newPersonBirthDate,
                            deathDate: newPersonDeathDate,
                            quote1: newPersonQuote1,
                            quote2: newPersonQuote2,
                            quote3: newPersonQuote3,
                            imageUrl: newPersonImageUrl,
                          );

                          await dao.addPerson(newPerson);
                        } else {
                          person!.name = newPersonName;
                          person!.description = newPersonDescription;
                          person!.birthDate = newPersonBirthDate;
                          person!.deathDate = newPersonDeathDate;
                          person!.quote1 = newPersonQuote1;
                          person!.quote2 = newPersonQuote2;
                          person!.quote3 = newPersonQuote3;
                          person!.imageUrl = newPersonImageUrl;

                          await dao.updatePerson(person!);
                        }

                        Navigator.pop(context);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
