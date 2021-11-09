
import 'package:flutter/material.dart';

class OutlinedDotIndicator extends StatelessWidget {
  const OutlinedDotIndicator({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 35,
        height: 35,
        child: const Text(''),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey, width: 1),
        ),
      ),
    );
  }
}
