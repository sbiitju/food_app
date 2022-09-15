import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
        height: 48,
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            border: Border.all(
                color: paymentUiModel.isSelected
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).dividerColor)),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                      width: 40,
                      height: 25,
                      child: SvgPicture.network(paymentUiModel.iconImage)),
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
