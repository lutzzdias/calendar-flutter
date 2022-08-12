import 'package:calendar/Domain/DTOs/Meal/create_meal_dto.dart';
import 'package:calendar/Domain/DTOs/Meal/meal_dto.dart';
import 'package:calendar/Presentation/Controllers/Meal/meal_controller.dart';
import 'package:calendar/Presentation/Pages/edit_page.dart';
import 'package:calendar/Presentation/Pages/meal_page.dart';
import 'package:calendar/Presentation/Widgets/DayPage/meal_button.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DayPage extends StatefulWidget {
  final DateTime date;

  const DayPage({Key? key, required this.date}) : super(key: key);

  @override
  State<DayPage> createState() => _DayPageState();
}

class _DayPageState extends State<DayPage> {
  @override
  Widget build(BuildContext context) {
    final mealController = Provider.of<MealController>(context);
    var breakfast = getBreakfast(mealController);
    var lunch = getLunch(mealController);
    var dinner = getDinner(mealController);
    var snack = getSnacks(mealController);

    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.date.day}"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 10),
            MealButton(
              title: "Café da manhã",
              icon: const Icon(Icons.breakfast_dining),
              date: widget.date,
              mealType: "breakfast",
              mealController: mealController,
              onPressed: () => createMeal(mealController, "breakfast"),
            ),
            showMeal(context, breakfast, mealController),
            MealButton(
              title: "Almoço",
              icon: const Icon(Icons.lunch_dining),
              date: widget.date,
              mealType: "lunch",
              mealController: mealController,
              onPressed: () => createMeal(mealController, "lunch"),
            ),
            showMeal(context, lunch, mealController),
            MealButton(
              title: "Jantar",
              icon: const Icon(Icons.dinner_dining),
              date: widget.date,
              mealType: "dinner",
              mealController: mealController,
              onPressed: () => createMeal(mealController, "dinner"),
            ),
            showMeal(context, dinner, mealController),
            MealButton(
              title: "Lanche",
              icon: const Icon(Icons.fastfood),
              date: widget.date,
              mealType: "snack",
              mealController: mealController,
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MealPage(
                    mealType: "snack",
                    date: widget.date,
                  ),
                ),
              ),
            ),
            showMeal(context, snack, mealController),
          ],
        ),
      ),
    );
  }

  MealDTO? getBreakfast(MealController mealController) {
    return mealController.getAllMeals().firstWhereOrNull((element) =>
        element.mealType == "breakfast" && element.date == widget.date);
  }

  MealDTO? getLunch(MealController mealController) {
    return mealController.getAllMeals().firstWhereOrNull((element) =>
        element.mealType == "lunch" && element.date == widget.date);
  }

  MealDTO? getDinner(MealController mealController) {
    return mealController.getAllMeals().firstWhereOrNull((element) =>
        element.mealType == "dinner" && element.date == widget.date);
  }

  MealDTO? getSnacks(MealController mealController) {
    return mealController.getAllMeals().firstWhereOrNull((element) =>
        element.mealType == "snack" && element.date == widget.date);
  }

  Widget showMeal(
      BuildContext context, MealDTO? meal, MealController mealController) {
    return meal != null
        ? Container(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditPage(
                          meal: meal.toMeal(),
                        ),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text("ID = ${meal.id.toString()}"),
                        Text("MealType = ${meal.mealType}"),
                        Text("Date = ${meal.date.toString()}"),
                      ],
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () =>
                      setState(() => mealController.deleteMeal(meal.id)),
                )
              ],
            ),
          )
        : const SizedBox(height: 10);
  }

  createMeal(MealController mealController, String mealType) {
    setState(
      () => mealController.createMeal(
        CreateMealDTO(date: widget.date, mealType: mealType),
      ),
    );
  }
}

/*
MealButton(
              title: "Lanche",
              icon: const Icon(Icons.fastfood),
              date: widget.date,
              mealType: "snack",
              mealController: mealController,
              onPressed: () => createMeal(mealController, "snack"),
            ),
 */
