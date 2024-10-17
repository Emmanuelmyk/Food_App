import 'package:flutter/material.dart';
import 'package:mealz/screens/tabs.dart';
import 'package:mealz/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _gluttenFreeFilterSet = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
      ),
      drawer: MainDrawer(onSelectScreen: (identifier) {
        Navigator.of(context).pop();
        if (identifier == 'meals') {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => TabsScreen(),
            ),
          );
        }
      }),
      body: Column(
        children: [
          SwitchListTile(
            value: _gluttenFreeFilterSet,
            onChanged: (isChecked) {
              setState(() {
                _gluttenFreeFilterSet = isChecked;
              });
            },
            title: Text(
              'Glutten- free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            subtitle: Text(
              'Only include glutten-free meals.',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.only(
              left: 34,
              right: 22,
            ),
          )
        ],
      ),
    );
  }
}
