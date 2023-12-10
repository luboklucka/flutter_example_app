import 'package:flutter_example_app/src/common_widgets/tactile.dart';
import 'package:flutter/widgets.dart';

class ImageButton extends StatelessWidget {
  const ImageButton({
    Key? key,
    required this.imageUrl,
    this.action,
    this.width = 40.0,
    this.height = 40.0,
    this.disabled = false,
    this.endScale = 1.4,
    this.decoration,
  }) : super(key: key);

  final Function? action;
  final String imageUrl;
  final double width;
  final double height;
  final double endScale;
  final bool disabled;
  final BoxDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    return Tactile(
      endScale: endScale,
      disabled: disabled,
      onPressed: () {
        if (disabled) return;
        if (action != null) action!();
      },
      child: Container(
        height: height,
        width: width,
        decoration: decoration,
        child: Image.asset(imageUrl),
      ),
    );
  }
}
