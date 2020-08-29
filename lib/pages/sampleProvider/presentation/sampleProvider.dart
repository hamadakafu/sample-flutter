import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/sampleProvider/notifier/counter.dart';
import 'package:provider/provider.dart';

class SampleProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('titiefja'),
      ),
      body: ChangeNotifierProvider(
        create: (context) => CounterStore(),
        child: CounterWidget(),
      ),
    );
  }
}

class CounterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final count = context.select((CounterStore store) => store.count);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: 50,
          child: Center(
            child: Text('count: $count'),
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
