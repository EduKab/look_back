import 'package:flutter/material.dart';

class LoadingModalWidget extends StatelessWidget {
  const LoadingModalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(100, 100, 100, 100),
      child:Center(child: Image.network('https://th.bing.com/th/id/R.8a8b9aa10a3f10fa43de706626a59eaa?rik=FXVieREtb9YMgQ&pid=ImgRaw&r=0')),
    );
  }
}