import 'package:foodie/utils/uuid.dart';
import 'package:foodie/model/card_gradient.dart';

class Category {
  final String id;
  final String title;
  final CardGradient gradient;

  Category({required this.title, required this.gradient}) : id = getUuidv4();
}
