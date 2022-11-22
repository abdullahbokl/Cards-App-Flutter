import 'package:flutter/material.dart';
import 'package:cards/widgets/categoy_item.dart';
import '../category_data.dart';

class CategoriesScreen extends StatefulWidget {

  static const screenRoute = '/CategoriesScreen';

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(10),

        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 7/8,
        ),
        children: Categories_data.map((categoryData) => CategoryItem(
                categoryData.id, categoryData.title, categoryData.imageUrl))
            .toList(),
    );
  }
}
