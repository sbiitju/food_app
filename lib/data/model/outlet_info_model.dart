class OutletInfoModel {
  String? id;
  String? restaurantName;
  String? outletName;
  String? address;
  String? coverUrl;
  String? logoUrl;
  int? averageFoodPreparationTime;
  String? totalFavorite;
  String? estimatedDeliveryTime;
  var cuisines = <String?>[];
  bool? isFavorite;
  bool isOpen;
  String? deliveryFee;
  var rating;
  int? totalRating;

  OutletInfoModel(
      this.id,
      this.restaurantName,
      this.outletName,
      this.address,
      this.coverUrl,
      this.logoUrl,
      this.averageFoodPreparationTime,
      this.totalFavorite,
      this.estimatedDeliveryTime,
      this.cuisines,
      this.isFavorite,
      this.isOpen,
      this.deliveryFee,
      this.rating,
      this.totalRating);
}
