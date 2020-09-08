import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/sampleFirebase/model/counter.dart';
import 'package:flutter_app/pages/sampleFirebase/presentation/notifier/counter.dart';
import 'package:flutter_app/pages/sampleFirebase/repository/counter.dart';
import 'package:flutter_app/pages/sampleFirebase/service/common/counterService.dart';
import 'package:flutter_app/pages/sampleFirebase/service/interface/iCounterRepository.dart';
import 'package:provider/provider.dart';

/// TODO: DI IoCを試してみる
/// DIのうまいやり方わからん
/// ```
/// return CounterStore(repo: CounterRepositoryFirestore());
/// ```
class CounterHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('titiefja'),
      ),
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            lazy: false,
            create: (BuildContext context) {
              // FIXME: repo渡すんじゃなくてservice渡したほうがいい
              // FIXME: singletonオブジェクトにしたほうがいい
              return CounterStore(repo: CounterRepositoryFirestore());
            },
          ),
        ],
        child: CounterWidget(),
      ),
    );
  }
}

class CounterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CounterStore _counterStore = Provider.of<CounterStore>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FutureBuilder(
          future: _counterStore.futureCounter,
          builder: (BuildContext context, AsyncSnapshot<Counter> snapshot) {
            if (snapshot.error != null) {
              // TODO: error handling
            }
            // ここをConnectionState.doneじゃないやつにすると期待通りにリロード画面が間に入る
            if (snapshot.data == null ||
                snapshot.connectionState != ConnectionState.done) {
              return new Center(child: new CircularProgressIndicator());
            }
            return Container(
              height: 50,
              child: Center(
                child: Text('count: ${snapshot.data.count}'),
              ),
            );
          },
        ),
        FutureBuilder(
            future: _counterStore.futureCounter,
            builder: (BuildContext context, AsyncSnapshot<Counter> snapshot) {
              if (snapshot.error != null) {
                // TODO: error handling
              }
              // ここをConnectionState.doneじゃないやつにすると期待通りにリロード画面が間に入る
              if (snapshot.data == null ||
                  snapshot.connectionState != ConnectionState.done) {
                return new Center(child: new CircularProgressIndicator());
              }
              return FloatingActionButton(
                onPressed: () {
                  // readはonPressedのときとか中でしか読んではいけない
                  context.read<CounterStore>().incrementCounter();
                },
              );
            }),
      ],
    );
  }
}
