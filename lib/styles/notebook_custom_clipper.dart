import 'package:flutter/material.dart';

class NotebookClipper extends CustomClipper<Path> {
  _createPath(Path path, double _xScaling, double _yScaling) {
    path.cubicTo(
      55.388 * _xScaling,
      41.523 * _yScaling,
      59.394 * _xScaling,
      41.872 * _yScaling,
      59.4 * _xScaling,
      42.222 * _yScaling,
    );
    path.cubicTo(
      59.458 * _xScaling,
      45.507 * _yScaling,
      59.554 * _xScaling,
      48.946 * _yScaling,
      59.687 * _xScaling,
      52.541 * _yScaling,
    );
    path.cubicTo(
      59.687 * _xScaling,
      52.541 * _yScaling,
      54.172 * _xScaling,
      54.086 * _yScaling,
      54.172 * _xScaling,
      54.086 * _yScaling,
    );
    path.cubicTo(
      54.172 * _xScaling,
      54.086 * _yScaling,
      59.687 * _xScaling,
      55.987 * _yScaling,
      59.687 * _xScaling,
      55.987 * _yScaling,
    );
    path.cubicTo(
      59.687 * _xScaling,
      55.987 * _yScaling,
      60.741 * _xScaling,
      71.517 * _yScaling,
      60.741 * _xScaling,
      71.517 * _yScaling,
    );
    path.cubicTo(
      60.741 * _xScaling,
      71.517 * _yScaling,
      13.338 * _xScaling,
      71.68 * _yScaling,
      13.338 * _xScaling,
      71.68 * _yScaling,
    );
    path.cubicTo(
      13.338 * _xScaling,
      71.68 * _yScaling,
      11.105 * _xScaling,
      65.231 * _yScaling,
      11.105 * _xScaling,
      65.231 * _yScaling,
    );
    path.cubicTo(
      11.105 * _xScaling,
      65.231 * _yScaling,
      8.76 * _xScaling,
      71.517 * _yScaling,
      8.76 * _xScaling,
      71.517 * _yScaling,
    );
    path.cubicTo(
      8.76 * _xScaling,
      71.517 * _yScaling,
      1.5 * _xScaling,
      71.517 * _yScaling,
      1.5 * _xScaling,
      71.517 * _yScaling,
    );
    path.cubicTo(
      4.1193333333333335 * _xScaling,
      35.50833333333333 * _yScaling,
      4.494 * _xScaling,
      12.627666666666668 * _yScaling,
      2.624 * _xScaling,
      2.875 * _yScaling,
    );
    path.cubicTo(
      2.624 * _xScaling,
      2.875 * _yScaling,
      34.996 * _xScaling,
      3.161 * _yScaling,
      34.996 * _xScaling,
      3.161 * _yScaling,
    );
    path.cubicTo(
      34.996 * _xScaling,
      3.161 * _yScaling,
      36.913 * _xScaling,
      7.211 * _yScaling,
      36.913 * _xScaling,
      7.211 * _yScaling,
    );
    path.cubicTo(
      36.913 * _xScaling,
      7.211 * _yScaling,
      39.051 * _xScaling,
      3.508 * _yScaling,
      39.051 * _xScaling,
      3.508 * _yScaling,
    );
    path.cubicTo(
      44.821 * _xScaling,
      4.996 * _yScaling,
      52.474000000000004 * _xScaling,
      4.326666666666666 * _yScaling,
      62.01 * _xScaling,
      1.5 * _yScaling,
    );
    path.cubicTo(
      60.31 * _xScaling,
      13.525333333333332 * _yScaling,
      59.44 * _xScaling,
      26.692 * _yScaling,
      59.4 * _xScaling,
      41 * _yScaling,
    );
  }

  @override
  Path getClip(Size size) {
    Path path = Path();

    final double _xScaling = size.width / 57.286;
    final double _yScaling = size.height / 65.18;

    path.lineTo(60.382 * _xScaling, 41.176 * _yScaling);

    _createPath(path, _xScaling, _yScaling);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
