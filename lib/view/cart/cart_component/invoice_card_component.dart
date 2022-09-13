import 'package:flutter/cupertino.dart';

import '../model/cart/cart_invoice.dart';

class InvoiceCardComponent extends StatelessWidget {
  final int index;

  const InvoiceCardComponent(
      {Key? key, required this.invoiceModelList, required this.index})
      : super(key: key);

  final List<CartInvoice> invoiceModelList;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(invoiceModelList[index].title),
        ),
        Text(invoiceModelList[index].amount.toString()),
      ],
    );
  }
}
