import 'dart:io';

import 'package:codeland/res/constants.dart';
import 'package:codeland/view/login/components/custom_button.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import 'components/preview_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;

  @override
  void initState() {
    super.initState();
    _checkPermission(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Upload an image',
          style: normalText(16, Colors.black, FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 16.0,
            ),
            Expanded(
              flex: 2,
              child: DottedBorder(
                dashPattern: const [8, 4],
                strokeWidth: 1,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: _image == null
                        ? Image.asset("assets/image.png")
                        : Image.file(File(_image!.path)),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      text: "Upload",
                      onPressed: () async {
                        await getImageFromGallery();
                      },
                      color: primaryColor,
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width,
                      textSize: 14,
                      textColor: textColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Spacer(),
                  Expanded(
                    child: CustomButton(
                      text: "View",
                      onPressed: () {
                        if (_image != null) {
                          // Show the uploaded image in a preview dialog
                          if (_image != null) {
                            showDialog(
                              context: context,
                              builder: (_) =>
                                  FullScreenImageDialog(image: _image),
                            );
                          }
                        } else {
                          // Show a message indicating no image is selected
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('No image selected'),
                            ),
                          );
                        }
                      },
                      color: const Color(0xffD3D3D6),
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width,
                      textSize: 14,
                      textColor: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future getImageFromGallery() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
      maxWidth: 800,
      maxHeight: 600,
    );

    setState(() {
      _image = image;
    });
  }

  void _checkPermission(BuildContext context) async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.camera,
      Permission.photos,
    ].request();
    PermissionStatus? statusPhotos = statuses[Permission.photos];
    bool isGranted = statusPhotos == PermissionStatus.granted;
    if (!isGranted) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Open Settings'),
            content: const Text('Would you like to open the settings?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close the dialog
                },
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  openAppSettings();
                },
                child: const Text('Open'),
              ),
            ],
          );
        },
      );
    }
  }
}
