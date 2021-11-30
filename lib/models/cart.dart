import 'package:example_app/models/product.dart';
import 'package:example_app/utils/info.dart';

class Cart{
  final Product product;
  final int numOfItems;

  Cart(this.product, this.numOfItems);
}

List<Cart> demoCarts = [
  Cart(promos[0], 1),
  Cart(promos[2], 2)
];