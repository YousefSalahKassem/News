import 'package:flutter/material.dart';
import 'package:newsapp/components/search_bar.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(flex: 6, child: SearchBar()),
        SizedBox(
          width: 10,
        ),
        Icon(Icons.menu, size: 30)
      ],
    );
  }
}