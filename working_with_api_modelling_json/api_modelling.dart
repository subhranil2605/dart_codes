import 'product.dart';

void main() async {
  var products = await RemoteService.fetchProducts();
  
  for (int i = 0; i < products!.length; i++) {
    print("${products[i].id}: ${products[i].websiteLink}");
  }
}
