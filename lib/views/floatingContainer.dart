import 'package:flutter/material.dart';
import 'package:user/views/videodemo.dart';

class FloatingContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Color caughtColor = Colors.deepPurple;
    return SafeArea(
      child: Stack(
        children: <Widget>[
          DragBox(Offset(100.0, 200.0), 'Box One', Colors.blueAccent),
          // Positioned(
          //   left: 125.0,
          //   bottom: 0.0,
          // child: DragTarget(
          //   onAccept: (Color color) {
          //     caughtColor = color;
          //   },
          // builder: (
          //   BuildContext context,
          //   List<dynamic> accepted,
          //   List<dynamic> rejected,
          // ) {
          //   return Container(
          //     width: 150.0,
          //     height: 150.0,
          //     decoration: BoxDecoration(
          //       color: accepted.isEmpty
          //           ? caughtColor
          //           : Colors.deepPurple.shade200,
          //     ),
          //     child: Center(
          //       child: Text("Drag Here!",
          //           style: TextStyle(color: Colors.white)),
          //     ),
          //   );
          //     },
          //   ),
          // )
        ],
      ),
    );
  }
}

class DragBox extends StatefulWidget {
  final Offset initPos;
  final String label;
  final Color itemColor;

  DragBox(this.initPos, this.label, this.itemColor);

  @override
  DragBoxState createState() => DragBoxState();
}

class DragBoxState extends State<DragBox> {
  Offset position = Offset(0.0, 0.0);

  @override
  void initState() {
    super.initState();
    position = widget.initPos;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: position.dx,
        top: position.dy,
        child: Draggable(
          data: widget.itemColor,
          child: Container(
            width: 220.0,
            height: 220.0,
            color: widget.itemColor,
            child: VideoDemo(),
          ),
          onDraggableCanceled: (velocity, offset) {
            setState(() {
              position = offset;
            });
          },
          feedback: Container(
            width: 120.0,
            height: 120.0,
            color: widget.itemColor.withOpacity(0.5),
            child: Center(
              child: Text(
                widget.label,
                style: TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.none,
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
        ));
  }
}
