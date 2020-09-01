import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/sampleFirebase/model/counter.dart';
import 'package:flutter_app/pages/sampleFirebase/presentation/notifier/counter.dart';
import 'package:flutter_app/pages/sampleFirebase/repository/counter.dart';
import 'package:flutter_app/pages/sampleFirebase/service/common/counterService.dart';
import 'package:flutter_app/pages/sampleFirebase/service/interface/iCounterRepository.dart';
import 'package:provider/provider.dart';

/// TODO: DI IoCを試してみる
class SampleFirebaseHome extends StatelessWidget {
  CounterService counterService;

  SampleFirebaseHome(ICounterRepository counterRepository) {
    this.counterService = CounterService(counterRepository);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('titiefja'),
      ),
      body: ChangeNotifierProvider(
        create: (context) =>
            CounterStore(counterService, counterService.fetchLatest()),
        child: CounterWidget(),
      ),
    );
  }
}

class CounterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Future<Counter> futureCounter =
        context.select((CounterStore store) => store.futureCounter);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FutureBuilder(
          future: futureCounter,
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
            future: futureCounter,
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
