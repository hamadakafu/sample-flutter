import 'package:flutter_app/pages/sampleFirebase/model/counter.dart';
import 'package:flutter_app/pages/sampleFirebase/service/interface/iCounterRepository.dart';

class CounterService {
  ICounterRepository _counterRepository;

  CounterService(this._counterRepository);

  Future<Counter> increment(Counter counter) async {
    Counter newC = Counter(counter.count + 1);
    return _counterRepository
        .save(newC)
        .then((value) => _counterRepository.getLatest());
  }

  Future<Counter> fetchLatest() {
    return _counterRepository.getLatest();
  }
}
