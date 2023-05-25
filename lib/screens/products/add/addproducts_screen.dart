import 'package:flutter/material.dart';
import 'package:look_back/settings/responsive.dart';
import 'package:look_back/components/background.dart';
import 'package:look_back/screens/products/add/addproduts_body.dart';


class AddProductsScreen extends StatefulWidget {
  const AddProductsScreen({Key? key}) : super(key: key);

  @override
  State<AddProductsScreen> createState() => _AddProductsScreenState();
}

class _AddProductsScreenState extends State<AddProductsScreen> {

  @override
  Widget build(BuildContext context) {
    return const Background(
      child: SingleChildScrollView(
        child: Responsive(
            mobile: MobileAddProductsScreen(),
            desktop: DesktopSingupScreen()),
      ),
    );
  }
}

class MobileAddProductsScreen extends StatelessWidget {
  const MobileAddProductsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        AddProductsScreenTopImage(),
        Row(
          children: [
            Spacer(),
            Expanded(
              flex: 8,
              child: AddProductsForm(),
            ),
            Spacer(),
          ],
        ),
        // const SocalSignUp()
      ],
    );
  }
}

class DesktopSingupScreen extends StatelessWidget {
  const DesktopSingupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: AddProductsScreenTopImage(),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 450,
                child: AddProductsForm(),
              ),
              SizedBox(height: 8.0),
              // SocalSignUp()
            ],
          ),
        )
      ],
    );
  }
}
