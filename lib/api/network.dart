import 'package:http/http.dart';

class Network {
  final String url;
  //2
  Network(this.url);

  // 3
  Future getData() async {
    print('Calling uri: $url');
    // 4
    Response response = await get(Uri.parse(url));
    // 5
    if (response.statusCode == 200) {
      // 6
      return response.body;
    } else {
      print(response.statusCode);
    }
  }
}