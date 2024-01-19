import 'package:flutter/material.dart';
import 'package:meals_app/models/meals.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem(
      {super.key, required this.mealItem, required this.onTapMenuItem});
  final Meal mealItem;
  final Function() onTapMenuItem;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 220.0,
        child: Card(
            margin: const EdgeInsets.all(8),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            clipBehavior: Clip.hardEdge,
            elevation: 2,
            child: InkWell(
              onTap: () {
                onTapMenuItem();
              },
              child: Stack(
                children: [
                  FadeInImage(
                    placeholder: MemoryImage(kTransparentImage),
                    image: NetworkImage(mealItem.imageUrl),
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: Container(
                        color: Colors.black.withOpacity(0.8),
                        padding: const EdgeInsets.all(6),
                        child: Column(children: [
                          Text(
                            mealItem.title,
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 12),
                        ]),
                      )),
                ],
              ),
            )));
  }
}
