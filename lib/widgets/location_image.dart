import 'package:flutter/material.dart';

class LocationImage extends StatefulWidget {
  LocationImage({super.key, required this.lat, required this.lng});

  @override
  State<LocationImage> createState() => _MyWidgetState();
  var lat;
  var lng;
}

String apiKey = 'c1d2fa825f42480dae8224cf7dc1456c';
String mapId = 'streets-v2';

class _MyWidgetState extends State<LocationImage> {
  initState() {
    super.initState();
    getLocationImage(); // ✅ Call this in initState to avoid infinite rebuilds
  }

  bool gotImage = false;
  void getLocationImage() {
    Uri uri = Uri.parse(
      'https://maps.geoapify.com/v1/staticmap?style=osm-bright&width=600&height=400&center=lonlat:${widget.lng},${widget.lat}&zoom=14.3838&apiKey=$apiKey',
    );
    final imageURL = uri.toString();
    print('Image URL: $imageURL');
    setState(() {
      gotImage = true;
    });
    // Here you can use the imageURL to display the image in your widget
    // For example, you can use Image.network(imageURL) to show the image
    print('Got Image: $gotImage');
  }

  @override
  Widget build(BuildContext context) {
    Widget showImage;
    if (gotImage) {
      showImage = Image.network(
        'https://maps.geoapify.com/v1/staticmap?style=osm-bright&width=600&height=400&center=lonlat:${widget.lng},${widget.lat}&zoom=14.3838&apiKey=$apiKey',
      );
    } else {
      showImage = Container(
        width: 400,
        height: 300,
        child: Center(child: CircularProgressIndicator()),
      );

      print('Image loaded successfully');
    }
    return showImage;
  }
}
