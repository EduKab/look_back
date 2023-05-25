import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:look_back/models/product_model.dart';
import 'package:look_back/settings/theme_config.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';

File? _image;
final FirebaseStorage storage = FirebaseStorage.instance;
final docProduct = FirebaseFirestore.instance.collection('products').doc();

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
  final desc = TextEditingController();
  final name = TextEditingController();
  final price = TextEditingController();

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
              controller: name,
              style: const TextStyle(color: Colors.black87),
              textInputAction: TextInputAction.next,
              //cursorColor: kPrimaryColor,
              onSaved: (name) {},
              decoration: const InputDecoration(
                hintText: "Name",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.production_quantity_limits_rounded),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: TextFormField(
              controller: desc,
              style: const TextStyle(color: Colors.black87),
              textInputAction: TextInputAction.next,
              //cursorColor: kPrimaryColor,
              onSaved: (name) {},
              decoration: const InputDecoration(
                hintText: "Description",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.description_rounded),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: TextFormField(
              controller: price,
              style: const TextStyle(color: Colors.black87),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              //cursorColor: kPrimaryColor,
              onSaved: (name) {},
              decoration: const InputDecoration(
                hintText: "Price",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.monetization_on_rounded),
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          ElevatedButton.icon(
            icon: const Icon(Icons.assignment_ind_rounded),
            onPressed: () async {
              // final storageRef =
              //     FirebaseStorage.instance.ref().child("products");
              // final listResult = await storageRef.listAll();
              // for (var item in listResult.items) {
              //   // The items under storageRef.
              //   print('=> ${await item.getDownloadURL()}');
              // }
              if (_image != null &&
                  name.text.isNotEmpty &&
                  desc.text.isNotEmpty &&
                  price.text.isNotEmpty) {
                // print(name.text);
                // print(_image!.path);
                //final String name = _image!.path.split('/').last;
                final String ext = _image!.path.split('.').last;
                //print('NAME -> $name');
                String path = '${name.text.replaceAll(' ','').toLowerCase()}_${docProduct.id}.$ext';
                print('PATH -> $path');
                final Reference reference =
                    storage.ref().child('products').child(path);
                final UploadTask uploadTask = reference.putFile(_image!);
                print(uploadTask);
                final TaskSnapshot snapshot =
                    await uploadTask.whenComplete(() => true);
                print(snapshot);
                if (snapshot.state == TaskState.success) {
                  final String urlImg = await snapshot.ref.getDownloadURL();
                  print(urlImg);
                  print('SE SUBIOOOO');
                  final prod = Product(
                      desc: desc.text,
                      id: docProduct.id,
                      name: name.text,
                      price: double.parse(price.text),
                      url: urlImg);
                  final json = prod.toJson();
                  await docProduct.set(json).then((value) {
                    print('AgregadOO');
                    print(json.values);
                    CoolAlert.show(
                      context: context,
                      type: CoolAlertType.success,
                      title: 'Added product',
                      text: 'The product ${name.text} was added',
                      confirmBtnText: 'Accept',
                      confirmBtnColor: Colors.green,
                    ).then((value) {
                      Navigator.pop(context);
                    });
                  });
                } else {
                  print('algo fallo');
                  CoolAlert.show(
                    context: context,
                    type: CoolAlertType.error,
                    title: 'Error',
                    text: 'snapshot.state',
                    confirmBtnText: 'Accept',
                    //confirmBtnColor: Colors.green,
                  );
                }
              } else {
                print('FALTA DATAAAAA');
                CoolAlert.show(
                  context: context,
                  type: CoolAlertType.warning,
                  title: 'Empty fields',
                  text: 'Complete all the form',
                  confirmBtnText: 'Accept',
                  //confirmBtnColor: Colors.green,
                );
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
