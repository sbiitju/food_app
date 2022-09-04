import 'package:flutter/material.dart';

import '../model/payment_ui_model.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod(
      {Key? key, required this.paymentUiModel, required this.checkedListener})
      : super(key: key);
  final Function(PaymentUiModel paymentUiModel) checkedListener;
  final PaymentUiModel paymentUiModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        checkedListener(paymentUiModel);
      },
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            border: Border.all(color: Theme.of(context).dividerColor)),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    width: 30,
                    height: 30,
                    paymentUiModel.iconImage,
                    color: Theme.of(context).primaryColor,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    paymentUiModel.title,
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              paymentUiModel.isSelected
                  ? Icon(
                      Icons.check_box,
                      color: Theme.of(context).primaryColor,
                    )
                  : Icon(
                      Icons.check_box_outline_blank,
                      color: Theme.of(context).primaryColor,
                    )
            ],
          ),
        ),
      ),
    );
  }
}
