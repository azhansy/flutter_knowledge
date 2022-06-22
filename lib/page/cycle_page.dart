import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../utils/logger.dart';
class CycleLessPage extends StatelessWidget {
  const CycleLessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('无状态'),));
  }
}

class CyclePage extends StatefulWidget {
  const CyclePage({Key? key}) : super(key: key);

  @override
  State<CyclePage> createState() => _CyclePageState();
}

class _CyclePageState extends State<CyclePage> {
  @override
  void initState() {
    super.initState();
    logger.i('初始化页面，initState===$context');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //一般RouteObserver会放在这里注册
    logger.i('initState后会调用，didChangeDependencies===$context');
  }

  @override
  void reassemble() {
    super.reassemble();
    logger.i('JIT热更新后，会先执行 reassemble===');
  }

  @override
  Widget build(BuildContext context) {
    logger.i('构建渲染页面，build===');
    return Scaffold(
        appBar: AppBar(),
        resizeToAvoidBottomInset: true,
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 500,
              ),
              TextField(),
              TextButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (BuildContext context) => const CycleLessPage()),
                  ),
                  child: const Text('StatefulWidget 生命周期')),
            ],
          ),
        ));
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    logger.i('主要是设置诊断树的一些特性，用作调试， debugFillProperties===');
  }

  @override
  void activate() {
    super.activate();
    logger.i('activate===');
  }

  @override
  void deactivate() {
    super.deactivate();
    logger.i('页面关掉前，deactivate===');
  }

  @override
  void dispose() {
    super.dispose();
    logger.i('页面关掉后，退出页面，dispose===');
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    logger.i('setState===');
  }

  @override
  void didUpdateWidget(CyclePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    logger.i('didUpdateWidget===');
  }
}
