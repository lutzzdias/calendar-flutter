import 'package:calendar/Domain/DTOs/Meal/meal_dto.dart';
import 'package:calendar/Domain/Models/meal.dart';
import 'package:calendar/Presentation/Controllers/Meal/meal_controller.dart';
import 'package:calendar/Presentation/Pages/edit_page.dart';
import 'package:calendar/Presentation/Widgets/DayPage/meal_button.dart';
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
            MealButton(
              title: "Café da manhã",
              icon: const Icon(Icons.breakfast_dining),
              date: widget.date,
              mealType: "breakfast",
              mealController: mealController,
            ),
            showMeal(context, breakfast, mealController),
            MealButton(
              title: "Almoço",
              icon: const Icon(Icons.lunch_dining),
              date: widget.date,
              mealType: "lunch",
              mealController: mealController,
            ),
            showMeal(context, lunch, mealController),
            MealButton(
              title: "Jantar",
              icon: const Icon(Icons.dinner_dining),
              date: widget.date,
              mealType: "dinner",
              mealController: mealController,
            ),
            showMeal(context, dinner, mealController),
            MealButton(
              title: "Lanche",
              icon: const Icon(Icons.fastfood),
              date: widget.date,
              mealType: "snack",
              mealController: mealController,
            ),
            showMeal(context, snack, mealController),
          ],
        ),
      ),
    );
  }

  List<MealDTO> getBreakfast(MealController mealController) {
    return mealController
        .getAllMeals()
        .where((element) => element.mealType == "breakfast")
        .where(
          (element) => element.date == widget.date,
        )
        .toList();
  }

  List<MealDTO> getLunch(MealController mealController) {
    return mealController
        .getAllMeals()
        .where((element) => element.mealType == "lunch")
        .where(
          (element) => element.date == widget.date,
        )
        .toList();
  }

  List<MealDTO> getDinner(MealController mealController) {
    return mealController
        .getAllMeals()
        .where((element) => element.mealType == "dinner")
        .where(
          (element) => element.date == widget.date,
        )
        .toList();
  }

  List<MealDTO> getSnacks(MealController mealController) {
    return mealController
        .getAllMeals()
        .where((element) => element.mealType == "snack")
        .where(
          (element) => element.date == widget.date,
        )
        .toList();
  }

  Widget showMeal(BuildContext context, List<MealDTO> meals,
      MealController mealController) {
    return meals.isNotEmpty
        ? Container(
            padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // TODO: Make button extend to occupy as much space as possible
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditPage(
                        meal: meals.first.toMeal(),
                      ),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(meals.first.id.toString()),
                      Text(meals.first.mealType),
                      Text(meals.first.date.toString()),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () =>
                      setState(() => mealController.deleteMeal(meals.first.id)),
                )
              ],
            ),
          )
        : const SizedBox(height: 10);
  }
}
