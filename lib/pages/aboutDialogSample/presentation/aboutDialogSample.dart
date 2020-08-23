import 'package:flutter/material.dart';

/// onTapでshowAboutDialog()でもできる
class AboutDialogSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AboutDialogSample'),
      ),
      body: AboutDialog(
        applicationName: 'applicationName',
        applicationIcon: Icon(Icons.get_app),
        applicationLegalese: 'applicationLegalese copyright...',
        applicationVersion: 'version v1.0.1',
        children: [
          Text('children 0'),
          Text('children 1'),
        ],
      ),
    );
  }
}
