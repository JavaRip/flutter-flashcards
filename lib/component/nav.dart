import 'package:flutter/material.dart';

class Nav extends StatelessWidget {
  const Nav({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/create');
          },
          child: const Text('Create Cards'),
        ),
        const Spacer(),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/review');
          },
          child: const Text('Review Cards'),
        ),
        const Spacer(),
      ],
    );
  }
}
