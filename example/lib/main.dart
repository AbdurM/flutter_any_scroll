import 'package:example/custom_scroll_behavior.dart';
import 'package:example/gateway.dart';
import 'package:example/image_cell.dart';
import 'package:example/picsum_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_any_scroll/flutter_any_scroll.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Any Scroll Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Any Scroll Demo Home Page'),
      scrollBehavior: CustomScrollBehavior(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<ImageCell> _images = [];

  final _gateway = Gateway();

  Future<void> getImages() async {
    final rawImages = await _gateway.getImages();
    setState(() {
      for (final value in rawImages) {
        _images.add(
          ImageCell(
            picsumImage: PicSumImage.fromJson(value as Map<String, dynamic>),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: FlutterAnyScroll(
          header: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.white70,
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 50, bottom: 10),
              child: Center(
                child: Text(
                  'Any scroll demo',
                  style: GoogleFonts.caesarDressing(
                    textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          crossAxisCount: 5,
          mainAxisCount: 5,
          crossAxisSpacing: 5,
          children: _images,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImages,
        tooltip: 'Get Images',
        child: const Icon(Icons.add),
      ),
    );
  }
}
