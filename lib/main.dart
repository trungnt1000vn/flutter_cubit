import 'package:flutter/material.dart';
import 'package:flutter_cubit/cubit/counter_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (_) => CounterCubit(),
        child: CounterPage(),
      ),
    );
  }
}
class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Counter Page'),
        ),
        body: BlocBuilder<CounterCubit,int>(
          builder: (context, count) => Center(
              child: Text("Counter now is : $count", style: TextStyle(fontSize: 20.0)),
            )
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                context.read<CounterCubit>().increment();
              },
              child: Icon(Icons.add), 
            ),
            FloatingActionButton(
              onPressed: () => context.read<CounterCubit>().decrement(),
              child: Icon(Icons.remove),  
            )
          ],
        ),
    );
  }
}
