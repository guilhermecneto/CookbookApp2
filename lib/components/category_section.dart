import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../models/restaurant.dart';
import '../models/food_category.dart';

class CategorySection extends StatelessWidget {
  final List<FoodCategory> foodCategories;
  CategorySection(this.foodCategories);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Categorias",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(
          height: 230,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: foodCategories.length,
            itemBuilder: (context, index) {
              final FoodCategories = foodCategories[index];

              return SizedBox(
                width: 300,
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
                        child: AspectRatio(
                          aspectRatio: 2,
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Container(
                                child: Image.asset(
                                  foodCategories.imageUrl,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                  top: 4.0,
                                  right: 4.0,
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.favorite,
                                    ),
                                    iconSize: 30,
                                    color: Colors.redAccent,
                                  ))
                            ],
                          ),
                        ),
                      ),
                      ListTile(
                        title: Text(
                          foodCategories.name,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        subtitle: Text(
                          foodCategories.numberOfRestaurants,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        onTap: () {
                          print("Clicou em ${foodCategories.name}");
                        },
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}

extension on List<FoodCategory> {
  String get numberOfRestaurants => this.numberOfRestaurants;

  String get name => this.name;

  String get imageUrl => this.imageUrl;
}


