import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pictograms/pictograms.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pictograms Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PictoWidgetExample(),
    );
  }
}

class PictoWidgetExample extends StatelessWidget {
  const PictoWidgetExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisExtent: 119,
            childAspectRatio: 16/9,
            crossAxisSpacing: 12,
            mainAxisSpacing: 4,
          ),
          itemCount: 12,
          itemBuilder: (context, index) {
            return Pictograms(
              maxFontSize: 11,
              minFontSize: 0,
              onTap: () {
                print('tapped');
              },
              text: 'UNA BICICLETERIA',
              imageUrl: "https://static.arasaac.org/pictograms/2282/2282_300.png",
              image: CachedNetworkImage(imageUrl: "https://static.arasaac.org/pictograms/2282/2282_300.png", fit: BoxFit.cover),
              colorNumber: index % 6 + 1,
              onLongPress: () {
                print('long pressed');
              },
              disable: index % 3 == 0,
              add: index % 2 == 0,
              customAddColor: index%4==0?Colors.redAccent:index%2==0?Colors.green:Colors.white,
              customProgressColor: Colors.redAccent.shade100,
              backgroundColor: index%4==0?Colors.blueGrey:index%2==0?Colors.white:Colors.blue,
              textColor: index%4==0?Colors.white:index%2==0?Colors.black:Colors.yellowAccent,
              height: index%2==0?200:null,
              width: index%2==0?200:null,
              iconSize:index%4==0?40:index%2==0?80:null,
            );
          },
        ),
      ),
    );
  }
}
