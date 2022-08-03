// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again:
// With a Flutter package, run `flutter pub run build_runner build`.
// With a Dart package, run `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'Domain/Models/food.dart';
import 'Domain/Models/meal.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(2, 3004001520556935036),
      name: 'Meal',
      lastPropertyId: const IdUid(5, 4059049783231314649),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 8837506605298155067),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 1428298465746330844),
            name: 'date',
            type: 10,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 4059049783231314649),
            name: 'mealType',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[
        ModelRelation(
            id: const IdUid(1, 2017498238452640160),
            name: 'foods',
            targetId: const IdUid(3, 5958903789477139420))
      ],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(3, 5958903789477139420),
      name: 'Food',
      lastPropertyId: const IdUid(2, 1489058281554292901),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 1362514204707459963),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 1489058281554292901),
            name: 'description',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Open an ObjectBox store with the model declared in this file.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(3, 5958903789477139420),
      lastIndexId: const IdUid(1, 3252969074149544698),
      lastRelationId: const IdUid(1, 2017498238452640160),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [7735410333144087890],
      retiredIndexUids: const [3252969074149544698],
      retiredPropertyUids: const [
        7930954151443410082,
        4252877789476809213,
        6600495818865029964,
        8823314775185597657
      ],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    Meal: EntityDefinition<Meal>(
        model: _entities[0],
        toOneRelations: (Meal object) => [],
        toManyRelations: (Meal object) =>
            {RelInfo<Meal>.toMany(1, object.id): object.foods},
        getId: (Meal object) => object.id,
        setId: (Meal object, int id) {
          object.id = id;
        },
        objectToFB: (Meal object, fb.Builder fbb) {
          final mealTypeOffset = fbb.writeString(object.mealType);
          fbb.startTable(6);
          fbb.addInt64(0, object.id);
          fbb.addInt64(1, object.date.millisecondsSinceEpoch);
          fbb.addOffset(4, mealTypeOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = Meal(
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0),
              date: DateTime.fromMillisecondsSinceEpoch(
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 6, 0)),
              mealType: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 12, ''));
          InternalToManyAccess.setRelInfo(object.foods, store,
              RelInfo<Meal>.toMany(1, object.id), store.box<Meal>());
          return object;
        }),
    Food: EntityDefinition<Food>(
        model: _entities[1],
        toOneRelations: (Food object) => [],
        toManyRelations: (Food object) => {},
        getId: (Food object) => object.id,
        setId: (Food object, int id) {
          object.id = id;
        },
        objectToFB: (Food object, fb.Builder fbb) {
          final descriptionOffset = fbb.writeString(object.description);
          fbb.startTable(3);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, descriptionOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = Food(
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0),
              description: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 6, ''));

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [Meal] entity fields to define ObjectBox queries.
class Meal_ {
  /// see [Meal.id]
  static final id = QueryIntegerProperty<Meal>(_entities[0].properties[0]);

  /// see [Meal.date]
  static final date = QueryIntegerProperty<Meal>(_entities[0].properties[1]);

  /// see [Meal.mealType]
  static final mealType = QueryStringProperty<Meal>(_entities[0].properties[2]);

  /// see [Meal.foods]
  static final foods =
      QueryRelationToMany<Meal, Food>(_entities[0].relations[0]);
}

/// [Food] entity fields to define ObjectBox queries.
class Food_ {
  /// see [Food.id]
  static final id = QueryIntegerProperty<Food>(_entities[1].properties[0]);

  /// see [Food.description]
  static final description =
      QueryStringProperty<Food>(_entities[1].properties[1]);
}
