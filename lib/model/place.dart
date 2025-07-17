
import 'dart:io';

import 'package:uuid/uuid.dart';

class Place {

Place({required this.title, required this.image}) : id = Uuid().v1();
    String title;
    String id;
    File image;

    
}

