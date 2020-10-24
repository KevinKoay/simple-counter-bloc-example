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
