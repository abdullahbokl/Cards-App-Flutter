import 'package:cards/screens/app_drawer.dart';
import 'package:cards/screens/categories_screen.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {

  static const screenRoute = '/FilterScreen';

  final Function saveFilters;
  Map<String, bool> currentFliters;

  FilterScreen(this.currentFliters, this.saveFilters);


  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _summer = false;
  var _winter = false;
  var _family = false;

  @override
  void initState() {
    _summer = widget.currentFliters['summer']!;
    _winter = widget.currentFliters['winter']!;
    _family = widget.currentFliters['family']!;
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
          style: Theme.of(context).textTheme.headline6,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: (){
              final selectedFilters = {
                'summer' : _summer,
                'winter' : _winter,
                'family' : _family,
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
          buildSwitchListTile('\'For family\' trips',
              'Show \'for family\' trips only', _family, (newValue) {
            setState(() {
              _family = newValue;
            });
          }),
        ],
      ),
      drawer: AppDrawer(),
    );
  }
}
