import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodie/model/meal.dart';
import 'package:foodie/screens/meal_detail_screen.dart';
import 'package:foodie/utils/meals.dart';
import 'package:foodie/widgets/meal_card_metadata.dart';
import 'package:transparent_image/transparent_image.dart';

class MealCard extends ConsumerStatefulWidget {
  const MealCard({
    super.key,
    required this.meal,
    this.shouldPreventNavigation = false,
  });

  final Meal meal;
  final bool shouldPreventNavigation;

  @override
  ConsumerState<MealCard> createState() => _MealCardState();
}

class _MealCardState extends ConsumerState<MealCard> {
  get affordabilityLabel {
    return widget.meal.affordability == Affordability.affordable
        ? "Affordable"
        : "Pricy";
  }

  get difficultyLabel {
    switch (widget.meal.complexity) {
      case Complexity.easy:
        return "Easy";
      case Complexity.medium:
        return "Medium";
      default:
        return "Difficult";
    }
  }

  _setFavorite() {
    setState(() {
      widget.meal.isFavorite = !widget.meal.isFavorite;
    });

    if (widget.meal.isFavorite) {
      ref.read(mealsProvider.notifier).setFavorite(widget.meal);
      ScaffoldMessenger.maybeOf(context)?.clearSnackBars();
      ScaffoldMessenger.maybeOf(context)?.showSnackBar(
        SnackBar(
          content: Text('Added ${widget.meal.title} in Favorites List'),
          duration: const Duration(seconds: 3),
        ),
      );
    } else {
      ref.read(mealsProvider.notifier).removeFavorite(widget.meal);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () => _renderMealDetailScreen(context),
        child: Stack(
          children: [
            FadeInImage(
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(
                widget.meal.imageUrl,
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
                            widget.meal.title,
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
                                label: '${widget.meal.duration} min',
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
            ),
            Positioned(
              top: 4,
              right: 4,
              child: IconButton(
                iconSize: 40,
                onPressed: _setFavorite,
                icon: Icon(
                  widget.meal.isFavorite ? Icons.star : Icons.star_border,
                  color: widget.meal.isFavorite
                      ? Colors.amber.shade300
                      : Colors.white,
                  grade: 50,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _renderMealDetailScreen(BuildContext context) {
    if (widget.shouldPreventNavigation) return;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (pageContext) => MealDetailScreen(
          meal: widget.meal,
        ),
      ),
    );
  }
}
