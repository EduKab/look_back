import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:look_back/settings/model_theme.dart';
import 'package:look_back/settings/responsive.dart';
import 'package:look_back/components/background.dart';
import 'theme_body.dart';

class ThemeScreen extends StatefulWidget {
  const ThemeScreen({super.key});

  @override
  State<ThemeScreen> createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {

  @override
  Widget build(BuildContext context) {
    return Consumer<ModelTheme>(
      builder: (context, ModelTheme themeNotifier, child) {
        return Scaffold(
        appBar: AppBar(
          title: const Text('Theme'),
        ),
        body: const Background(
          child: SingleChildScrollView(
            child: Responsive(
              mobile: MobileThemeScreen(),
              desktop: DesktopThemeScreen()
            ),
          ),
        ),
      );
      }
    );
  }
}

class MobileThemeScreen extends StatefulWidget {
  const MobileThemeScreen({super.key});

  @override
  State<MobileThemeScreen> createState() => _MobileThemeScreenState();
}

class _MobileThemeScreenState extends State<MobileThemeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ThemeTop(),
        Row(
          children: [
            Spacer(),
            Expanded(
              flex: 8,
              child: ThemeBody(),
            ),
            Spacer(),
          ],
        ),
      ],
    );
  }
}

class DesktopThemeScreen extends StatefulWidget {
  const DesktopThemeScreen({super.key});

  @override
  State<DesktopThemeScreen> createState() => _DesktopThemeScreenState();
}

class _DesktopThemeScreenState extends State<DesktopThemeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: ThemeTop(),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 450,
                child: ThemeBody(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
