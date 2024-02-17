import 'package:flutter/material.dart';

class HomeBackground extends StatelessWidget {
  const HomeBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: NetworkImage(
                "https://img.freepik.com/premium-vector/money-transfer-global-currency-stock-exchange_115579-923.jpg"),
            fit: BoxFit.cover,
          )),
        ),
        Container(
          color: Colors.black.withOpacity(0.25),
        ),
      ],
    );
  }
}
