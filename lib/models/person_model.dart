import 'package:hive/hive.dart';
part 'person_model.g.dart';

@HiveType(typeId: 0)
class PersonModel extends HiveObject{
  @HiveField(0)
  late String name;
  @HiveField(1)
  late int age;
  PersonModel({required this.name, required this.age});
}
