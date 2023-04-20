import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String id = "home_page";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{

  late final AnimationController _controller =AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  )..repeat();

  late final  Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final bool _isLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/img.png"),
              fit: BoxFit.cover
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [
                Colors.black.withOpacity(.6),
                Colors.black.withOpacity(.5),
                Colors.black.withOpacity(.4),
                Colors.black.withOpacity(.1),
              ],
            ),
          ),
          child: FadeInDown(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text("Find the best parties near you", style: TextStyle(color: Colors.yellowAccent, fontSize: 40, fontWeight: FontWeight.bold),),
                const SizedBox(height: 50,),
                const Text("Let us find you a party for your interest", style: TextStyle(color: Colors.greenAccent, fontSize: 25),),
                const SizedBox(height: 300,),

                _isLogin ?

                // #START button
                Container(
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.yellow[900],
                  ),
                  child: const Center(
                    child: Text("Start", style: TextStyle(color: Colors.white, fontSize: 18),),
                  ),
                )
                    :
                Row(
                  children: [
                    // #GOOGLE button
                    Expanded(
                      child: Container(
                        height: 55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.red,
                        ),
                        child: const Center(
                          child: Text("Google", style: TextStyle(color: Colors.white, fontSize: 18),),
                        ),
                      ),
                    ),

                    const SizedBox(width: 10,),
                    // #FACEBOOK button
                    Expanded(
                      child: Container(
                        height: 55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.blue,
                        ),
                        child: const Center(
                          child: Text("Facebook", style: TextStyle(color: Colors.white, fontSize: 18),),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}