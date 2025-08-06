import 'package:flutter/material.dart';

import '../../../models/menu_model.dart';
import '../food_detail_screen.dart';

class DessertsTab extends StatefulWidget {
  const DessertsTab({super.key});

  @override
  State<DessertsTab> createState() => _DessertsTabState();
}

class _DessertsTabState extends State<DessertsTab> {
  final List<MenuModel> desserts = [
    MenuModel(
      name: "Chocolate Brownie",
      desc: "Premium cocoa, melted chocolate",
      img: "assets/images/menu/snack7.png",
      price: 24.99,
      otherDesc:
          "Rich, fudgy chocolate brownies swirled with a creamy (possibly cheesecake or white chocolate) layer, generously topped with crunchy nuts and chocolate chips. A perfect sweet treat!",
    ),
    MenuModel(
      name: "Macarons",
      desc: "Delicate vanilla and chocolate macarons",
      img: "assets/images/menu/snack8.png",
      price: 49.99,
      otherDesc:
          "A delightful stack of delicate French macarons in a variety of pastel colors and flavors, featuring crisp shells and creamy fillings. A perfect elegant treat.",
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
                      foodName: desserts[index].name,
                      foodPrice: desserts[index].price,
                      foodImage: desserts[index].img,
                      foodDescription: desserts[index].desc,
                      otherFoodDescription: desserts[index].otherDesc,
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
                      image: AssetImage(desserts[index].img),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      desserts[index].name,
                      style: TextStyle(
                        fontFamily: 'LeagueSpartan',
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "\$${desserts[index].price.toString()}",
                      style: TextStyle(
                        fontFamily: 'LeagueSpartan',
                        fontSize: 18,
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
                Text(
                  desserts[index].desc,
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
        itemCount: desserts.length,
      ),
    );
  }
}
