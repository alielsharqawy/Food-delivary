import 'package:app/constant/app_color.dart';
import 'package:app/data/models/home_models.dart';
import 'package:app/presentation/home/widgets/category_item_widget.dart';
import 'package:app/presentation/home/widgets/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:app/constant/app_images.dart';
import 'package:app/constant/app_typography.dart';
import 'package:app/constant/app_size.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Category> categories = [
    Category(label: "Burger", emoji: "🍔"),
    Category(label: "Taco", emoji: "🌮"),
    Category(label: "Drink", emoji: "🥤"),
    Category(label: "Pizza", emoji: "🍕"),
  ];

  final List<Product> products = [
    Product(
      name: "Ordinary Burgers",
      imageUrl: "https://i.imgur.com/0umadnY.jpg",
      rating: 4.9,
      time: "190m",
      price: "\$17,230",
    ),
    Product(
      name: "Burger With Meat",
      imageUrl: "https://i.imgur.com/1pB3F1j.jpg",
      rating: 4.9,
      time: "190m",
      price: "\$17,230",
    ),
    Product(
      name: "Chicken Burger",
      imageUrl: "https://i.imgur.com/AItCxSs.jpg",
      rating: 4.7,
      time: "180m",
      price: "\$14,500",
    ),
    Product(
      name: "Double Cheese",
      imageUrl: "https://i.imgur.com/KZsmUi2l.jpg",
      rating: 4.8,
      time: "200m",
      price: "\$19,800",
    ),
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  AppImages.homeImage,
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),
                SafeArea(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppResponsive.getWidth(context, 5),
                      vertical: AppResponsive.getHeight(context, 1),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Your Location",
                                      style: AppTypography.bodyMediumRegular
                                          .copyWith(color: AppColors.neutral10),
                                    ),
                                    SizedBox(
                                      width: AppResponsive.getWidth(context, 2),
                                    ),
                                    Icon(
                                      Icons.arrow_drop_down_outlined,
                                      color: AppColors.neutral10,
                                      size: AppResponsive.getIconSize(
                                        context,
                                        20,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: AppResponsive.getHeight(context, 2),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: AppColors.neutral10,
                                      size: AppResponsive.getIconSize(
                                        context,
                                        20,
                                      ),
                                    ),
                                    SizedBox(
                                      width: AppResponsive.getWidth(context, 2),
                                    ),
                                    Text(
                                      "New York City",
                                      style: AppTypography.bodyLargeBold
                                          .copyWith(color: AppColors.neutral10),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                _buildCircleIcon(context, Icons.search),
                                const SizedBox(width: 10),
                                _buildCircleIcon(
                                  context,
                                  Icons.notifications_none,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: AppResponsive.getHeight(context, 3)),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 40),
                          child: Text(
                            "Provide the best\nfood for you",
                            style: AppTypography.heading4Bold.copyWith(
                              color: AppColors.neutral10,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // Category Section
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppResponsive.getWidth(context, 5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Find By Category",
                        style: AppTypography.bodyLargeBold,
                      ),
                      const Spacer(),
                      Text("See All", style: AppTypography.bodyMediumRegular),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 110,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return CategoryItem(
                          category: categories[index],
                          isSelected: index == selectedIndex,
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            // Product Grid
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppResponsive.getWidth(context, 5),
              ),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  return ProductCard(product: products[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCircleIcon(BuildContext context, IconData icon) {
    final double iconSize = AppResponsive.getIconSize(context, 20);
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.neutral10),
      ),
      child: Icon(icon, color: AppColors.neutral10, size: iconSize),
    );
  }
}
