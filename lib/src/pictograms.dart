import 'package:flutter/material.dart';

final Map<int, Color> groupColor = {
  1: Colors.yellow,
  2: const Color(0xFFFF6900),
  3: Colors.green,
  4: Colors.blue,
  5: Colors.purple,
  6: Colors.black,
};

/// Widget that displays a picture and a text
class Pictograms extends StatelessWidget {
  /// The text to display
  final String text;

  /// The callback to call when the widget is tapped
  final VoidCallback onTap;

  /// The callback to call when the widget is long pressed
  final VoidCallback? onLongPress;

  /// The height of the widget
  final double? height;

  /// The width of the widget
  final double? width;

  /// The border radius of the widget
  final double borderRadius;

  /// The image url to display
  ///
  /// deprecated Use [image] instead
  @Deprecated("Use image instead")
  final String? imageUrl;

  /// The color number of the widget
  final int colorNumber;

  /// The image to display
  final Widget? image;

  /// To disable the widget with the gradient
  final bool disable;

  /// to show add functionality
  final bool add;

  /// add function
  final VoidCallback? addFunc;

  final double? maxFontSize;
  final double? minFontSize;
  final Color? customAddColor;
  final Color? customProgressColor;
  final Color? backgroundColor;
  final Color? textColor;
  final double? iconSize;

  /// Constructor
  ///
  /// [text] The text to display
  ///
  /// The text, onTap, and colorNumber parameters are required
  ///
  /// The onLongPress, height, width, imageUrl, and image parameters are optional
  ///
  /// The image parameter takes precedence over the imageUrl parameter
  ///
  /// The colorNumber parameter must be between 1 and 6
  ///
  /// The height and width parameters must be greater than 0
  const Pictograms({
    Key? key,
    this.text = '',
    required this.onTap,
    this.height,
    this.width,
    this.onLongPress,
    this.imageUrl,
    this.image,
    this.colorNumber = 6,
    this.borderRadius = 16,
    this.disable = false,
    this.add = false,
    this.addFunc,  this.maxFontSize,  this.minFontSize, this.customAddColor, this.customProgressColor, this.backgroundColor, this.textColor, this.iconSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    assert(colorNumber >= 1 && colorNumber <= 6);
    assert(image != null || imageUrl != null);
    double screenWidth = MediaQuery.of(context).size.width;
    double fontSize = (screenWidth * 0.03).clamp(minFontSize??6.0,maxFontSize??12);
    // Adjust as needed


    return SizedBox(
      width: width,
      height: height,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: GestureDetector(
          onLongPress: onLongPress,
          onTap: add ? addFunc : onTap,
          child: Stack(
            children: [
              Container(
                height: height??119,
                width: width??96,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color:backgroundColor??Colors.white,
                  borderRadius: BorderRadius.circular(borderRadius),
                  border: Border.all(color: groupColor[colorNumber]!, width: 3),
                ),
                child: Flex(
                  direction: Axis.vertical,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      flex: 2,
                      child: SizedBox(
                        width: 80,
                        height: 80,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: imageUrl != null
                              ? Image.network(
                            imageUrl!,
                            fit: BoxFit.fill,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Center(
                                child: CircularProgressIndicator(
                                  color:customProgressColor??Colors.orange,
                                  value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null,
                                ),
                              );
                            },
                          )
                              : image != null
                              ? image!
                              : Container(),
                        ),
                      ),
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      child: Text(
                        text == '' ? '' : text.toUpperCase(),
                        style: TextStyle(
                          fontSize: fontSize,
                          fontWeight: FontWeight.w600,
                          color: textColor??Colors.black
                        ),
                        maxLines: 3,
                        textAlign: TextAlign.center,
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
              ),
              add
                  ? SizedBox(
                height: height??119,
                width: width??96,
                child: Center(
                  child: Container(
                    width: iconSize??40,
                    height: iconSize??40,
                    decoration: BoxDecoration(
                      color:customAddColor??groupColor[2],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child:  Icon(
                      Icons.add,
                      color: Colors.white,
                      size: iconSize??40,
                    ),
                  ),
                ),
              )
                  : Container(),
              disable
                  ? Container(
                height: height??119,
                width: width??96,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
              )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
