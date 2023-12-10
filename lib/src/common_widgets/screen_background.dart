import 'package:flutter_example_app/src/utils/app_colors.dart';
import 'package:flutter/widgets.dart';

class ScreenBackground extends StatelessWidget {
  const ScreenBackground({
    Key? key,
    this.decoration,
    required this.child,
  }) : super(key: key);

  final Widget child;
  final BoxDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoration ??
          const BoxDecoration(
            color: AppColors.dirtyWhite,
          ),
      child: child,
    );
  }
}
