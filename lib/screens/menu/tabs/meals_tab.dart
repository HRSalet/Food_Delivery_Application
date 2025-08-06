import 'package:flutter/material.dart';

import '../../../models/menu_model.dart';
import '../food_detail_screen.dart';

class MealsTab extends StatefulWidget {
  const MealsTab({super.key});

  @override
  State<MealsTab> createState() => _MealsTabState();
}

class _MealsTabState extends State<MealsTab> {
  final List<MenuModel> meals = [
    MenuModel(
      name: "Fresh Prawn Ceviche",
      desc: "Shrimp marinated in tasty lime juice",
      img: "assets/images/menu/snack3.png",
      price: 14.99,
      otherDesc:
          "A refreshing medley of plump, succulent shrimp and tender white seafood (possibly squid or scallops), tossed with thinly sliced red onions, juicy cherry tomatoes, and fresh herbs (like cilantro or parsley). Brightened with zesty lemon wedges, this dish is a light and vibrant seafood delight.",
    ),
    MenuModel(
      name: "Chicken Burger",
      desc: "Tender grilled chicken breast, topped with crisp lettuce",
      img: "assets/images/menu/snack4.png",
      price: 12.99,
      otherDesc:
          "A juicy grilled chicken patty, topped with melted cheese, crisp lettuce, fresh tomato slices, and tangy pickles, all served on a toasted sesame seed bun.",
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
                      foodName: meals[index].name,
                      foodPrice: meals[index].price,
                      foodImage: meals[index].img,
                      foodDescription: meals[index].desc,
                      otherFoodDescription: meals[index].otherDesc,
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
                      image: AssetImage(meals[index].img),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      meals[index].name,
                      style: TextStyle(
                        fontFamily: 'LeagueSpartan',
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "\$${meals[index].price.toString()}",
                      style: TextStyle(
                        fontFamily: 'LeagueSpartan',
                        fontSize: 18,
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
                Text(
                  meals[index].desc,
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
        itemCount: meals.length,
      ),
    );
  }
}
