import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/menu_model.dart';
import 'package:food_delivery_app/screens/menu/food_detail_screen.dart';

class SnacksTab extends StatefulWidget {
  const SnacksTab({super.key});

  @override
  State<SnacksTab> createState() => _SnacksTabState();
}

class _SnacksTabState extends State<SnacksTab> {
  final List<MenuModel> snacks = [
    MenuModel(
      name: "Mexican Appetizer",
      desc: "Tortilla Chips with Toppings",
      img: "assets/images/menu/snack1.png",
      price: 49.99,
      otherDesc:
          "Crispy tortilla chips served with savory cheese dip, fresh salsa, and creamy guacamole. Shareable platter of crunchy tortilla chips with our irresistible cheese dip, homemade salsa, and fresh guacamole.",
    ),
    MenuModel(
      name: "Pork Skewer",
      desc: "Marinated in a rich blend of herbs and spices",
      img: "assets/images/menu/snack2.png",
      price: 59.99,
      otherDesc:
          "Juicy grilled pork and vibrant red bell peppers, perfectly seasoned and served with a fresh herb dipping sauce. Tender, marinated pork and sweet red bell peppers, charred to perfection. Paired with a zesty green herb sauce for a burst of flavor.",
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
                      foodName: snacks[index].name,
                      foodPrice: snacks[index].price,
                      foodImage: snacks[index].img,
                      foodDescription: snacks[index].desc,
                      otherFoodDescription: snacks[index].otherDesc,
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
                      image: AssetImage(snacks[index].img),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      snacks[index].name,
                      style: TextStyle(
                        fontFamily: 'LeagueSpartan',
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "\$${snacks[index].price.toString()}",
                      style: TextStyle(
                        fontFamily: 'LeagueSpartan',
                        fontSize: 18,
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
                Text(
                  snacks[index].desc,
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
        itemCount: snacks.length,
      ),
    );
  }
}
