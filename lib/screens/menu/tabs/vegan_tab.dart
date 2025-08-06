import 'package:flutter/material.dart';

import '../../../models/menu_model.dart';
import '../food_detail_screen.dart';

class VeganTab extends StatefulWidget {
  const VeganTab({super.key});

  @override
  State<VeganTab> createState() => _VeganTabState();
}

class _VeganTabState extends State<VeganTab> {
  final List<MenuModel> vegan = [
    MenuModel(
      name: "Mushroom Risotto",
      desc: "Creamy mushroom risotto",
      img: "assets/images/menu/snack5.png",
      price: 39.99,
      otherDesc:
          "A comforting dish featuring creamy mushroom risotto with Arborio rice, generously topped with sautéed mushrooms, wilted spinach, and fresh microgreens. Finished with a savory sauce drizzle.",
    ),
    MenuModel(
      name: "Broccoli Lasagna",
      desc: "Tender broccoli florets",
      img: "assets/images/menu/snack6.png",
      price: 19.99,
      otherDesc:
          "Layers of tender pasta, rich tomato sauce, creamy béchamel, melted cheese, and a vibrant blend of broccoli and spinach, baked to golden perfection. Garnished with fresh basil.",
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
                      foodName: vegan[index].name,
                      foodPrice: vegan[index].price,
                      foodImage: vegan[index].img,
                      foodDescription: vegan[index].desc,
                      otherFoodDescription: vegan[index].otherDesc,
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
                      image: AssetImage(vegan[index].img),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      vegan[index].name,
                      style: TextStyle(
                        fontFamily: 'LeagueSpartan',
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "\$${vegan[index].price.toString()}",
                      style: TextStyle(
                        fontFamily: 'LeagueSpartan',
                        fontSize: 18,
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
                Text(
                  vegan[index].desc,
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
        itemCount: vegan.length,
      ),
    );
  }
}
