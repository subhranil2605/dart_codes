import 'package:http/http.dart' as http;
import 'dart:convert';

void main() async {
  final client = http.Client();

  final String breedName = "husky";
  
  final response = await client.get(Uri.parse("https://dog.ceo/api/breed/$breedName/images"));

  if (response.statusCode == 200) {
    var jsonString = response.body;
    var jsonDecode = json.decode(jsonString);
    if (jsonDecode["status"] == "success") {
      var a = List<String>.from(jsonDecode["message"].map((e) => e));
      print(a);
    } else {
      print("Error!!!")
    }
  } else {
    print("Error!!!!");
  }
}
