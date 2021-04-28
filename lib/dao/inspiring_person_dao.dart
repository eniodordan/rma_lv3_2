import 'package:floor/floor.dart';
import 'package:rma_lv3_2/entity/inspiring_person.dart';

@dao
abstract class InspiringPersonDao {
  @Query('SELECT * FROM InspiringPerson')
  Stream<List<InspiringPerson>> getAllPersons();

  @insert
  Future<void> addPerson(InspiringPerson inspiringPerson);

  @update
  Future<void> updatePerson(InspiringPerson inspiringPerson);

  @delete
  Future<void> deletePerson(InspiringPerson inspiringPerson);
}
