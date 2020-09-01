import 'package:flutter_app/pages/sampleFirebase/model/counter.dart';

abstract class ICounterRepository {
  Future<void> save(Counter counter);

  Future<Counter> getLatest();
}

