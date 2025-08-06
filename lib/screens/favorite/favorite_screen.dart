import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/favorite_model.dart';
import 'package:food_delivery_app/screens/menu/food_detail_screen.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final List<FavoriteModel> _favoriteItems = [
    FavoriteModel(
      imageUrl: "assets/images/favorite/favorite1.png",
      title: "Chicken Curry",
      description:
          "A savory dish of chicken pieces slow-cooked in a rich, spiced sauce, often served with rice.",
    ),
    FavoriteModel(
      imageUrl: "assets/images/favorite/favorite2.png",
      title: "Chicken Burger",
      description:
          "A popular sandwich featuring a grilled or fried chicken patty, typically served in a bun with various toppings.",
    ),
    FavoriteModel(
      imageUrl: "assets/images/favorite/favorite3.png",
      title: "Broccoli Lasagna",
      description:
          "A comforting baked pasta dish layered with tender lasagna noodles, creamy cheese, and flavorful broccoli.",
    ),
    FavoriteModel(
      imageUrl: "assets/images/favorite/favorite4.png",
      title: "American Appetizer",
      description:
          "Small, flavorful bites, often spicy and vibrant, that kick off a Mexican meal.",
    ),
    FavoriteModel(
      imageUrl: "assets/images/favorite/favorite5.png",
      title: "Buffalo Wings",
      description:
          "Crispy fried chicken wings tossed in a tangy, spicy Buffalo sauce, typically served with a cool dipping sauce.",
    ),
    FavoriteModel(
      imageUrl: "assets/images/favorite/favorite6.png",
      title: "Glass Ice-cream",
      description:
          "A delightful frozen dessert, often layered or swirled with various flavors, presented elegantly in a glass.",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF5CB58),
      body: Stack(
        children: [
          Positioned(
            child: Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                color: Color(0XFFF5F5F5),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    Text(
                      "Its time to buy your favorite dish.",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.deepOrange,
                        fontFamily: 'LeagueSpartan',
                      ),
                    ),
                    SizedBox(height: 24),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16.0,
                          mainAxisSpacing: 16.0,
                          childAspectRatio: 0.7,
                        ),
                        itemCount: _favoriteItems.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ChangeNotifierProvider<FavoriteModel>.value(
                            value: _favoriteItems[index],
                            builder: (context, child) => FavoriteItemCard(),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FavoriteItemCard extends StatelessWidget {
  const FavoriteItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    final FavoriteModel favoriteItem = Provider.of<FavoriteModel>(context);
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) => FoodDetailScreen(
                  foodName: favoriteItem.title,
                  foodPrice: 49.99,
                  foodImage: favoriteItem.imageUrl,
                  foodDescription: favoriteItem.title,
                  otherFoodDescription: favoriteItem.description,
                ),
          ),
        );
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      favoriteItem.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        favoriteItem.isFavorite = !favoriteItem.isFavorite;
                      },
                      child: Container(
                        padding: EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          favoriteItem.isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color:
                              favoriteItem.isFavorite
                                  ? Colors.red
                                  : Colors.grey,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 4.0),
              child: Text(
                favoriteItem.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFE8C00), // Orange/red color
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
              child: Text(
                favoriteItem.description,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
