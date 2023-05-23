import 'package:flutter/material.dart';
import 'package:look_back/settings/theme_config.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class SignUpScreenTopImage extends StatefulWidget {
  const SignUpScreenTopImage({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpScreenTopImage> createState() => _SignUpScreenTopImageState();
}

class _SignUpScreenTopImageState extends State<SignUpScreenTopImage> {

  File? _image;
  final _picker = ImagePicker();

  // Implementing the gallery
  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  // Implementing the camera
  Future<void> _openCameraPicker() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: defaultPadding/2),
        
        SizedBox(height: defaultPadding),
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 8,
              child: Column(
                children: [

                  const Text(
                    "Sign Up",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),

                  const SizedBox(height: defaultPadding / 2),
                  Container(
                    alignment: Alignment.center,
                    width: 200,
                    height: 200,
                    color: Colors.black26,
                    child: _image != null
                        ? Image.file(_image!, fit: BoxFit.cover,)
                        : Image.asset('assets/customs/bob_cholo.png', fit: BoxFit.cover,)
                        // : const Text(
                        //   'Please select an image',
                        //   style: TextStyle(color: Colors.black),
                        // ),
                  ),
                  const SizedBox(height: defaultPadding / 2),

                  Row(
                    children: <Widget>[
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: _openImagePicker,
                          icon: const Icon(Icons.add_photo_alternate_rounded),
                          label: const Text('Select An Image from Gallery'),
                        ),
                      ),
                      const SizedBox(width: defaultPadding / 2),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: _openCameraPicker,
                          icon: const Icon(Icons.add_a_photo_rounded),
                          label: const Text('Select An Image from Camera'),
                        ),
                      ),
                    ],
                  )
                  
                ],
              ),
              
            ),
            const Spacer(),
          ],
        ),
        SizedBox(height: defaultPadding),
      ],
    );
  }
}
