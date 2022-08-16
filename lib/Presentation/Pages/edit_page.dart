import 'package:calendar/Domain/DTOs/Meal/meal_dto.dart';
import 'package:calendar/Domain/Models/meal.dart';
import 'package:calendar/Presentation/Controllers/Meal/meal_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditPage extends StatefulWidget {
  final Meal meal;
  const EditPage({Key? key, required this.meal}) : super(key: key);

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController mealTypeController =
        TextEditingController(text: widget.meal.mealType);
    MealController mealController = Provider.of<MealController>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit"),
      ),
      body: Column(
        children: [
          SizedBox(height: 15),
          Text("MealType - ${widget.meal.mealType}"),
          ListView.builder(
            shrinkWrap: true,
            itemCount: widget.meal.foods.length,
            itemBuilder: (context, index) => ListTile(
              title: Text(widget.meal.foods[index].description),
              leading: Icon(
                IconData(int.parse(widget.meal.foods[index].icon),
                    fontFamily: 'MaterialIcons'),
              ),
              trailing: GestureDetector(
                child: Icon(Icons.delete),
                onTap: () => setState(() => widget.meal.foods.removeAt(index)),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              widget.meal.mealType = mealTypeController.text;
              mealController.updateMeal(MealDTO.fromMeal(widget.meal));
              Navigator.pop(context);
            },
            child: const Text("Update"),
          )
        ],
      ),
    );
  }
}
