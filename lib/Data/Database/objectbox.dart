import 'package:flutter/material.dart';

import '../../objectbox.g.dart';

class ObjectBox extends ChangeNotifier {
  late final Store store;

  ObjectBox._create(this.store);

  static Future<ObjectBox> create() async {
    final store = await openStore();
    return ObjectBox._create(store);
  }
}
