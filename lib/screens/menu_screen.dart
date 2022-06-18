import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              'test1',
            ),
          ),
          SizedBox(
            width: 100,
            child: TextField(
              decoration: const InputDecoration(
                hintText: "Enter Your Text...",
                hintStyle: TextStyle(
                  color: Colors.purple,
                  fontStyle: FontStyle.italic,
                ),
              ),
              onChanged: (value) {},
            ),
          )
        ],
      ),
    );
  }
}
