import 'package:flutter/material.dart';
import "dart:math";

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController progressController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    progressController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    animation = Tween(begin: 0.5, end: 80.0).animate(progressController);
    progressController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          AnimatedBorder(animation: animation),
          AnimatedBackgroundProgress(animation: animation),
        ],
      ),
    );
  }
}

class AnimatedBorder extends AnimatedWidget {
  final Animation<double> animation;
  const AnimatedBorder({required this.animation})
      : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    // final Animation<double> animation = listenable;
    return CustomPaint(
      size: const Size(200, 200),
      foregroundPainter: CircleProgress(
        animation.value,
      ), // this will add custom painter after child
      child: SizedBox(
        width: 200,
        height: 200,
        child: Center(
          child: Text(
            "${animation.value.ceil()}%",
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class AnimatedBackgroundProgress extends AnimatedWidget {
  final Animation<double> animation;
  const AnimatedBackgroundProgress({required this.animation})
      : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    // final Animation<double> animation = listenable;
    return CustomPaint(
      size: const Size(200, 200),
      // painter: DottedCirclePainter(100),
      painter: LoaderPaint(percentage: animation.value / 100),
    );
  }
}

class LoaderPaint extends CustomPainter {
  final double percentage;
  LoaderPaint({
    required this.percentage,
  });

  deg2Rand(double deg) => deg * pi / 180;
  @override
  void paint(Canvas canvas, Size size) {
    final midOffset = Offset(size.width / 2, size.height / 2);

    Paint paint = Paint()..color = const Color(0x330000ff);

    canvas.drawArc(
      Rect.fromCenter(
        center: midOffset,
        width: size.width * .9,
        height: size.height * .9,
      ),
      deg2Rand(-90),
      deg2Rand(360 * percentage),
      true,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class CircleProgress extends CustomPainter {
  double currentProgress;

  CircleProgress(this.currentProgress);

  @override
  void paint(Canvas canvas, Size size) {
    //this is base circle
    Paint outerCircle = Paint()
      ..strokeWidth = 10
      ..color = Colors.white
      ..style = PaintingStyle.stroke;

    Paint completeArc = Paint()
      ..strokeWidth = 10
      ..color = Colors.redAccent
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2) - 10;

    canvas.drawCircle(
        center, radius, outerCircle); // this draws main outer circle

    double angle = 2 * pi * (currentProgress / 100);

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        angle, false, completeArc);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
