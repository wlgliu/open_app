import 'package:flutter/material.dart';

import 'package:open_app/open_app.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isInstalledApp = false;
  String packageName = 'com.tencent.mobileqq';

  @override
  void initState() {
    super.initState();

    _isInstalledApp();

  }

  _isInstalledApp() async {
    bool isInstall = await OpenApp.isInstalledApp(packageName);

    setState(() {
      isInstalledApp = isInstall;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Open APP'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Text('应用包名: $packageName'),
            ),

            Container(
              child: Text('是否安装该应用: ${isInstalledApp ? '是' : '否'}'),
            ),

            RaisedButton(
              onPressed: () async {
                if (!isInstalledApp) {
                  print('未安装该应用');
                  return;
                }
                
                bool result = await OpenApp.openApp(packageName);
                print('${result ? '打开成功！' : '打开失败！'}');
              },
              child: Text('打开App'),
            ),
          ],
        ),
      ),
    );
  }
}
