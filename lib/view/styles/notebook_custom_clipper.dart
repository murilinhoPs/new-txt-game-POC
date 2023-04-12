import 'package:flutter/material.dart';

class NotebookClipper extends CustomClipper<Path> {
  _createPath(Path path, double xScaling, double yScaling) {
    path.cubicTo(
      55.388 * xScaling,
      41.523 * yScaling,
      59.394 * xScaling,
      41.872 * yScaling,
      59.4 * xScaling,
      42.222 * yScaling,
    );
    path.cubicTo(
      59.458 * xScaling,
      45.507 * yScaling,
      59.554 * xScaling,
      48.946 * yScaling,
      59.687 * xScaling,
      52.541 * yScaling,
    );
    path.cubicTo(
      59.687 * xScaling,
      52.541 * yScaling,
      54.172 * xScaling,
      54.086 * yScaling,
      54.172 * xScaling,
      54.086 * yScaling,
    );
    path.cubicTo(
      54.172 * xScaling,
      54.086 * yScaling,
      59.687 * xScaling,
      55.987 * yScaling,
      59.687 * xScaling,
      55.987 * yScaling,
    );
    path.cubicTo(
      59.687 * xScaling,
      55.987 * yScaling,
      60.741 * xScaling,
      71.517 * yScaling,
      60.741 * xScaling,
      71.517 * yScaling,
    );
    path.cubicTo(
      60.741 * xScaling,
      71.517 * yScaling,
      13.338 * xScaling,
      71.68 * yScaling,
      13.338 * xScaling,
      71.68 * yScaling,
    );
    path.cubicTo(
      13.338 * xScaling,
      71.68 * yScaling,
      11.105 * xScaling,
      65.231 * yScaling,
      11.105 * xScaling,
      65.231 * yScaling,
    );
    path.cubicTo(
      11.105 * xScaling,
      65.231 * yScaling,
      8.76 * xScaling,
      71.517 * yScaling,
      8.76 * xScaling,
      71.517 * yScaling,
    );
    path.cubicTo(
      8.76 * xScaling,
      71.517 * yScaling,
      1.5 * xScaling,
      71.517 * yScaling,
      1.5 * xScaling,
      71.517 * yScaling,
    );
    path.cubicTo(
      4.1193333333333335 * xScaling,
      35.50833333333333 * yScaling,
      4.494 * xScaling,
      12.627666666666668 * yScaling,
      2.624 * xScaling,
      2.875 * yScaling,
    );
    path.cubicTo(
      2.624 * xScaling,
      2.875 * yScaling,
      34.996 * xScaling,
      3.161 * yScaling,
      34.996 * xScaling,
      3.161 * yScaling,
    );
    path.cubicTo(
      34.996 * xScaling,
      3.161 * yScaling,
      36.913 * xScaling,
      7.211 * yScaling,
      36.913 * xScaling,
      7.211 * yScaling,
    );
    path.cubicTo(
      36.913 * xScaling,
      7.211 * yScaling,
      39.051 * xScaling,
      3.508 * yScaling,
      39.051 * xScaling,
      3.508 * yScaling,
    );
    path.cubicTo(
      44.821 * xScaling,
      4.996 * yScaling,
      52.474000000000004 * xScaling,
      4.326666666666666 * yScaling,
      62.01 * xScaling,
      1.5 * yScaling,
    );
    path.cubicTo(
      60.31 * xScaling,
      13.525333333333332 * yScaling,
      59.44 * xScaling,
      26.692 * yScaling,
      59.4 * xScaling,
      41 * yScaling,
    );
  }

  @override
  Path getClip(Size size) {
    Path path = Path();

    final double xScaling = size.width / 57.286;
    final double yScaling = size.height / 65.18;

    path.lineTo(60.382 * xScaling, 41.176 * yScaling);

    _createPath(path, xScaling, yScaling);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
