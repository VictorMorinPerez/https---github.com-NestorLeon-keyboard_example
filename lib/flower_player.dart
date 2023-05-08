import 'package:flame/components.dart';
import 'package:figuras_flame/figures.dart';

class FlowerPlayer extends Flower with HasGameRef {
  /// Pixels/s
  double maxSpeed = 300.0;
  final JoystickComponent joystick;

  FlowerPlayer({
    required this.joystick,
    required super.position,
    required super.paint,
    required super.size,
  });

  @override
  void update(double dt) {
    if (joystick.delta.x != 0) {
      position.add(joystick.relativeDelta * maxSpeed * dt);
      position.y = gameRef.size.y - height;
      if (position.x + width < 0) {
        position.x = gameRef.size.x;
      }
      if (position.x > gameRef.size.x) {
        position.x = -width;
      }
    }
  }
}
