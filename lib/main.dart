import 'package:calendar/Data/Database/objectbox.dart';
import 'package:calendar/Presentation/Controllers/Meal/meal_controller.dart';
import 'package:calendar/Presentation/Pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

late ObjectBox objectBox;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  objectBox = await ObjectBox.create();
  runApp(MyApp(
    database: objectBox,
  ));
}

class MyApp extends StatelessWidget {
  final ObjectBox database;

  const MyApp({Key? key, required this.database}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MealController(database),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
