import 'dart:async';

import 'package:flutter_app/pages/sampleFirebase/model/counter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/pages/sampleFirebase/service/interface/iCounterRepository.dart';

class CounterRepositoryFirestore extends ICounterRepository {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> save(Counter counter) async {
    var counts = firestore.collection('counts');
    counts
        .add({
          'count': counter.count, // John Doe
          'date': DateTime.now(),
        })
        .then((value) => print('$value: save count: ${counter.count}'))
        .catchError((error) => print('failed error: $error'));
  }

  @override
  Future<Counter> getLatest() {
    var counts = firestore.collection('counts');
    return counts
        .orderBy('date', descending: true)
        .limit(1)
        .get()
        .then((value) {
      print(value.docs.first.data());
      return Counter(value.docs.first.data()['count']);
    });
  }
}
