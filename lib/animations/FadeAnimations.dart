import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class Square extends StatelessWidget {
  const Square({super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: const BoxDecoration(
        color: Colors.blueAccent,
      ),
    );
  }
}

class _MyAppState extends State<MyApp> {

  bool launchAnimation = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Text('Now with a simple Toggle', style: TextStyle(fontSize: 20),),
            Text('Boolean animate value: $launchAnimation' ),
            const SizedBox(height: 20 ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                FadeIn(animate: launchAnimation,child: const Square(),),
                FadeInUp(animate: launchAnimation,child:  const Square(),),
                FadeInDown(animate: launchAnimation,child: const Square(),),
                FadeInLeft(animate: launchAnimation,child:  const Square(),),
                FadeInRight(animate: launchAnimation,child:   const Square(),),

              ],
            ),

            const SizedBox(height: 20 ),

            ElevatedButton(onPressed: () {
              setState(() {
                launchAnimation = !launchAnimation;
              });
            }, child: const Text('Toggle animation'))
          ],
        ),
      ),
    );
  }
}