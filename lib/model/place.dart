
import 'package:uuid/uuid.dart';

class Place {

Place({required this.title}) : id = Uuid().v1();
    String title;
    String id;

    
}

