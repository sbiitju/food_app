void main() async {
  final test = await getFutureName("SHahin");
  print(test);
  print("General");
}

Future<String> getFutureName(String name) {
  return Future.delayed(Duration(seconds: 2), () => name);
}
