import 'package:flutter/widgets.dart';
import 'package:flutter_app/pages/sampleFirebase/model/counter.dart';
import 'package:flutter_app/pages/sampleFirebase/service/common/counterService.dart';
import 'package:flutter_app/pages/sampleFirebase/service/interface/iCounterRepository.dart';

class CounterStore with ChangeNotifier {
  CounterService _counterService;
  Counter counter;

  CounterStore(CounterService counterService, Counter counter) {
    this._counterService = counterService;
    this.counter = counter;
  }

  static Future<CounterStore> future(CounterService counterService) async {
    var cs = CounterStore(counterService, null);
    cs.counter = await cs._counterService.fetchLatest();
    return cs;
  }

  Future<void> fetchLatest() async {
    this.counter = await _counterService.fetchLatest();
    notifyListeners();
  }

  void incrementCounter() async {
    counter = await _counterService.increment(counter);
    notifyListeners();
  }
}
