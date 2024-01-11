import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const String name = 'buttons_screen';
  const ButtonsScreen({super.key});

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Screen'),
      ),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: (){
          context.pop();
        }
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.center,
          spacing: 10,
          children: [
            ElevatedButton(onPressed: (){}, child: const Text('Elevated button')),
            const ElevatedButton(onPressed: null, child: Text('Elevated button disabled')),
            ElevatedButton.icon(onPressed: (){}, icon: const Icon(Icons.access_alarm_rounded), label: const Text('Elevated button icon')),

            FilledButton(onPressed: (){}, child: const Text('Filled button')),
            FilledButton.icon(onPressed: (){}, icon: const Icon(Icons.accessibility_new),label: const Text('Filled button icon')),

            OutlinedButton(onPressed: (){}, child: const Text('Outline button')),
            OutlinedButton.icon(onPressed: (){},icon: const Icon(Icons.terminal),label: const Text('Outline button icon')),

            TextButton(onPressed: (){}, child: const Text('Text button')),
            TextButton.icon(onPressed: (){}, icon: const Icon(Icons.account_box_rounded) ,label: const Text('Text button icon')),

            // TODO custom button
            const CustomButton(),


            IconButton(onPressed: (){}, icon: const Icon(Icons.app_registration_rounded)),
            IconButton(
              onPressed: (){}, 
              icon: const Icon(Icons.app_registration_rounded),
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(colors.primary)
              ),
            ),

          ],
        ),
      ),
    );
  }
}


class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: colors.primary,
        child: InkWell(
          splashColor: Colors.red,
          onTap: (){},
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: Text('Custom button',style: TextStyle(color: Colors.white),)
          ),
        ),
      ),
    );
  }
}