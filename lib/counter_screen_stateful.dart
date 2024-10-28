import 'dart:developer';

import 'package:flutter/material.dart';

const imageUrl =
    'https://images.unsplash.com/photo-1729731322011-f945437445be?q=80&w=2187&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';

class CounterScreenStateful extends StatefulWidget {
  const CounterScreenStateful({super.key});

  @override
  State<CounterScreenStateful> createState() => _CounterScreenStatefulState();
}

class _CounterScreenStatefulState extends State<CounterScreenStateful> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    log('$runtimeType build method called');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter - Stateful Widget'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const CounterScreenStateful(),
            ),
          );
        },
        child: const Icon(Icons.arrow_forward),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: NetworkImage(imageUrl),
              width: 200,
              height: 200,
            ),
            MeraNayaTextWidget(counter: counter),
            FilledButton(
              onPressed: () {
                setState(() {
                  counter++;
                });
              },
              child: const Text('Increment'),
            )
          ],
        ),
      ),
    );
  }
}

class MeraNayaTextWidget extends StatelessWidget {
  const MeraNayaTextWidget({
    super.key,
    required this.counter,
  });

  final int counter;

  @override
  Widget build(BuildContext context) {
    return Text(
      counter.toString(),
      style: Theme.of(context).textTheme.displayLarge,
    );
  }
}
