import 'package:flutter/material.dart';

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
          child: Text(
            invoiceModelList[index].title,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
        Text(
          invoiceModelList[index].amount.toString(),
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
