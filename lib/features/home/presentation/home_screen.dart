import 'package:currency_converter_app/features/home/presentation/widgets/home_background.dart';
import 'package:currency_converter_app/features/home/presentation/widgets/home_ui.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    // context.read<CountryCubit>().fetchCountry();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const HomeBackground(),
          HomeUI(),
        ],
      ),
    );
  }
}
