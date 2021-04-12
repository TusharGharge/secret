// import 'package:flutter/material.dart';
// import 'package:camera/camera.dart';
// import 'package:flutter/services.dart';
// import 'package:tflite/tflite.dart';
// import 'package:user/main.dart';

// class VideoDemo extends StatefulWidget {
//   get stackChildrenwidgets => null;

//   @override
//   _VideoDemoState createState() => _VideoDemoState();
// }

// class _VideoDemoState extends State<VideoDemo> {
//   //variable define from floatingcontainer class
//   Offset position = Offset(0.0, 0.0);
//   Offset initPos = Offset(200.0, 200.0);
//   // End
//   //

//   CameraController cameraController;
//   CameraImage imgCamera;
//   bool isWorking = false;
//   double imgHeight;
//   double imgWidth;
//   List recognitionList;
//   initCamera() {
//     cameraController = CameraController(cameras[0], ResolutionPreset.medium);
//     cameraController.initialize().then((value) {
//       if (!mounted) {
//         return;
//       }
//       setState(() {
//         cameraController.startImageStream((imageFromStream) => {
//               if (!isWorking)
//                 {
//                   isWorking = true,
//                   imgCamera = imageFromStream,
//                   runModelOnStreamFrame(),
//                 }
//             });
//       });
//     });
//   }

//   runModelOnStreamFrame() async {
//     imgHeight = imgCamera.height + 0.0;
//     imgWidth = imgCamera.width + 0.0;
//     recognitionList = await Tflite.detectObjectOnFrame(
//       bytesList: imgCamera.planes.map((plane) {
//         return plane.bytes;
//       }).toList(),
//       model: "SSDMobileNet",
//       imageHeight: imgCamera.height,
//       imageWidth: imgCamera.width,
//       imageMean: 127.5,
//       imageStd: 127.5,
//       numResultsPerClass: 1,
//     );
//     isWorking = false;
//     setState(() {
//       imgCamera;
//     });
//   }

//   Future loadModel() async {
//     Tflite.close();
//     try {
//       String response;
//       response = await Tflite.loadModel(
//           model: "assets/ssd_mobilenet.tflite",
//           labels: "assets/ssd_mobilenet.txt");
//       print(response);
//     } on PlatformException {
//       print("unable to load the model");
//     }
//   }

//   @override
//   void dispose() {
//     super.dispose();

//     cameraController.stopImageStream();
//     Tflite.close();
//   }

//   void initState() {
//     super.initState();
//     loadModel();
//     initCamera();
//     position = initPos; //position from floating container class
//   }

//   List<Widget> displayBoxesAroundRecognizedObjects(Size screen) {
//     if (recognitionList == null) return [];

//     if (imgHeight == null || imgWidth == null) return [];
//     double factorX = screen.width;
//     double factorY = imgHeight;

//     Color colorPick = Colors.pink;

//     return recognitionList.map((result) {
//       return Positioned(
//         left: result["rect"]["x"] * factorX,
//         top: result["rect"]["y"] * factorY,
//         width: result["rect"]["w"] * factorX,
//         height: result["rect"]["h"] * factorY,
//         child: Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.all(Radius.circular(10.0)),
//             border: Border.all(color: Colors.pink, width: 2.0),
//           ),
//           child: Text(
//             "${result['detectedClass']} ${(result['confidenceInClass'] * 100).toStringAsFixed(0)}%",
//             style: TextStyle(
//               background: Paint()..color = colorPick,
//               color: Colors.white,
//               fontSize: 16.0,
//             ),
//           ),
//         ),
//       );
//     }).toList();
//   }

//   /// run the program  for testing purpose;

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     List<Widget> stackChildrenwidgets = [];
//     stackChildrenwidgets.add(
//       Positioned(
//         top: 0.0,
//         left: 0.0,
//         width:200,
//         height: 200,
//         child: Container(
//           height: 190,
//           child: (!cameraController.value.isInitialized)
//               ? new Container()
//               : AspectRatio(
//                   aspectRatio: cameraController.value.aspectRatio,
//                   child: CameraPreview(cameraController),
//                 ),
//         ),
//       ),
//     );

//     if (imgCamera != null) {
//       stackChildrenwidgets.addAll(displayBoxesAroundRecognizedObjects(size));
//     }

//     return SafeArea(
//       child: Stack(
//         children: [
//           Container(
//             margin: EdgeInsets.only(top: 20),
//             color: Colors.black,
//             child: Stack(
//               children: [
//                 Positioned(
//           left: position.dx,
//           top: position.dy,
//           child: Draggable(
//             child: Container(
//               width: 200.0,
//               height: 200.0,
//               child:Column(
//                 children:<widget>[stackChildrenwidgets],),
//             ),
//             onDraggableCanceled: (velocity, offset) {
//               setState(() {
//                 position = offset;
//               });
//             },
//             feedback: Container(
//               width: 20.0,
//               height: 20.0,
//               //color: widget.itemColor.withOpacity(0.5),
//               child: null,
//             ),
//           ),
//         ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     ); //init/khsdlkhhdkhskhdkshck
//   }
// }




import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter/services.dart';
import 'package:tflite/tflite.dart';
import 'package:user/main.dart';

class VideoDemo extends StatefulWidget {
  @override
  _VideoDemoState createState() => _VideoDemoState();
}

class _VideoDemoState extends State<VideoDemo> {
  CameraController cameraController;
  CameraImage imgCamera;
  bool isWorking = false;
  double imgHeight;
  double imgWidth;
  List recognitionList;
  initCamera() {
    cameraController = CameraController(cameras[1], ResolutionPreset.veryHigh);
    cameraController.initialize().then((value) {
      if (!mounted) {
        return;
      }
      setState(() {
        cameraController.startImageStream((imageFromStream) => {
              if (!isWorking)
                {
                  isWorking = true,
                  imgCamera = imageFromStream,
                  runModelOnStreamFrame(),
                }
            });
      });
    });
  }

  runModelOnStreamFrame() async {
    imgHeight = imgCamera.height + 0.0;
    imgWidth = imgCamera.width + 0.0;
    recognitionList = await Tflite.detectObjectOnFrame(
      bytesList: imgCamera.planes.map((plane) {
        return plane.bytes;
      }).toList(),
      model: "SSDMobileNet",
      imageHeight: imgCamera.height,
      imageWidth: imgCamera.width,
      imageMean: 127.5,
      imageStd: 127.5,
      numResultsPerClass: 1,
    );
    isWorking = false;
    setState(() {
      imgCamera;
    });
  }

  Future loadModel() async {
    Tflite.close();
    try {
      String response;
      response = await Tflite.loadModel(
          model: "assets/ssd_mobilenet.tflite",
          labels: "assets/ssd_mobilenet.txt");
      print(response);
    } on PlatformException {
      print("unable to load the model");
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose\

    super.dispose();
    cameraController.stopImageStream();
    Tflite.close();
  }

  void initState() {
    super.initState();
    loadModel();
    initCamera();
  }

  List<Widget> displayBoxesAroundRecognizedObjects(Size screen) {
    if (recognitionList == null) return [];

    if (imgHeight == null || imgWidth == null) return [];
    double factorX = screen.width;
    double factorY = imgHeight;

    Color colorPick = Colors.pink;

    return recognitionList.map((result) {
      return Positioned(
        left: result["rect"]["x"] * factorX,
        top: result["rect"]["y"] * factorY,
        width: result["rect"]["w"] * factorX,
        height: result["rect"]["h"] * factorY,
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              border: Border.all(color: Colors.pink, width: 2.0),
            ),
            child: Container(
              child: (result['detectedClass'] != 'person' &&
                      result['confidenceInClass'] <(50))
                  ? Text('person detected',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold))
                  : Text(
                      "${result['detectedClass']} ${(result['confidenceInClass'] * 100).toStringAsFixed(0)}%",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
            )),
      );
    }).toList();
  }

  /// run the program  for testing purpose;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Widget> stackChildrenwidgets = [];
    stackChildrenwidgets.add(
      Positioned(
        top: 0.0,
        left: 0.0,
        width: 200,
        height: 200,
        child: Container(
          height: 200,
          child: (!cameraController.value.isInitialized)
              ? new Container()
              : AspectRatio(
                  aspectRatio: cameraController.value.aspectRatio,
                  child: CameraPreview(cameraController),
                ),
        ),
      ),
    );

    if (imgCamera != null) {
      stackChildrenwidgets.addAll(displayBoxesAroundRecognizedObjects(size));
    } else if (recognitionList == null) {
      AlertDialog(
        title: Text('Behave your Self'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('This is warning '),
              Text('Check your camera else your exam session will be ended.'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Approve'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
            margin: EdgeInsets.only(top: 20),
            color: Colors.black,
            child: Stack(
              children: stackChildrenwidgets,
            )),
      ),
    );
  }
}