import 'package:flutter/material.dart';
import 'widget/char/char.dart';
import 'widget/Mosque/Mosque.dart';
import 'widget/ramadan_lantern/ramadan_lantern.dart';
import 'widget/star/star.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 226, 211),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 100,
              width: double.infinity,
            ),
            Wrap(
              children: const [
                CharWidget(
                  char: "R",
                  widthAndHeight: 100,
                ),
                CharWidget(
                  char: "A",
                  widthAndHeight: 100,
                ),
                CharWidget(
                  char: "M",
                  widthAndHeight: 100,
                ),
                CharWidget(
                  char: "A",
                  widthAndHeight: 100,
                ),
                CharWidget(
                  char: "D",
                  widthAndHeight: 100,
                ),
                CharWidget(
                  char: "A",
                  widthAndHeight: 100,
                ),
                CharWidget(
                  char: "N",
                  widthAndHeight: 100,
                ),
              ],
            ),
            const SizedBox(
              height: 50,
              width: double.infinity,
            ),
            Wrap(
              children: const [
                CharWidget(
                  char: "K",
                  widthAndHeight: 80,
                ),
                CharWidget(
                  char: "A",
                  widthAndHeight: 80,
                ),
                CharWidget(
                  char: "R",
                  widthAndHeight: 80,
                ),
                CharWidget(
                  char: "E",
                  widthAndHeight: 80,
                ),
                CharWidget(
                  char: "E",
                  widthAndHeight: 80,
                ),
                CharWidget(
                  char: "M",
                  widthAndHeight: 80,
                ),
              ],
            ),
            const SizedBox(
              height: 100,
              width: double.infinity,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                RamadanLanternWidget(
                  ramadanLanternPosition: RamadanLanternPosition.left,
                ),
                StarWidget(
                  radius: 30,
                  color: Colors.amber,
                  numPoints: 5,
                  lineWidth: 2,
                ),
                MosqueWidget(
                  size: 200.0,
                ),
                //FlutterLogoWidget(),
                StarWidget(
                  radius: 30,
                  color: Colors.amber,
                  numPoints: 5,
                  lineWidth: 2,
                ),
                RamadanLanternWidget(
                  ramadanLanternPosition: RamadanLanternPosition.right,
                ),
              ],
            ),
            const SizedBox(
              height: 100,
              width: double.infinity,
            ),
            Wrap(
              children: const [
                CharWidget(
                  char: "F",
                  widthAndHeight: 60,
                ),
                CharWidget(
                  char: "L",
                  widthAndHeight: 60,
                ),
                CharWidget(
                  char: "U",
                  widthAndHeight: 60,
                ),
                CharWidget(
                  char: "T",
                  widthAndHeight: 60,
                ),
                CharWidget(
                  char: "T",
                  widthAndHeight: 60,
                ),
                CharWidget(
                  char: "E",
                  widthAndHeight: 60,
                ),
                CharWidget(
                  char: "R",
                  widthAndHeight: 60,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
