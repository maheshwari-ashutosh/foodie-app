import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:foodie/model/meal.dart';
import 'package:foodie/widgets/meal_card_metadata.dart';
import 'package:transparent_image/transparent_image.dart';

class MealCard extends StatelessWidget {
  const MealCard({super.key, required this.meal});

  final Meal meal;

  get affordabilityLabel {
    return meal.affordability == Affordability.affordable
        ? "Affordable"
        : "Pricy";
  }

  get difficultyLabel {
    switch (meal.complexity) {
      case Complexity.easy:
        return "Easy";
      case Complexity.medium:
        return "Medium";
      default:
        return "Difficult";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () {},
        child: Stack(
          children: [
            FadeInImage(
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(
                meal.imageUrl,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                height: 60,
                child: ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 20),
                      child: Column(
                        children: [
                          Text(
                            meal.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                            maxLines: 1,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              MealCardMetadata(
                                icon: Icons.timelapse,
                                label: '${meal.duration} min',
                              ),
                              MealCardMetadata(
                                icon: Icons.attach_money_rounded,
                                label: affordabilityLabel,
                              ),
                              MealCardMetadata(
                                icon: Icons.auto_stories_rounded,
                                label: difficultyLabel,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
