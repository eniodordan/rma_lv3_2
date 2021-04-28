import 'package:floor/floor.dart';

@entity
class InspiringPerson {
  @PrimaryKey(autoGenerate: true)
  final int? id;

  String name;
  String description;

  @ColumnInfo(name: 'birth_date')
  DateTime birthDate;

  @ColumnInfo(name: 'death_date')
  DateTime deathDate;

  String quote1;
  String quote2;
  String quote3;

  @ColumnInfo(name: 'image_url')
  String imageUrl;

  InspiringPerson({
    this.id,
    required this.name,
    required this.description,
    required this.birthDate,
    required this.deathDate,
    required this.quote1,
    required this.quote2,
    required this.quote3,
    required this.imageUrl,
  });
}
