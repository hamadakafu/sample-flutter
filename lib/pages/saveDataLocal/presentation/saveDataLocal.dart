import 'package:color/color.dart' as newC;
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/saveDataLocal/model/config.dart';
import 'package:flutter_app/pages/saveDataLocal/repository/config.dart';

class SaveDataLocal extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SaveDataLocalState();
}

class SaveDataLocalState extends State {
  Config _config;
  ConfigRepo _configRepo;

  String _colorStr = '';

  SaveDataLocalState() {
    // TODO: repositoryは外部から渡したほうがいいかも
    this._configRepo = ConfigRepository();
    this._config = Config(Colors.black);
  }

  void setColor(Color color) {
    setState(() {
      _config = Config(color);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SaveDataLocal'),
        backgroundColor: _config.color,
      ),
      body: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              hintText: 'black',
              labelText: 'Color',
            ),
            onChanged: (String value) {
              _colorStr = value;
            },
            validator: (String value) {
              print('$value');
              return value.contains('@') ? 'Do not use the @ char.' : null;
            },
          ),
          GestureDetector(
            onTap: () {
              var c = newC.RgbColor.name(_colorStr);
              setColor(Color.fromARGB(200, c.r, c.g, c.b));
            },
            child: Container(
              height: 50,
              child: Center(
                child: Text('set color'),
              ),
            ),
          ),
          Row(
            children: [
              RaisedButton(
                child: Text('save'),
                onPressed: () async {
                  await _configRepo.write(_config.color);
                  print('save');
                },
              ),
              RaisedButton(
                child: Text('get'),
                onPressed: () async {
                  setColor(await _configRepo.read());
                  print('get');
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
