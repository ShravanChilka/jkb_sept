import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:jkb_sept/counter_page.dart';
import 'package:jkb_sept/counter_view_model.dart';
import 'package:jkb_sept/login_screen.dart';
import 'package:jkb_sept/theme_view_model.dart';
import 'package:provider/provider.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    log('$runtimeType build method called');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter - Provider'),
        actions: const [
          ChangeThemeIconButton(),
          SizedBox(width: 16),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'login $hashCode',
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) {
                    return ChangeNotifierProvider.value(
                      value: context.read<CounterViewModel>(),
                      child: const LoginScreen(),
                    );
                  },
                ),
              );
            },
            child: const Icon(Icons.login),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            heroTag: 'counter $hashCode',
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const CounterPage(),
                ),
              );
            },
            child: const Icon(Icons.arrow_forward),
          ),
        ],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const MeraProviderWalaTextWidget(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FilledButton(
                  onPressed: () {
                    context.read<CounterViewModel>();
                    context.read<CounterViewModel>().decrement();
                  },
                  child: const Text('Decrement'),
                ),
                const SizedBox(width: 16),
                FilledButton(
                  onPressed: () {
                    context.read<CounterViewModel>();
                    context.read<CounterViewModel>().increment();
                  },
                  child: const Text('Increment'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ChangeThemeIconButton extends StatelessWidget {
  const ChangeThemeIconButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.watch<ThemeViewModel>().isDarkMode;
    return IconButton.filledTonal(
      onPressed: () {
        context.read<ThemeViewModel>().changeTheme();
      },
      icon: Icon(
        isDarkMode ? Icons.light_mode : Icons.dark_mode,
      ),
    );
  }
}

class MeraProviderWalaTextWidget extends StatelessWidget {
  const MeraProviderWalaTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    int counter = context.watch<CounterViewModel>().counter;

    log('$runtimeType build called');

    return Text(
      counter.toString(),
      style: Theme.of(context).textTheme.displayLarge,
    );
  }
}
