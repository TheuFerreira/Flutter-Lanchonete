import 'package:flutter/material.dart';
import 'package:lanchonete_app/presenters/pages/product/widgets/rounded_button_widget.dart';

class QuantityWidget extends StatelessWidget {
  final String quantity;
  final void Function() onSubtract;
  final void Function() onAdd;
  const QuantityWidget({
    super.key,
    required this.quantity,
    required this.onSubtract,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RoundedButtonWidget(
          icon: Icons.remove,
          onTap: onSubtract,
        ),
        SizedBox(
          width: 40,
          child: Text(
            quantity,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
        ),
        RoundedButtonWidget(
          icon: Icons.add,
          onTap: onAdd,
        ),
      ],
    );
  }
}
