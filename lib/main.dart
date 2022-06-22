import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'model/knowledge_demo.dart';
import 'page/cycle_page.dart';
import 'page/mixin_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<KnowledgeDemo> lists = [
    KnowledgeDemo('生命周期', const CyclePage()),
    KnowledgeDemo('mixin extends implements', const MixinPage()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo'),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) => ListTile(
          title: Text(lists[index].title),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (BuildContext context) => lists[index].child),
          ),
        ),
        itemCount: lists.length,
      ),
    );
  }
}
