class RunningOrder {
  final String getRunningOrder = """
  query getRunningOrders {
    getRunningOrders {
        message
        statusCode
        result {
            count
            orderInfo {
                orderUid
                restaurantName
                currentState
                stateSummary
            }
        }
    }
}
  """;

  final String subscriptions = """
subscription RunningOrders{
    runningOrders {
        count
        orderInfo {
            orderUid
            restaurantName
            currentState
            stateSummary
        }
    }
}

  """;
}
