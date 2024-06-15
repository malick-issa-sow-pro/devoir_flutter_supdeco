import '/app_properties.dart';
import '/models/product.dart';
import '/screens/product/product_page.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/material.dart';

class RecommendedList extends StatelessWidget {
  List<Product> products = [
    Product('assets/bag_1.png', 'Bag', 'Beau sac', 20000),
    Product('assets/cap_5.png', 'Casquette', 'Casquette avec un beau design', 1000),
    Product('assets/jeans_1.png', 'jean', 'Un jean pour toi', 2000),
    Product('assets/womanshoe_3.png', 'Chaussures femme',
        'Chaussures avec remise spéciale', 3000),
    Product('assets/bag_10.png', 'Sac Express', 'Sac pour vos boutiques', 4000),
    Product('assets/jeans_3.png', 'jean', 'jean avec un beau design', 10000),
    Product('assets/ring_1.png', 'Silver Ring', 'Description', 5000),
    Product('assets/shoeman_7.png', 'Chaussures', 'Description', 6000),
    Product('assets/headphone_9.png', 'Écouteurs', 'Description', 7000),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 20,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              IntrinsicHeight(
                child: Container(
                  margin: const EdgeInsets.only(left: 16.0, right: 8.0),
                  width: 4,
                  color: mediumYellow,
                ),
              ),
              Center(
                  child: Text(
                'Recommandé',
                style: TextStyle(
                    color: darkGrey,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              )),
            ],
          ),
        ),
        Flexible(
          child: Container(
            padding: EdgeInsets.only(top: 16.0, right: 16.0, left: 16.0),
            child: MasonryGridView.count(
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              crossAxisCount: 4,
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) => new ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: InkWell(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => ProductPage(product: products[index]))),
                  child: Container(
                      decoration: BoxDecoration(
                        gradient: RadialGradient(
                            colors: [
                              Colors.grey.withOpacity(0.3),
                              Colors.grey.withOpacity(0.7),
                            ],
                            center: Alignment(0, 0),
                            radius: 0.6,
                            focal: Alignment(0, 0),
                            focalRadius: 0.1),
                      ),
                      child: Hero(
                          tag: products[index].image,
                          child: Image.asset(products[index].image))),
                ),
              ),
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
            ),
          ),
        ),
      ],
    );
  }
}
