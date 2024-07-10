import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';
import "package:file_picker/file_picker.dart";

// Mobile image picking logic
Future<File?> pickImage() async {
  final picker = ImagePicker();
  // final cameraFile = await picker.pickImage(source: ImageSource.camera);
  final cameraFile = await picker.pickImage(
      source: ImageSource.camera, preferredCameraDevice: CameraDevice.front);
  final pickedFile = await picker.pickImage(source: ImageSource.gallery);

  if (cameraFile != null) {
    log("In camera");
    return File(cameraFile.path);
  } else if (pickedFile != null) {
    log("In file");
    return File(pickedFile.path);
  }

  return null;
}

// Web image picking logic
Future<Uint8List?> pickedImageWeb() async {
  final result = await FilePicker.platform.pickFiles(type: FileType.image);

  if (result != null && result.files.single.bytes != null) {
    return result.files.single.bytes;
  }
  return null;
}
