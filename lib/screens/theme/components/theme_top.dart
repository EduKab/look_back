import 'package:flutter/material.dart';
import 'package:look_back/screens/theme/theme_screen.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:look_back/settings/theme_config.dart';


class ThemeTop extends StatefulWidget {
  const ThemeTop({super.key});

  @override
  State<ThemeTop> createState() => _ThemeTopState();
}

class _ThemeTopState extends State<ThemeTop> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: defaultPadding),
        Text(
          "Welcome to S O C I A L T E C",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: defaultPadding / 2),
        Column(
          children: [
            const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$counter',
                style: const TextStyle(fontSize: 200),
              ),
              CheckboxListTile(
                title: const Text('Slow Animation'),
                value: timeDilation == 5.0,
                onChanged: (value) {
                  setState(() {
                    timeDilation = value != null && value ? 5.0 : 1.0;
                  });
                },
              ),
          ],
        ),
        SizedBox(height: defaultPadding * 2),
      ],
    );
  }
}