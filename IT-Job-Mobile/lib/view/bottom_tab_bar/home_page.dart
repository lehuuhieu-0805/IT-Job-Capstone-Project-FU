import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:it_job_mobile/constants/app_color.dart';
import 'package:it_job_mobile/constants/app_text_style.dart';
import 'package:it_job_mobile/view/pages/view_info_company_page.dart';
import 'package:line_icons/line_icons.dart';
import 'package:swiping_card_deck/swiping_card_deck.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SwipingCardDeck deck = SwipingCardDeck(
      cardDeck: getCardDeck(),
      onDeckEmpty: () => debugPrint("Card deck empty"),
      onLeftSwipe: (Card card) => debugPrint("Swiped left!"),
      onRightSwipe: (Card card) => debugPrint("Swiped right!"),
      cardWidth: 300,
      swipeThreshold: MediaQuery.of(context).size.width / 3,
      minimumVelocity: 1000,
      rotationFactor: 0.8 / 3.14,
      swipeAnimationDuration: const Duration(milliseconds: 500),
    );
    return Container(
      color: AppColor.white,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.bottomCenter,
            children: [
              deck,
              Positioned(
                bottom: 80.0,
                left: 60.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'FPT Software',
                      style: AppTextStyles.h3White,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Java Developer > 3 year',
                      style: AppTextStyles.h4White,
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      'HCM city',
                      style: AppTextStyles.h4White,
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: -30.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(45),
                        color: AppColor.white.withOpacity(0.75),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.clear),
                        iconSize: 35,
                        color: AppColor.black,
                        onPressed: deck.animationActive
                            ? null
                            : () => deck.swipeLeft(),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      alignment: Alignment.center,
                      height: 85,
                      width: 85,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(45),
                        color: AppColor.white.withOpacity(0.75),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.thumb_up_alt_outlined),
                        iconSize: 50,
                        color: AppColor.black,
                        onPressed: deck.animationActive
                            ? null
                            : () => deck.swipeRight(),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      alignment: Alignment.center,
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(45),
                        color: Colors.white.withOpacity(0.75),
                      ),
                      child: IconButton(
                        onPressed: deck.animationActive
                            ? null
                            : () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ViewInfoCompanyPage(
                                      id: "123",
                                    ),
                                  ),
                                ),
                        icon: const Icon(LineIcons.info),
                        iconSize: 35,
                        color: AppColor.black,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<Card> getCardDeck() {
    List<Card> cardDeck = [];
    for (int i = 0; i < 500; ++i) {
      cardDeck.add(
        Card(
            color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                .withOpacity(1.0),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(40),
              ),
            ),
            child: const SizedBox(height: 500, width: 300)),
      );
    }
    return cardDeck;
  }
}
