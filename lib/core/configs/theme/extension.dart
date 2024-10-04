// ----------------   SizeBox Extension --------------

import '../../export_file.dart/export.dart';

extension SizeBox on num {
  SizedBox get ph => SizedBox(height: toDouble());
  SizedBox get pw => SizedBox(width: toDouble());
  // how i can call in UI Part => 33.ph
}

// Margin Extension
extension MarginPadding on num {
  EdgeInsets get m => EdgeInsets.all(toDouble());
  EdgeInsets get mh => EdgeInsets.symmetric(horizontal: toDouble());
  EdgeInsets get mv => EdgeInsets.symmetric(vertical: toDouble());
  // how i can call in UI Part => 33.m
}

// Padding Extension
extension PaddingExtension on num {
  EdgeInsets get p => EdgeInsets.all(toDouble());
  EdgeInsets get hp => EdgeInsets.symmetric(horizontal: toDouble());
  EdgeInsets get pv => EdgeInsets.symmetric(vertical: toDouble());
  // how i can call in UI Part => 20.p
  // Getter for both horizontal and vertical padding
  EdgeInsets phv(double verticalPadding) {
    return EdgeInsets.symmetric(
        horizontal: toDouble(), vertical: verticalPadding);
  }
  // how i can call in UI Part => 20.phv(32)
  //  horizontal 20 and vertical 32
}

// Color Extension

extension ColorExtension on String {
  Color get color {
    final hexColor = replaceFirst('#', '');
    return Color(int.parse('0xFF$hexColor'));
  }
// how i can call in UI Part =>  final Color myColor = "#3498db".toColor; // Converts hex to Color
}

// TextStyle Extension

extension TextStyleExtension on TextStyle {
  TextStyle get headline {
    return copyWith(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );
  }

  TextStyle get body {
    return copyWith(
      fontSize: 16,
      color: Colors.grey[700],
    );
  }
  // how i can call in UI Part =>TextStyle().headline,
}

//  Widget Extension
extension WidgetExtension on Widget {
  Widget padded(value) {
    return Padding(
      padding: value,
      child: this,
    );
  }

  Widget centered() {
    return Center(child: this);
  }

  Widget size(double sbw, double sbh) {
    return SizedBox(height: sbh, width: sbw);
  }

  // ============ Example of Call in UI
  // Text('Hello, Flutter!')
  // .padded(16) // Applies padding around the text
  // .centered(); // Centers the text in the parent widget
}

//============= Image Extension
extension ImageExtension on String {
  // Load image from assets
  Image get assetImage {
    return Image.asset(this);
  }

  // Load image from network
  Image get networkImage {
    return Image.network(this);
  }

  // Load image from assets with specified width and height
  Image assetImageWithSize({double? width, double? height, BoxFit? fit}) {
    return Image.asset(
      this,
      width: width,
      height: height,
      fit: fit,
    );
  }

  // Load network image with specified width and height
  Image networkImageWithSize({double? width, double? height, BoxFit? fit}) {
    return Image.network(
      this,
      width: width,
      height: height,
      fit: fit,
    );
  }

  // How we call this extension
//   Container(
//   child: 'https://example.com/image.png'.networkImage,
// );
}
