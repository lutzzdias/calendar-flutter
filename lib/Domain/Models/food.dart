import 'package:objectbox/objectbox.dart';

@Entity()
class Food {
  @Id()
  int id;
  String description;

  Food({this.id = 0, required this.description});
}
