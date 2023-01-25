import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class Nav extends StatelessWidget {
  const Nav({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Spacer(),
        ElevatedButton(
          onPressed: () {
            print('hello from create cards');
          },
          child: const Text('Create Cards'),
        ),
        Spacer(),
        ElevatedButton(
          onPressed: () {
            print('hello from review cards');
          },
          child: const Text('Review Cards'),
        ),
        Spacer(),
      ],
    );
  }
}
