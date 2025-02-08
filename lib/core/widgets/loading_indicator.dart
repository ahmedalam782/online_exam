import 'package:flutter/material.dart';

import 'package:online_exam/core/resources/color_manager.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key, this.height});
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: ColorManager.blue,
      ),
    );
  }
}
