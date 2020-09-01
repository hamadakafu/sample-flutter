import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/sampleFirebase/model/counter.dart';
import 'package:flutter_app/pages/sampleFirebase/presentation/notifier/counter.dart';
import 'package:flutter_app/pages/sampleFirebase/repository/counter.dart';
import 'package:flutter_app/pages/sampleFirebase/service/common/counterService.dart';
import 'package:flutter_app/pages/sampleFirebase/service/interface/iCounterRepository.dart';
import 'package:provider/provider.dart';

/// TODO: incrementボタンが押されたときにくるくるが入るようにする
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
        body: FutureBuilder(
          future: counterService.fetchLatest(),
          builder: (BuildContext context, AsyncSnapshot<Counter> snapshot) {
            if (snapshot.error != null) {
              // TODO: error handling
            }
            // ここをConnectionState.doneじゃないやつにすると期待通りにリロード画面が間に入る
            if (snapshot.data == null ||
                snapshot.connectionState != ConnectionState.done) {
              return new Center(child: new CircularProgressIndicator());
            }
            return ChangeNotifierProvider(
              create: (context) => CounterStore(counterService, snapshot.data),
              child: CounterWidget(),
            );
          },
        ));
  }
}

class CounterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Counter counter =
        context.select((CounterStore store) => store.counter);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: 50,
          child: Center(
            child: Text('count: ${counter.count}'),
          ),
        ),
        FloatingActionButton(
          onPressed: () {
            // readはonPressedのときとか中でしか読んではいけない
            context.read<CounterStore>().incrementCounter();
          },
        ),
      ],
    );
  }
}
