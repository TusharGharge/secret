import 'package:flutter/material.dart';
import 'package:user/views/videodemo.dart';

class FloatingActionContainer extends StatefulWidget {
  @override
  _FloatingActionContainerState createState() =>
      _FloatingActionContainerState();
}

class _FloatingActionContainerState extends State<FloatingActionContainer> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        DragBox(Offset(100.0, 200.0), 'Box One', Colors.blueAccent),
      ],
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
          child: Container(
            width: 200.0,
            height: 200.0,
            child: VideoDemo(),
          ),
          onDraggableCanceled: (velocity, offset) {
            setState(() {
              position = offset;
            });
          },
          feedback: Container(
            width: 20.0,
            height: 20.0,
            color: widget.itemColor.withOpacity(0.5),
            child: null,
          ),
        ));
  }
}

// class App extends StatefulWidget {
//   @override
//   AppState createState() => AppState();
// }

// class AppState extends State<App> {
//   Color caughtColor = Colors.grey;

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: <Widget>[
//         Container(
//           decoration: BoxDecoration(color: Colors.red),
//         ),
//         DragBox(Offset(0.0, 0.0), 'Box One', Colors.blueAccent),

//       ],
//     );
//   }
// }

// class DragBox extends StatefulWidget {
//   final Offset initPos;
//   final String label;
//   final Color itemColor;

//   DragBox(this.initPos, this.label, this.itemColor);

//   @override
//   DragBoxState createState() => DragBoxState();
// }

// class DragBoxState extends State<DragBox> {
//   Offset position = Offset(0.0, 0.0);

//   @override
//   void initState() {
//     super.initState();
//     position = widget.initPos;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//         left: position.dx,
//         top: position.dy,
//         child: Draggable(
//           data: widget.itemColor,
//           child: Container(
//             width: 100.0,
//             height: 100.0,
//             color: widget.itemColor,
//             child: Center(
//               child: Text(
//                 widget.label,
//                 style: TextStyle(
//                   color: Colors.white,
//                   decoration: TextDecoration.none,
//                   fontSize: 20.0,
//                 ),
//               ),
//             ),
//           ),
//           onDraggableCanceled: (velocity, offset) {
//             setState(() {
//               position = offset;
//             });
//           },
//           feedback: Container(
//             width: 120.0,
//             height: 120.0,
//             color: widget.itemColor.withOpacity(0.5),
//             child: Center(
//               child: Text(
//                 widget.label,
//                 style: TextStyle(
//                   color: Colors.white,
//                   decoration: TextDecoration.none,
//                   fontSize: 18.0,
//                 ),
//               ),
//             ),
//           ),
//         ));
//   }
// }
