import 'dart:io';

import 'package:flutter/material.dart';

class ImagePickerWidget extends StatelessWidget {
  final File? fileImage;
  final VoidCallback onClicked;

  const ImagePickerWidget(
      {Key? key, this.fileImage, required this.onClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;

    return Center(
      child: Stack(
        children: [
          buildImage(),
          Positioned(bottom: 0, right: 4, child: buildEditIcon(color))
        ],
      ),
    );
  }

  Widget buildImage() {

    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: fileImage==null 
        ? GestureDetector(
            onTap: onClicked, // Image tapped
            child: Image.asset(
              'assets/images/users/user_default.jpg',
              fit: BoxFit.cover, // Fixes border issues
              width: 128.0,
              height: 128.0,
            ),
          )
        : GestureDetector(
            onTap: onClicked, // Image tapped
            child: Image.file(
              fileImage!,
              fit: BoxFit.cover, // Fixes border issues
              width: 128.0,
              height: 128.0,
            ),
          )
      ),
    );
  }

  Widget buildEditIcon(Color color) => buildCircle(
      color: Colors.white,
      all: 3,
      child: buildCircle(
        color: color,
        all: 8,
        child: const Icon(Icons.edit, color: Colors.white, size: 20)
      )
  );

  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,
  }) =>
      ClipOval(
          child: Container(
            padding: EdgeInsets.all(all),
            color: color,
            child: child,
          )
      );
}
