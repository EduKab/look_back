import 'package:flutter/material.dart';
import 'package:look_back/settings/theme_config.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

File? _image;
final FirebaseStorage storage = FirebaseStorage.instance;

class AddProductsScreenTopImage extends StatefulWidget {
  const AddProductsScreenTopImage({
    Key? key,
  }) : super(key: key);

  @override
  State<AddProductsScreenTopImage> createState() =>
      _AddProductsScreenTopImageState();
}

class _AddProductsScreenTopImageState extends State<AddProductsScreenTopImage> {
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
        const SizedBox(height: defaultPadding / 2),
        SizedBox(height: defaultPadding),
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 8,
              child: Column(
                children: [
                  const Text(
                    "Form Product",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  const SizedBox(height: defaultPadding / 2),
                  Container(
                      alignment: Alignment.center,
                      width: 200,
                      height: 200,
                      color: Colors.black26,
                      child: _image != null
                          ? Image.file(
                              _image!,
                              fit: BoxFit.cover,
                            )
                          : const Text('Add image')
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

class AddProductsForm extends StatefulWidget {
  const AddProductsForm({
    Key? key,
  }) : super(key: key);

  @override
  State<AddProductsForm> createState() => _AddProductsFormState();
}

class _AddProductsFormState extends State<AddProductsForm> {
  final title = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          const Text('Product data'),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: TextFormField(
              controller: title,
              style: const TextStyle(color: Colors.black87),
              textInputAction: TextInputAction.next,
              //cursorColor: kPrimaryColor,
              onSaved: (title) {},
              decoration: const InputDecoration(
                hintText: "Your title",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.account_circle_rounded),
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          ElevatedButton.icon(
            icon: const Icon(Icons.assignment_ind_rounded),
            onPressed: () async {
              if (_image != null && title.text.isNotEmpty) {
                print(title.text);
                print(_image!.path);
                //final String name = _image!.path.split('/').last;
                final String ext = _image!.path.split('.').last;
                //print('NAME -> $name');
                print('EXT -> $ext');
                String path = '${title.text}.$ext';
                print('PATH -> $path');
                final Reference reference =
                    storage.ref().child('products').child(path);
                final UploadTask uploadTask = reference.putFile(_image!);
                print(uploadTask);
                final TaskSnapshot snapshot =
                    await uploadTask.whenComplete(() => true);
                print(snapshot);
                if (snapshot.state == TaskState.success) {
                  final String url = await snapshot.ref.getDownloadURL();
                  print(url);
                  print('SE SUBIOOOO');
                  final storageRef = FirebaseStorage.instance.ref().child("products");
                  final listResult = await storageRef.listAll();
                  for (var item in listResult.items) {
                    // The items under storageRef.
                    print('=> ${await item.getDownloadURL()}');
                  }
                } else {
                  print('algo fallo');
                }
              } else {
                print('FALTA DATAAAAA');
              }
            },
            label: Text("Add Product".toUpperCase()),
          ),
          const SizedBox(height: defaultPadding),
        ],
      ),
    );
  }
}
