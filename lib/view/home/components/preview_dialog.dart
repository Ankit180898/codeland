import 'dart:io';
import 'package:codeland/res/constants.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FullScreenImageDialog extends StatelessWidget {
  final XFile? image;

  const FullScreenImageDialog({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Dialog(
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),

      backgroundColor: primaryColor,

      insetPadding: EdgeInsets.zero,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: image != null
            ? InteractiveViewer(
                panEnabled: false, boundaryMargin: const EdgeInsets.all(100),
                minScale: 0.5,
                maxScale: 2,
                child: Image.file(
                  File(image!.path),
                  fit: BoxFit.cover,
                ), // Set it to false true, child: null,
              )
            : const Center(
                child: Text('No image selected'),
              ),
      ),
    );
  }
}
