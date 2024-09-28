import 'package:flutter/material.dart';
import 'package:mealz/data/dummy_data.dart';
import 'package:mealz/models/category.dart';
import 'package:mealz/screens/meals.dart';
import 'package:mealz/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _selectCategory(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (ctx) => MealsScreen(title: 'some title', meals: [])),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pick your Categories'),
      ),
      body: GridView(
        padding: EdgeInsets.all(24),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: [
          //availableCategories.map((category)=> CategoryGridItem(category:)).toList();
          for (final category in availableCategories)
            CategoryGridItem(
              category: category,
              onSelectCategory: () {
                _selectCategory(context);
              },
            ),
        ],
      ),
    );
  }
}
