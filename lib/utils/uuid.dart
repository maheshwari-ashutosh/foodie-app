import 'package:uuid/v4.dart';

const uuidV4 = UuidV4();

String getUuidv4() {
  return uuidV4.generate();
}
