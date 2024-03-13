import 'package:flutter/material.dart';

class RunAppErrorWidget extends StatelessWidget {
  final String errorMsg;
  const RunAppErrorWidget({super.key, required this.errorMsg});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Commerce Development',
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Text(
            errorMsg,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
