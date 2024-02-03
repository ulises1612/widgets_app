import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {

  static const name = 'counter_screen';

  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final int clickCounter = ref.watch(counterProvider);
    final bool isThemeDarkMode = ref.watch(isDarkModeProvider);

    return Scaffold(
      appBar: AppBar(
        title:  Text('Counter screen',style: Theme.of(context).textTheme.titleLarge,),
        actions: [
          IconButton(
            icon:  Icon(isThemeDarkMode?Icons.light_mode:Icons.dark_mode),
            onPressed: (){
              ref.read(isDarkModeProvider.notifier).update((state) => !state);
            }, 
          )
        ],
      ),
      body:  Center(child: Text('Valor:$clickCounter')),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          ref.read(counterProvider.notifier).state++;
          // ref.read(counterProvider.notifier).update((state) => state + 1);
        }, 
        child: const Icon(Icons.add),
      ),
    );
  }
}