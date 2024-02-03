

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';



class SlideInfo { 
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}
  
final slides = <SlideInfo>[
  SlideInfo('Busca la comida', 'Culpa aliquip minim ad ullamco excepteur ipsum.', 'assets/images/1.png'),
  SlideInfo('Entrega la comida', 'Magna exercitation non irure esse esse occaecat ipsum est.', 'assets/images/2.png'),
  SlideInfo('Difruta la comida', 'Esse elit do nostrud commodo incididunt culpa officia mollit adipisicing.', 'assets/images/3.png'),
];


class AppTutorialScreen extends StatefulWidget {

  static const name = 'tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {

  late final PageController pageViewController = PageController();

  bool endReached = false;

  @override
  void initState() {
    super.initState();

    pageViewController.addListener(() {
      
      final page = pageViewController.page ?? 0;

      if ( !endReached && page >= (slides.length - 1.5)){
        setState(() {
          endReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [

          PageView(
            controller: pageViewController,
            children: slides.map((slideData) => _Slide(
              title: slideData.title, 
              capiton: slideData.caption, 
              imageUrl: slideData.imageUrl
            )).toList()
          ),

          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              child: const Text('Salir'),
              onPressed: () => context.pop(),
            )
          ),

          endReached ?  Positioned(
            bottom: 20,
            right: 30,
            child: FadeInRight(
              from: 15,
              delay: const Duration(seconds: 1),
              child: FilledButton(
                child: const Text('Comenzar'),
                onPressed: () => context.pop() ,
              ),
            )
          ) : const SizedBox()
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {

  final String title;
  final String capiton;
  final String imageUrl;

  const _Slide({
    required this.title, 
    required this.capiton, 
    required this.imageUrl
  });

  @override
  Widget build(BuildContext context) {

    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodyLarge;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imageUrl)),
            const SizedBox(height: 20,),
            Text(title,style: titleStyle,),
            const SizedBox(height: 20,),
            Text(capiton, style: captionStyle,),
          ],
        )
      ),
    );
  }
}