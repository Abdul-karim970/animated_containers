import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyAnimatedContainer(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyAnimatedContainer extends StatefulWidget {
  const MyAnimatedContainer({super.key, required this.title});

  final String title;

  @override
  State<MyAnimatedContainer> createState() => _MyAnimatedContainerState();
}

class _MyAnimatedContainerState extends State<MyAnimatedContainer> {
  double innerContainerHeight = 0;
  double outerContainerHeight = 100;
  double outerContainerWidth = 200;
  String outerContainerText = 'Click Here';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            InkWell(
              onTap: () async {
                setState(() {
                  innerContainerHeight = 0;
                });
                await Future.delayed(const Duration(milliseconds: 600));

                setState(() {
                  outerContainerWidth = 200;
                  outerContainerText = 'Click Here';

                  outerContainerHeight = 100;
                });
              },
              child: AnimatedContainer(
                alignment: Alignment.center,
                width: 200,
                height: innerContainerHeight,
                duration: const Duration(milliseconds: 500),
                decoration: BoxDecoration(
                    color: Colors.blueGrey.shade100,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5,
                        offset: Offset(3, 3),
                      )
                    ]),
                child: const SizedBox(
                  width: 150,
                  height: 50,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      'Flutter Magic',
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                setState(() {
                  outerContainerWidth = 20;
                  outerContainerHeight = 200;
                });

                await Future.delayed(const Duration(milliseconds: 600));
                setState(() {
                  innerContainerHeight = 200;
                  outerContainerText = '';
                });
              },
              child: AnimatedContainer(
                alignment: Alignment.center,
                duration: const Duration(milliseconds: 500),
                width: outerContainerWidth,
                height: outerContainerHeight,
                decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5,
                        offset: Offset(3, 3),
                      )
                    ]),
                child: SizedBox(
                  width: 150,
                  height: 35,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      outerContainerText,
                      style: const TextStyle(color: Colors.white, fontSize: 22),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

double degToRad(double deg) {
  return deg * pi / 180;
}
