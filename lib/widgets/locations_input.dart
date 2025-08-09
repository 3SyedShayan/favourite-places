import 'dart:convert';

import 'package:favorite_places/widgets/location_image.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;

class LocationInput extends StatefulWidget {
  LocationInput({super.key, required this.onSelectLocation});
  @override
  _LocationInputState createState() => _LocationInputState();
  void Function(String location) onSelectLocation;
}

class _LocationInputState extends State<LocationInput> {
  String? locationName;
  Location? _currentLocation;
  var isGettingLocation = false;
  bool gotLocation = false;
  var lat;
  var lng;
  void onGetLocation() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    setState(() {
      isGettingLocation = true;
    });

    locationData = await location.getLocation();
    setState(() {
      isGettingLocation = false;
    });
    print('Location: ${locationData.latitude}, ${locationData.longitude}');
    lat = locationData.latitude;
    lng = locationData.longitude;
    String api = 'RTo4WVCTs3am1diZitHU';

    final url = Uri.parse(
      'https://api.maptiler.com/geocoding/$lng,$lat.json?key=$api',
    );
    print("The Url is $url");
    final response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print('data: ${data['features'][0]['place_name']}');
      locationName = data['features'][0]['place_name'];
      widget.onSelectLocation(locationName!);

      setState(() {
        gotLocation = true;
      });
      print("gotLocation executed");
    } else {
      print('Error fetching location data: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget previewContent = Text(
      'No Location Chosen',
      style: TextStyle(color: Colors.white),
    );
    if (isGettingLocation) {
      previewContent = CircularProgressIndicator();
    }
    if (gotLocation) {
      previewContent = LocationImage(lat: lat, lng: lng);
      print("LocationImage widget created with lat: $lat, lng: $lng ");
    }
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.white)),
          height: 200,
          child: Center(child: previewContent),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(
              onPressed: onGetLocation,
              label: Text('Get Current Location'),
              icon: Icon(Icons.location_on),
            ),
            TextButton.icon(
              onPressed: () {},
              label: Text('Select on Map'),
              icon: Icon(Icons.map),
            ),
          ],
        ),
      ],
    );
  }
}
