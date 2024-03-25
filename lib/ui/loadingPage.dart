import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            Gap(10),
            Text(
              "Loading data. Please be patient, this may take a few moments.",
              textAlign: TextAlign.center,
            )
          ]),
    );
  }
}
