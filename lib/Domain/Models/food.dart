import 'package:objectbox/objectbox.dart';

@Entity()
class Food {
  @Id()
  int id;
  String icon;
  String description;

  Food({this.id = 0, required this.icon, required this.description});
}
