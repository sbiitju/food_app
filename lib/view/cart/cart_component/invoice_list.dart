import 'package:flutter/material.dart';
import 'package:food_app/util/function.dart';
import 'package:food_app/view/cart/cart_component/big_textview.dart';

import '../../component/customized_container.dart';
import '../model/invoice_model.dart';

class CartInvoiceList extends StatelessWidget {
  final List<InvoiceModel> invoiceModelList;

  const CartInvoiceList({Key? key, required this.invoiceModelList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomizedContainer(
      color: Theme.of(context).backgroundColor,
      maxHeight: getScreenHeight(context),
      maxWidth: getScreenWidth(context),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
                    itemCount: invoiceModelList.length,
                    itemBuilder: (context, itemCount) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(invoiceModelList[itemCount].costName),
                            ),
                            Text(invoiceModelList[itemCount].costAmount),
                          ],
                        ),
                      );
                    }),
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BigTextView(text: "Total"),
                  BigTextView(text: "Tk. 2021.00")
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
