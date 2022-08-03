import 'package:calendar/Domain/Models/meal.dart';

import '../../objectbox.g.dart';

class ObjectBox {
  late final Store _store;
  Store get store => _store;
  static late final Box<Meal> _mealBox;
  Box<Meal> get mealBox => _mealBox;

  ObjectBox._create(this._store) {
    _mealBox = Box<Meal>(_store);
  }

  static Future<ObjectBox> create() async {
    final store = await openStore();
    return ObjectBox._create(store);
  }
}
