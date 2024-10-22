# Pictograms
Welcome to pictograms a new pictograms library based on Picto_Widget from OTTAA Project

## Getting Started

This project will used to create pictograms that can adjust in the screen dynamically.

## How to use

```flutter
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
            childAspectRatio: 1,
            crossAxisSpacing: 12,
            mainAxisSpacing: 4,
          ),
          itemCount: 30,
          itemBuilder: (context, index) {
            return index % 2 == 0
                ? CircularPictogram(
                    onTap: () {
                      print('on tap');
                    },
                    maxFontSize: 15,
                    minFontSize: 0,
                    text: 'UNA BICICLETERIA',
                    image: CachedNetworkImage(
                      imageUrl:
                          "https://static.arasaac.org/pictograms/2282/2282_300.png",
                      fit: BoxFit.cover,
                    ),
                    colorNumber: index % 6 + 1,
                    onLongPress: () {
                      print('long pressed');
                    },
                    disable: index % 3 == 0,
                    customAddColor: index % 4 == 0
                        ? Colors.redAccent
                        : index % 2 == 0
                            ? Colors.green
                            : Colors.white,
                    customProgressColor: Colors.redAccent.shade100,
                    backgroundColor: index % 4 == 0
                        ? Colors.blueGrey
                        : index % 2 == 0
                            ? Colors.white
                            : Colors.blue,
                    textColor: index % 4 == 0
                        ? Colors.white
                        : index % 2 == 0
                            ? Colors.black
                            : Colors.yellowAccent,
                    pictoSize: 180,
                    add: index == 10,
                    iconSize: index == 10 ? 70 : null,
                  )
                : Pictograms(
                    maxFontSize: 11,
                    minFontSize: 0,
                    onTap: () {
                      print('tapped');
                    },
                    text: 'UNA BICICLETERIA',
                    image: CachedNetworkImage(
                      imageUrl:
                          "https://static.arasaac.org/pictograms/2282/2282_300.png",
                      fit: BoxFit.cover,
                    ),
                    colorNumber: index % 6 + 1,
                    onLongPress: () {
                      print('long pressed');
                    },
                    disable: index % 3 != 0,
                    add: index== 21,
                    customAddColor: Colors.redAccent,
                    customProgressColor: Colors.redAccent.shade100,
                    backgroundColor: index % 4 == 0
                        ? Colors.blueGrey
                        : index % 2 == 0
                            ? Colors.white
                            : Colors.blue,
                    textColor: index % 4 == 0
                        ? Colors.white
                        : index % 2 == 0
                            ? Colors.black
                            : Colors.yellowAccent,
                    height: index % 2 == 0 ? 200 : null,
                    width: index % 2 == 0 ? 200 : null,

                    iconSize: index % 4 == 0
                        ? 40
                        : index % 2 == 0
                            ? 80
                            : null,

                  );
          },
        ),
      ),
    );
  }
}



```
## Properties:

* text: set the pictograms name
* onTap: Tap Action
* onLongPress: Long Press Action
* addFunc: create another function
* height: Custom height of the widget
* width: Custom width of the widget
* add: create an Add Button
* disable: disable the Icon
* colorNumber: Border Color of the widget
* borderRadius: Custom Border Radius
* image: Image or Icon to display
* imageUrl: Load An Image from the web
* minFontSize: minimum font Size for default is 0
* maxFontSize: maximum font size for default is 12
* customAddColor: change the add Icon color
* customProgressColor: progressBar color
* backgroundColor: set a custom background color for default is white
* iconSize: set the Size of the addIcon
* pictoSize: use only with circular pictograms

[Example](./assets/capture.png)

## CircularPictogram
 ### How To Implements

```flutter
 CircularPictogram(
    onTap: () { print('on tap');},
    maxFontSize: 15,
    minFontSize:0,
    text:'Hello'
    pictoSize:180,
    iconSize: 80
 )
```

### How To Implements Disable

```flutter
 CircularPictogram(
    onTap: () { print('on tap');},
    maxFontSize: 15,
    minFontSize:0,
    text:'Hello'
    pictoSize:180,
    iconSize: 80,
    disable: true
 )
```
### How To Implements Add

```flutter
 CircularPictogram(
    onTap: () { print('on tap');},
    onAdd:(){ print('Add Action')}
    maxFontSize: 15,
    minFontSize:0,
    text:'Hello'
    pictoSize:180,
    iconSize: 80,
    add: true
 )
```

## Pictograms
### How To Implements

```flutter
 Pictograms(
    onTap: () { print('on tap');},
    maxFontSize: 15,
    minFontSize:0,
    text:'Hello'
    disable: false,
    height:180,
    width:90,
    add:false,
    iconSize: 80
 )
```

### How To Implements Disable Function

```flutter
 Pictograms(
    onTap: () { print('on tap');},
    maxFontSize: 15,
    minFontSize:0,
    text:'Hello'
    disable: true,
    height:180,
    width:90,
    add:false,
    iconSize: 80
 )
```

### How To Implements Add Function

```flutter
 Pictograms(
    onTap: (){ print('on tap');},
    onAdd: (){print('on Add');}
    maxFontSize: 15,
    minFontSize:0,
    text:'Hello'
    disable: false,
    height:180,
    width:90,
    add:true,
    iconSize: 80
 )
```