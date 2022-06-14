import 'network.dart';

const String apiKey = 'e876f325-0296-489f-9ade-af2d393352cf';
//1
const String catAPIURL = 'https://api.thecatapi.com/v1/breeds?';
// 2
const String catImageAPIURL = 'https://api.thecatapi.com/v1/images/search?';
// 3
const String breedString = 'breed_id=';
// 4
const String apiKeyString = 'x-api-key=$apiKey';

class CatAPI {
  // 5
  Future<dynamic> getCatBreeds() async {
    // 6
    Network network = Network('$catAPIURL$apiKeyString');
    // 7
    var catData = await network.getData();
    return catData;
  }
  // 8
  Future<dynamic> getCatBreed(String breedName) async {
    Network network =
    Network('$catImageAPIURL$breedString$breedName&$apiKeyString');
    var catData = await network.getData();
    return catData;
  }
}