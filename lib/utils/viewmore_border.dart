import 'common_import.dart';

class ViewMoreBorder extends ShapeBorder {
  final bool usePadding;

  ViewMoreBorder({this.usePadding = true});

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.only(top: usePadding? 5 : 0);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return null!;
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    rect = Rect.fromPoints(rect.topLeft, rect.bottomRight - Offset(0, 20));

    return Path()
      ..addRRect(RRect.fromRectAndRadius(rect, Radius.circular(Dimens.margin5)))
      ..moveTo(rect.topRight.dx -60, rect.topRight.dy)
      ..relativeLineTo(20, -20)
      ..relativeLineTo(20, 20)
      ..close();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) => this;
}