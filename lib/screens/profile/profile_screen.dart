import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

    return Background(
      child: SingleChildScrollView(
        child: Responsive(
          mobile: ProfileData(
            data: widget.data,
          ),
          desktop: ProfileData(
            data: widget.data,
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

  Future<void> _asyncSimpleDialog(BuildContext context) async {
    return await showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('Select one'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  _openCameraPicker().then((value) {
                    Navigator.pop(context);
                    addPicture();
                  });
                },
                child: const Row(
                  children: [
                    Icon(Icons.add_a_photo_rounded),
                    Text(' Camera'),
                  ],
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  _openImagePicker().then((value) {
                    Navigator.pop(context);
                    addPicture();
                  });
                },
                child: const Row(
                  children: [
                    Icon(Icons.add_photo_alternate_rounded),
                    Text(' Galery'),
                  ],
                ),
              ),
            ],
          );
        });
  }

  Future<void> addPicture() async {
    print('hhh');
    if (_image != null && widget.data[2] != null) {
      String path = widget.data[2]!.split('@').first;
      print('PATH -> $path');
      CoolAlert.show(
          context: context,
          type: CoolAlertType.info,
          title: 'Are you sure?',
          text: 'Dou you want change your profile picture?',
          confirmBtnText: 'Accept',
          onConfirmBtnTap: () async {
            final Reference reference =
                storage.ref().child('users').child(path);
            final UploadTask uploadTask = reference.putFile(_image!);
            print(uploadTask);
            final TaskSnapshot snapshot =
                await uploadTask.whenComplete(() => true);
            print(snapshot);
            if (snapshot.state == TaskState.success) {
              final String urlImg = await snapshot.ref.getDownloadURL();
              User? user;
              print(urlImg);
              final credential = await FirebaseAuth.instance
                  .signInWithEmailAndPassword(
                      email: widget.data[2]!, password: widget.data[4]!)
                  .then((value) {
                user = FirebaseAuth.instance.currentUser;
                user!.updatePhotoURL(urlImg);
              });
              print('CRED -> $credential');
              CoolAlert.show(
                context: context,
                type: CoolAlertType.success,
                title: 'Success',
                text: 'Your picture has been changed',
                confirmBtnText: 'Accept',
                //confirmBtnColor: Colors.green,
              ).then((value) async {
                if (user != null) {
                  setState(() {
                    widget.data[1] = user!.photoURL;
                  });
                }
                await FirebaseAuth.instance.signOut();
                //Navigator.pop(context);
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
          }
          //confirmBtnColor: Colors.green,
          );
    } else {
      print('DOUUU');
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
                      width: 200,
                      height: 200,
                    )
                  : Image.network(
                      widget.data[1]!,
                      fit: BoxFit.cover,
                      width: 200,
                      height: 200,
                    )),
          const SizedBox(width: 20),
          widget.data[3] == 'Email'
              ? Row(
                  children: [
                    const SizedBox(width: 200),
                    // ElevatedButton.icon(
                    //     icon: const Icon(Icons.change_circle_outlined),
                    //     label: const Text('Change'),
                    //     style: ElevatedButton.styleFrom(
                    //       primary: Colors.orangeAccent.shade200,
                    //     ),
                    //     // onPressed: _openImagePicker,
                    //     onPressed: () {
                    //       _asyncSimpleDialog(context);
                    //     }),
                    InkWell(
                      child: const Row(
                        children: [
                          Icon(Icons.change_circle_outlined),
                          Text('Change',
                            style: TextStyle(
                              //color: kPrimaryColor,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                      onTap: () {
                        _asyncSimpleDialog(context);
                      },
                    )
                  ],
                )
              : const Text(
                  'Couldn\'t change picture',
                  style: TextStyle(fontSize: 10),
                ),
          // Row(
          //   children: <Widget>[
          //     Expanded(
          //       child: ElevatedButton.icon(
          //         onPressed: _openImagePicker,
          //         icon: const Icon(Icons.add_photo_alternate_rounded),
          //         label: const Text('Gallery'),
          //       ),
          //     ),
          //     const SizedBox(width: 8),
          //     Expanded(
          //       child: ElevatedButton.icon(
          //         onPressed: _openCameraPicker,
          //         icon: const Icon(Icons.add_a_photo_rounded),
          //         label: const Text('Camera'),
          //       ),
          //     ),
          //   ],
          // ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Profile ${widget.data[3]}',
                style: const TextStyle(
                  fontFamily: 'SivarPro',
                  fontSize: 30
                ),
              ),
              const SizedBox(width: 20),
              widget.data[3] == 'Google' 
                ? const CircleAvatar(
                  backgroundImage: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/2008px-Google_%22G%22_Logo.svg.png'),
                )
                : widget.data[3] == 'GitHub' 
                  ? const CircleAvatar(
                    backgroundImage: NetworkImage('https://qph.cf2.quoracdn.net/main-qimg-729a22aba98d1235fdce4883accaf81e'),
                  )
                  : const CircleAvatar( // Email
                    backgroundImage: NetworkImage('https://cdn4.iconfinder.com/data/icons/social-media-logos-6/512/112-gmail_email_mail-512.png'),
                  )
            ],
          ),
          const SizedBox(height: 20),
          // Nombre
          Text(widget.data[0]!,
            style: const TextStyle(
              fontFamily: 'KAFEINE',
              fontSize: 18
            ),
          ),
          const SizedBox(height: 20),
          // Email
          Text(widget.data[2]!,
            style: const TextStyle(
              fontFamily: 'Rochaline',
              fontSize: 20
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.exit_to_app),
            label: const Text('Sign Out'),
            style: ElevatedButton.styleFrom(
              primary: Colors.redAccent.shade200,
            ),
          ),
        ],
      ),
    );
  }
}
