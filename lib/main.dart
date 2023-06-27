import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const SplashScreen(child: ,themeManager: ,),
      home: const Placeholder(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen(
      {super.key, required this.child, required this.themeManager});
  final Widget child;
  // final ThemeManager themeManager;
  final themeManager;
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool first = true;
  bool firstIn = true;

  @override
  void initState() {

    Future.delayed(Duration(milliseconds: 1500)).then((_) {
      setState(() {
        firstIn = false;
      });
    });

    Future.delayed(Duration(milliseconds: 2500)).then((_) {
      setState(() {
        first = false;
      });
    });


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: AnimatedCrossFade(
            firstChild: Splash(),
            secondChild: widget.child,
            crossFadeState:
            first ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            duration: const Duration(milliseconds: 300)),
      ),
    );
  }

  Widget Splash() {
    return AnimatedCrossFade(
        secondChild: Container(
          // width: double.infinity,
          height: MediaQuery.of(context).size.height,
          color: widget.themeManager.appPrimaryColor,
          child: SizedBox(
            height: 100,
            width: 0.8,
            child: Image.asset('assets/images/ahadith-for-splash.png'),
          ),
        ),
        firstChild: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          color: Colors.black,
        ),
        crossFadeState:
        firstIn ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        duration: const Duration(milliseconds: 300));
  }
}
