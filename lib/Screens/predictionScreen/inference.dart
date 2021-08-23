import 'dart:async';
import 'dart:io';

import 'package:firebase_ml_custom/firebase_ml_custom.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

class PredictOnData {
  // TensorFlow Lite Interpreter object
  Interpreter _interpreter;

// Load model when the class is initialized.
  PredictOnData() {
    _loadModel();
  }

  /// Gets the model ready for inference on data.
  void _loadModel() async {
    final modelFile =
        await loadModelFromFirebase(); //Get model from cloud with certain conditions
    loadTFLiteModel(modelFile); // Load model
  }

  /// Downloads custom model from the Firebase console and return its file.
  /// located on the mobile device.
  static Future<File> loadModelFromFirebase() async {
    try {
      // Create model with a name that is specified in the Firebase console
      final mlmodel = FirebaseCustomRemoteModel('MLP_MODEL_HEART_ATACK');

      // Specify conditions when the model can be downloaded.
      // If there is no wifi access when the app is started,
      // this app will continue loading until the conditions are satisfied.
      final conditions = FirebaseModelDownloadConditions(
          androidRequireWifi: true,
          iosAllowCellularAccess: false,
          iosAllowBackgroundDownloading: true);

      // Create model manager associated with default Firebase App instance.
      final modelManager = FirebaseModelManager.instance;

      // Begin downloading and wait until the model is downloaded successfully.
      await modelManager.download(mlmodel, conditions);
      assert(await modelManager.isModelDownloaded(mlmodel) == true);

      // Get latest model file to use it for inference by the interpreter.
      var modelFile = await modelManager.getLatestModelFile(mlmodel);
      assert(modelFile != null);
      return modelFile;
    } catch (exception) {
      print('Failed on loading your model from Firebase: $exception');
      print('The program will not be resumed');
      rethrow;
    }
  }

  /// Loads the model into some TF Lite interpreter.
  /// In this case interpreter provided by tflite plugin.
  loadTFLiteModel(File modelFile) async {
    try {
      _interpreter = await Interpreter.fromFile(modelFile);
      return 'Model is loaded';
    } catch (exception) {
      print(
          'Failed on loading your model to the TFLite interpreter: $exception');
      print('The program will not be resumed');
      rethrow;
    }
  }

  /// Recup data

  /// Procecing inference
  int get riskPrediction {
    // Données entré manuellement pour le test, mais elle doivent être recuperer depuis FireStore à partir de l'uid de l'utilisateur
    List<double> input = [
      63,
      45,
      233,
      150,
      2.3,
      0,
      0,
      1,
      0,
      0,
      1,
      1,
      1,
      1,
      0,
      0,
      0,
      1,
      0,
      1,
      1,
      0,
      0,
      0,
      0,
      1
    ];
    // output of shape [1,1].
    var output = List<double>.filled(2, 0).reshape([1, 1]);

    // The run method will run inference and
    // store the resulting values in output.
    _interpreter.run(input, output);
    return output[0];
  }
}
