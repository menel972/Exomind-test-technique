import 'dart:async';

import '../bloc.dart';

class TimerBloc extends Bloc {
  TimerBloc() {
    startTimer();
  }
  final _controller = StreamController<num>();
  Sink<num> get _sink => _controller.sink;
  Stream<num> get stream => _controller.stream;

  ///
  /// start a timer wich add 1 to width each second
  ///
  startTimer() {
    num width = 0;
    _sink.add(width);
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timer.tick == 60) timer.cancel();
      width++;
      _sink.add(width);
    });
  }

  @override
  dispose() => _controller.close();
}
