import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 35,
        height: 35,
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.pink,
            ),
          ),
        ),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.pink, width: 1),
        ),
      ),
    );
  }
}
