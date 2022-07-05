
class OutletQuery{
String getOutlet = """
query getOutlet(\$outletId: ObjectId){
  getOutlet(outletId:\$outletId) {
    message
    statusCode
    result {
      id
      restaurant{
        name
      }
      meta{
        name
        address
        images{
          cover
          logo
        }
      }
      totalFavorite
      averageFoodPreparationTime
      estimatedDeliveryTime
      cuisines{
        name
      }
      location
      isFavorite
      isOpen
      openingTime
      deliveryFee
      estimatedDeliveryTimeInMillis
      isTopOutlet
      rating
      totalRating
      zone{
        name
        id
      }
      hourlyOrderLimitFor{
        startTime
        endTime
      }
      deals{
        title
      }
    }
  }
}
""";
}
