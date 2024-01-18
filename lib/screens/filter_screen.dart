import 'package:flutter/material.dart';

import 'app_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const screenRoute = '/FilterScreen';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  const FilterScreen(this.currentFilters, this.saveFilters, {super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _summer = false;
  var _winter = false;
  var _family = false;

  @override
  void initState() {
    _summer = widget.currentFilters['summer']!;
    _winter = widget.currentFilters['winter']!;
    _family = widget.currentFilters['family']!;
    super.initState();
  }

  Widget buildSwitchListTile(String title, String subTitle, bool currentValue,
      Function(bool) updateValue) {
    return SwitchListTile(
      activeColor: Theme.of(context).colorScheme.secondary,
      title: Text(title),
      subtitle: Text(subTitle),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Filter',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'summer': _summer,
                'winter': _winter,
                'family': _family,
              };
              widget.saveFilters(selectedFilters);
            },
          )
        ],
      ),
      body: Column(
        children: [
          buildSwitchListTile(
              'Winter trips', 'Show \'winter\' trips only', _winter,
              (newValue) {
            setState(() {
              _winter = newValue;
            });
          }),
          buildSwitchListTile(
              'Summer trips', 'Show \'summer\' trips only', _summer,
              (newValue) {
            setState(() {
              _summer = newValue;
            });
          }),
          buildSwitchListTile(
              '\'For family\' trips', 'Show \'for family\' trips only', _family,
              (newValue) {
            setState(() {
              _family = newValue;
            });
          }),
        ],
      ),
      drawer: const AppDrawer(),
    );
  }
}
