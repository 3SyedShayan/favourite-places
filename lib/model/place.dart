import 'dart:io';

import 'package:uuid/uuid.dart';

class Place {
  Place({required this.title, required this.image, required this.location})
    : id = Uuid().v1();
  String title;
  String id;
  File image;
  String location;
}
