import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/experimental.dart';

class DragComponent extends PositionComponent with DragCallbacks {
  final void Function() onDragRight;
  final void Function() onDragLeft;

  DragComponent(
    this.onDragLeft,
    this.onDragRight,
  ) : super();

  final _rectPaint = Paint()..color = const Color.fromARGB(40, 216, 118, 238);
  Vector2 actualPosition = Vector2(0, 0);
  bool _isDragged = false;

  @override
  void onGameResize(Vector2 canvasSize) {
    super.onGameResize(canvasSize);
    size.x = canvasSize.x;
    position.y = canvasSize.y - 100;
  }

  @override
  void render(Canvas canvas) {
    canvas.drawRect(size.toRect(), _rectPaint);
  }

  @override
  void onDragStart(DragStartEvent event) {
    actualPosition = event.localPosition;
    _isDragged = true;
    super.onDragStart(event);
  }

  @override
  void onDragUpdate(DragUpdateEvent event) {
    if (event.delta.x > 0) {
      onDragRight();
    } else if (event.delta.x < 0) {
      onDragLeft();
    }
    actualPosition += event.delta;
  }

  @override
  void onDragEnd(DragEndEvent event) {
    _isDragged = false;
    super.onDragEnd(event);
  }

  @override
  void onDragCancel(DragCancelEvent event) {
    _isDragged = false;
    super.onDragCancel(event);
  }
}
