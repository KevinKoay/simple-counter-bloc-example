# Simple Example Counter using BloC



This is an simple example of an App Counter using BloC



MyHomePage.dart

```dart
import 'package:counter_bloc/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'MyHomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Example Counter using BloC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:
          BlocProvider(create: (context) => CounterBloc(), child: MyHomePage()),
    );
  }
}
```



main.dart

```dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/counter_bloc.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Flutter Counter App using BLoC (Business Logic Component) ',
                  textAlign: TextAlign.center,
                ),
                BlocBuilder<CounterBloc, int>(
                  builder: (context, count) {
                    return Text(
                      '$count',
                      style: TextStyle(fontSize: 100),
                    );
                  },
                ),
                SizedBox(
                  width: double.infinity,
                  child: RaisedButton(
                    onPressed: () {
                      counterBloc.add(Increment());
                    },
                    child: Text('Add 1'),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: RaisedButton(
                    onPressed: () {
                      counterBloc.add(Decrement());
                    },
                    child: Text('Minus 1'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```



counter_bloc.dart

```dart
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
//  static const int _counter = 0;

//  CounterBloc() : super(CounterInitial(_counter));
  CounterBloc() : super(0);

  @override
  Stream<int> mapEventToState(
    CounterEvent event,
  ) async* {
    if (event is Increment) {
      yield state + 1;
    } else if (event is Decrement) {
      yield state - 1;
    }
  }
}
```



counter_event.dart

```dart
part of 'counter_bloc.dart';

abstract class CounterEvent {}

class Increment extends CounterEvent {}

class Decrement extends CounterEvent {}
```



counter_state.dart

```dart
part of 'counter_bloc.dart';

abstract class CounterState {}

class CounterInitial extends CounterState {}
```
