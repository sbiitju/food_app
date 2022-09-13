import 'package:flutter/material.dart';
import 'package:food_app/util/function.dart';
import 'package:food_app/view/cart/cart_component/big_textview.dart';

import '../model/cart/cart_invoice.dart';
import 'invoice_card_component.dart';

class CartInvoiceList extends StatelessWidget {
  final List<CartInvoice> invoiceModelList;

  const CartInvoiceList({Key? key, required this.invoiceModelList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          border: Border.all(color: Theme.of(context).dividerColor),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Wrap(
          children: [
            BigTextView(text: "Invoice"),
            const SizedBox(
              height: 10,
            ),
            const Divider(),
            ConstrainedBox(
              constraints: BoxConstraints(
                  maxHeight: getScreenHeight(context), minHeight: 30),
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: invoiceModelList.length - 1,
                  itemBuilder: (context, itemCount) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: InvoiceCardComponent(
                        invoiceModelList: invoiceModelList,
                        index: itemCount,
                      ),
                    );
                  }),
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BigTextView(
                    text: invoiceModelList[invoiceModelList.length - 1].title),
                BigTextView(
                    text:
                        "Tk. ${invoiceModelList[invoiceModelList.length - 1].amount}")
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
