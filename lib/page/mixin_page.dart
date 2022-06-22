import 'package:flutter/material.dart';

import '../model/mixin_a.dart';

class MixinPage extends StatefulWidget {
  const MixinPage({Key? key}) : super(key: key);

  @override
  State<MixinPage> createState() => _MixinPageState();
}

class _MixinPageState extends State<MixinPage> {
  final AB _ab = AB();
  final BA _ba = BA();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_ab.showMessage()),
            Text(_ba.showMessage()),
          ],
        ),
      ),
    );
  }
}
