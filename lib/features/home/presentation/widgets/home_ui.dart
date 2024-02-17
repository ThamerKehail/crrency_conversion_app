import 'package:flutter/material.dart';

import 'converter_widget.dart';

class HomeUI extends StatelessWidget {
  const HomeUI({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(
          top: screenSize.height * 0.10,
          left: screenSize.width / 18,
          right: screenSize.width / 18),
      child: const SingleChildScrollView(
        child: ConverterWidget(),
      ),
    );
  }
}
