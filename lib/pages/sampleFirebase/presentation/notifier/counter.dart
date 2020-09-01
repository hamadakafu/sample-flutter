import 'package:flutter/widgets.dart';
import 'package:flutter_app/pages/sampleFirebase/model/counter.dart';
import 'package:flutter_app/pages/sampleFirebase/service/common/counterService.dart';
import 'package:flutter_app/pages/sampleFirebase/service/interface/iCounterRepository.dart';

class CounterStore with ChangeNotifier {
  CounterService _counterService;
  Future<Counter> futureCounter;

  CounterStore(CounterService counterService, Future<Counter> futureCounter) {
    this._counterService = counterService;
    this.futureCounter = futureCounter;
    futureCounter.then((value) {
      notifyListeners();
    });
  }

  Future<void> fetchLatest() async {
    this.futureCounter = _counterService.fetchLatest();
    this.futureCounter.then((value) {
      notifyListeners();
    });
  }

  Future<void> incrementCounter() async {
    this.futureCounter.then((value) {
      this.futureCounter = _counterService.increment(value);
      notifyListeners();
    });
  }
}
