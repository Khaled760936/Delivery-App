class Shops {
  final List<dynamic> shops;
  Shops({ required this.shops});
  factory Shops.fromJson(Map<String,dynamic>jsonData){
    return Shops(
      shops: jsonData["shops"]
    );
  }
}