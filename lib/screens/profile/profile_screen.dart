import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:look_back/components/background.dart';
import 'package:look_back/settings/responsive.dart';
import 'dart:io';

File? _image;
final FirebaseStorage storage = FirebaseStorage.instance;
final docProduct = FirebaseFirestore.instance.collection('products').doc();

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, required this.data});

  final List<String?> data;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_typing_uninitialized_variables

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile ${widget.data[3]}'),
      ),
      body: Background(
        child: SingleChildScrollView(
          child: Responsive(
            mobile: ProfileData(data: widget.data,),
            desktop: ProfileData(data: widget.data,),
          ),
        ),
      ),
    );
    
  }
}

class ProfileData extends StatefulWidget {
  const ProfileData({super.key, required this.data});

  final List<String?> data;

  @override
  State<ProfileData> createState() => _ProfileDataState();
}

class _ProfileDataState extends State<ProfileData> {

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
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          // CircleAvatar(
          //   backgroundImage: NetworkImage(widget.data[1]!),
          //   radius: 40,
          //   backgroundColor: Colors.transparent,
          // ),
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
                : Image.network(widget.data[1]!)
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: _openImagePicker,
                  icon: const Icon(Icons.add_photo_alternate_rounded),
                  label: const Text('Gallery'),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: _openCameraPicker,
                  icon: const Icon(Icons.add_a_photo_rounded),
                  label: const Text('Camera'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(widget.data[0]!),
          const SizedBox(height: 20),
          Text(widget.data[2]!),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () {
              
            },
            icon: const Icon(Icons.image),
            label: const Text('Save photo')),
            const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            icon: const Icon(Icons.exit_to_app),
            label: const Text('Sign Out')),
        ],
      ),
    );
  }
}
