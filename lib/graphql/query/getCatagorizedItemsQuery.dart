class GetCategorizedItems {
  String getCategorizedItems = """
query getOutlet(\$outletId: ObjectId){
getCategorizedItems( outletId:\$outletId) {
message
statusCode
result {
id
name
items{
basePrice
id
meta{
name
description
images{
thumbnail
}

}
}

}
}
}
""";
}
