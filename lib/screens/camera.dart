import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  List cameras;
  CameraDescription camera;
  CameraController _cameraController;
  Future<void> _initializedControllerFuture;

  @override
  void initState() {
    initializeCamera();
    super.initState();
  }

  Future initializeCamera() async {
    cameras = await availableCameras();
    _cameraController =
        CameraController(cameras.first, ResolutionPreset.medium);
    setState(() {
      camera = cameras.first;
    });
    _initializedControllerFuture = _cameraController.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
      ),
      body: FutureBuilder<void>(
        future: _initializedControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(_cameraController);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera_alt),
        onPressed: () async {
          try {
            await _initializedControllerFuture;

            final path = join(
                (await getTemporaryDirectory()).path, '${DateTime.now()}.png');

            await _cameraController.takePicture(path);

            Navigator.pop(context, path);
          } catch (e) {
            print(e);
          }
        },
      ),
    );
  }
}
