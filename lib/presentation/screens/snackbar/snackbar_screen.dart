import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackBarScreen extends StatelessWidget {

  static const name = 'Snackbar_screen';

  const SnackBarScreen({super.key});


  void showCustomSnackbar(BuildContext context){

    ScaffoldMessenger.of(context).clearSnackBars();

    ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(
        content: const Text('Hola mundo'),
        action: SnackBarAction(label: 'Ok!', onPressed: (){}),
        duration: const Duration(seconds: 2),
      )
    );
  }

  void openDialog(BuildContext context){
    showDialog(
      barrierDismissible: false,
      context: context, 
      builder: (context) => AlertDialog(
        title: const Text('Estas seguro'),
        content: const Text('aslkdfjasldkfjas;lkfj ;alksdjf;laksjdf as;lkdfj a a;lksdjf;laksjdfa;lksdfa ;alksdjf;lkasjdflkasdj'),
        actions: [
          TextButton(
            onPressed: ()=> context.pop(),
            child: const Text('Cancelar'),
          ),

          FilledButton(
            onPressed: () => context.pop(), 
            child: const Text('Aceptar')
          )
        ],
      )
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y dialogos'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: (){
                showAboutDialog(
                  context: context,
                  children: [
                    const Text('dialogo que simboliza las licencias para podert mostrar algo ')
                  ]  
                );
              }, 
              child: const Text('Licencias usadas')
            ), 
            FilledButton.tonal(
              onPressed: ()=> openDialog(context), 
              child: const Text('Mostrar dialogo de pantalla')
            ), 

          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          showCustomSnackbar(context);
        }, 
        icon: const Icon(Icons.remove_red_eye),
        label: const Text('Mostrar snackar')
      ),
    );
  }
}