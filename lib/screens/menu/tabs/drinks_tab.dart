import 'package:flutter/material.dart';

import '../../../models/menu_model.dart';
import '../food_detail_screen.dart';

class DrinksTab extends StatefulWidget {
  const DrinksTab({super.key});

  @override
  State<DrinksTab> createState() => _DrinksTabState();
}

class _DrinksTabState extends State<DrinksTab> {
  final drinks = <MenuModel>[
    MenuModel(
      name: "Mojito",
      desc: "Made with white rum and mint leaves",
      img: "assets/images/menu/snack9.png",
      price: 4.99,
      otherDesc: "A vibrant and cooling cocktail featuring muddled fresh mint leaves, lime wedges, crushed ice, and a splash of soda water, garnished with a lime slice and more mint.",
    ),
    MenuModel(
      name: "Iced Coffee",
      desc: "Espresso, chilled milk",
      img: "assets/images/menu/snack10.png",
      price: 9.99,
      otherDesc: "A glass of chilled coffee layered with a generous pour of cream or milk, creating beautiful swirling patterns, topped with ice.",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.separated(
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return FoodDetailScreen(
                      foodName: drinks[index].name,
                      foodPrice: drinks[index].price,
                      foodImage: drinks[index].img,
                      foodDescription: drinks[index].desc,
                      otherFoodDescription: drinks[index].otherDesc,
                    );
                  },
                ),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 323,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    image: DecorationImage(
                      image: AssetImage(drinks[index].img),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      drinks[index].name,
                      style: TextStyle(
                        fontFamily: 'LeagueSpartan',
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "\$${drinks[index].price.toString()}",
                      style: TextStyle(
                        fontFamily: 'LeagueSpartan',
                        fontSize: 18,
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
                Text(
                  drinks[index].desc,
                  style: TextStyle(
                    fontFamily: 'LeagueSpartan',
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(thickness: 0.5, color: Colors.deepOrange);
        },
        itemCount: drinks.length,
      ),
    );
  }
}
