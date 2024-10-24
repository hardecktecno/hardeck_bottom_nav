import 'package:flutter/material.dart';

/// Define los diferentes tipos de barra de navegación inferior.
enum HardeckBottomNavBarType {
  transparent,
  pinterest,
  normal,
}

/// Una barra de navegación inferior con diferentes estilos.
/// El widget permite una alta personalización, como colores, íconos y acciones de botones.
class HardeckBottomNavBar extends StatefulWidget {
  final HardeckBottomNavBarType type;
  final Color primaryColor;
  final Color secondaryColor;
  final Color backgroundColor;
  final List<NavBarIcon> items;
  final IconData fabIcon;
  final double height;
  final Function()? fabAction;

  /// Crea una barra de navegación inferior con diferentes tipos y un Floating Action Button opcional.
  HardeckBottomNavBar({
    required this.items,
    this.type = HardeckBottomNavBarType.transparent,
    this.primaryColor = Colors.green,
    this.secondaryColor = Colors.white,
    this.fabIcon = Icons.add,
    this.fabAction,
    this.height = 56.0,
    Key? key,
  })  : backgroundColor = Colors.black.withOpacity(.5),
        super(key: key);

  @override
  _HardeckBottomNavBarState createState() => _HardeckBottomNavBarState();
}

class _HardeckBottomNavBarState extends State<HardeckBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    switch (widget.type) {
      case HardeckBottomNavBarType.transparent:
        return _buildTransparentNavBar();
      case HardeckBottomNavBarType.pinterest:
        return _buildPinterestNavBar();
      case HardeckBottomNavBarType.normal:
      default:
        return _buildNormalNavBar();
    }
  }

  /// Barra de navegación transparente con curva y FAB en el centro.
  Widget _buildTransparentNavBar() {
    Size size = MediaQuery.of(context).size;
    final primaryColor = widget.primaryColor;
    final secondaryColor = widget.secondaryColor;
    final backgroundColor = widget.backgroundColor;

    return BottomAppBar(
      color: Colors.transparent,
      elevation: 0,
      child: Stack(
        children: [
          CustomPaint(
            size: Size(size.width, widget.height + 6),
            painter: BottomNavCurvePainter(backgroundColor: backgroundColor),
          ),
          Center(
            heightFactor: 0.6,
            child: FloatingActionButton(
              backgroundColor: primaryColor,
              child: Icon(widget.fabIcon),
              elevation: 0.1,
              onPressed: widget.fabAction ?? () {},
            ),
          ),
          SizedBox(
            height: widget.height,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ...widget.items.map((item) => NavBarIcon(
                      text: item.text,
                      icon: item.icon,
                      selected: item.selected,
                      onPressed: item.onPressed,
                      defaultColor: secondaryColor,
                      selectedColor: primaryColor,
                    )),
                const SizedBox(width: 56), // Para el espacio del FAB
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Barra de navegación estilo Pinterest.
  Widget _buildPinterestNavBar() {
    return BottomAppBar(
      color: widget.backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: widget.items.map((item) => NavBarIcon(
              text: item.text,
              icon: item.icon,
              selected: item.selected,
              onPressed: item.onPressed,
              defaultColor: widget.secondaryColor,
              selectedColor: widget.primaryColor,
            )).toList(),
      ),
    );
  }

  /// Barra de navegación normal.
  Widget _buildNormalNavBar() {
    return BottomAppBar(
      color: widget.backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: widget.items.map((item) => NavBarIcon(
              text: item.text,
              icon: item.icon,
              selected: item.selected,
              onPressed: item.onPressed,
              defaultColor: widget.secondaryColor,
              selectedColor: widget.primaryColor,
            )).toList(),
      ),
    );
  }
}

class BottomNavCurvePainter extends CustomPainter {
  final Color backgroundColor;
  final double insetRadius;

  BottomNavCurvePainter({
    required this.backgroundColor,
    this.insetRadius = 38,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;

    Path path = Path()..moveTo(0, 12);
    double insetCurveBeginnningX = size.width / 2 - insetRadius;
    double insetCurveEndX = size.width / 2 + insetRadius;
    double transitionToInsetCurveWidth = size.width * .05;

    path.quadraticBezierTo(
        size.width * 0.20, 0, insetCurveBeginnningX - transitionToInsetCurveWidth, 0);
    path.quadraticBezierTo(
        insetCurveBeginnningX, 0, insetCurveBeginnningX, insetRadius / 2);
    path.arcToPoint(Offset(insetCurveEndX, insetRadius / 2),
        radius: const Radius.circular(10.0), clockwise: false);
    path.quadraticBezierTo(
        insetCurveEndX, 0, insetCurveEndX + transitionToInsetCurveWidth, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 12);
    path.lineTo(size.width, size.height + 56);
    path.lineTo(0, size.height + 56);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

/// Widget para cada ícono en la barra de navegación inferior.
class NavBarIcon extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool selected;
  final Function() onPressed;
  final Color defaultColor;
  final Color selectedColor;

  const NavBarIcon({
    required this.text,
    required this.icon,
    required this.selected,
    required this.onPressed,
    this.selectedColor = const Color(0xffFF8527),
    this.defaultColor = Colors.black54,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onPressed,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          icon: Icon(
            icon,
            size: 25,
            color: selected ? selectedColor : defaultColor,
          ),
        ),
      ],
    );
  }
}
