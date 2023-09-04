import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vet_app/components/my_bottom_nav_bar.dart';
import 'package:flutter_vet_app/components/product.dart';
import 'package:flutter_vet_app/constants.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

List<Map> forYouProducts = [
  {
    "image": "images/dog-food.jpg",
    "name": "Rocco Rolls Chew Sticks",
    "price": "4.69",
    "isFavorite": false,
  },
  {
    "image": "images/cat-food.jpg",
    "name": "Rocco Classic 6 x 800g",
    "price": "15.82",
    "isFavorite": true,
  },
  {
    "image": "images/dog-food.jpg",
    "name": "Really good dog food here",
    "price": "12.59",
    "isFavorite": false,
  },
];

class _ProductScreenState extends State<ProductScreen>
    with TickerProviderStateMixin {
  late TabController tabController;
  int currentTab = 0;

  @override
  void initState() {
    tabController = TabController(
      initialIndex: 0,
      length: 4,
      vsync: this,
    );
    tabController.addListener(_handleTabSelection);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.white, // Change Background color
        systemNavigationBarIconBrightness: Brightness.dark, // Change Icon color
      ),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text("Products", style: kLargeHeading),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: kOrange.withOpacity(.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: "20% ",
                            style: kDiscountText,
                          ),
                          TextSpan(
                            text: "Discount onlt for mobile app users",
                            style: kDiscountText.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        "For You",
                        style: kLargeLabel,
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 200,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: forYouProducts.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Container(
                              width: 150,
                              margin: const EdgeInsets.only(right: 10),
                              padding: const EdgeInsets.only(
                                top: 10,
                                left: 10,
                                right: 10,
                              ),
                              decoration: BoxDecoration(
                                  color: const Color(0xFFf0edec),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Stack(
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 100,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                forYouProducts[index]["image"]),
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                      Text(forYouProducts[index]["name"],
                                          style: const TextStyle(
                                            fontFamily: 'Open Sans',
                                            fontSize: 13,
                                            height: 1.2,
                                          )),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "\$${forYouProducts[index]['price']}",
                                            style: const TextStyle(
                                                fontFamily: 'Open Sans',
                                                fontSize: 13,
                                                color: kDarkGray,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {},
                                            style: kSmallButton,
                                            child: const Text("Add",
                                                style: TextStyle(
                                                  fontFamily: 'Open Sans',
                                                  color: Colors.white,
                                                )),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Positioned(
                                    right: 0,
                                    child: Icon(
                                      forYouProducts[index]["isFavorite"] ==
                                              true
                                          ? Icons.favorite
                                          : Icons.favorite_outline,
                                      color: forYouProducts[index]
                                                  ["isFavorite"] ==
                                              true
                                          ? Colors.red
                                          : kLightGray,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Catalog",
                            style: kLargeLabel,
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: kButton,
                            child: Text('See All', style: kButtonText),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFdedcdb),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TabBar(
                          labelColor: kOrange,
                          labelPadding: EdgeInsets.zero,
                          unselectedLabelColor: kMediumGray,
                          indicatorSize: TabBarIndicatorSize.label,
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            border: Border.all(
                              color: kOrange,
                            ),
                          ),
                          controller: tabController,
                          tabs: const [
                            Tab(
                              height: 30,
                              child: SizedBox(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text('Cat', style: kTabText),
                                ),
                              ),
                            ),
                            Tab(
                              height: 30,
                              child: SizedBox(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text('Dog', style: kTabText),
                                ),
                              ),
                            ),
                            Tab(
                              height: 30,
                              child: SizedBox(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text('Bird', style: kTabText),
                                ),
                              ),
                            ),
                            Tab(
                              height: 30,
                              child: SizedBox(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text('Other', style: kTabText),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      _getTabAtIndex(currentTab),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: const MyBottomNavBar(selectedIndex: 2),
      ),
    );
  }

  _handleTabSelection() {
    setState(() {
      currentTab = tabController.index;
    });
  }

  Widget _getTabAtIndex(int index) {
    var list = [
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(
            'Food',
            style: kLargeLabel.copyWith(fontSize: 16),
          ),
          const SizedBox(
            height: 10,
          ),
          const Product(
              image: 'images/dog-food.jpg',
              description: "Rocco Rolls Chew Sticks\nRice & Lamb",
              price: "4.49"),
          const Product(
            image: 'images/dog-food.jpg',
            description: "Rocco Rolls Chew Sticks\nRice & Lamb",
            price: "4.49",
            isFavorite: true,
          ),
          const Product(
              image: 'images/dog-food.jpg',
              description: "Rocco Rolls Chew Sticks\nRice & Lamb",
              price: "4.49"),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(
            'Food',
            style: kLargeLabel.copyWith(fontSize: 16),
          ),
          const SizedBox(
            height: 10,
          ),
          const Product(
              image: 'images/cat-food.jpg',
              description: "Rocco Rolls Chew Sticks\nRice & Lamb",
              price: "4.49"),
          const Product(
            image: 'images/dog-food.jpg',
            description: "Rocco Rolls Chew Sticks\nRice & Lamb",
            price: "4.49",
            isFavorite: true,
          ),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(
            'Food',
            style: kLargeLabel.copyWith(fontSize: 16),
          ),
          const SizedBox(
            height: 10,
          ),
          const Product(
              image: 'images/dog-food.jpg',
              description: "Rocco Rolls Chew Sticks\nRice & Lamb",
              price: "4.49"),
          const Product(
            image: 'images/dog-food.jpg',
            description: "Rocco Rolls Chew Sticks\nRice & Lamb",
            price: "4.49",
            isFavorite: true,
          ),
          const Product(
              image: 'images/dog-food.jpg',
              description: "Rocco Rolls Chew Sticks\nRice & Lamb",
              price: "4.49"),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(
            'Food',
            style: kLargeLabel.copyWith(fontSize: 16),
          ),
          const SizedBox(
            height: 10,
          ),
          const Product(
              image: 'images/cat-food.jpg',
              description: "Rocco Rolls Chew Sticks\nRice & Lamb",
              price: "4.49"),
          const Product(
            image: 'images/dog-food.jpg',
            description: "Rocco Rolls Chew Sticks\nRice & Lamb",
            price: "4.49",
            isFavorite: true,
          ),
        ],
      ),
    ];
    return list[index];
  }
}
