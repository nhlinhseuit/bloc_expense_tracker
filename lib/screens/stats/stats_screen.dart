import 'package:bloc_expenses_tracker/screens/stats/chart.dart';
import 'package:bloc_expenses_tracker/screens/stats/widgets/download_button.dart';
import 'package:bloc_expenses_tracker/screens/stats/widgets/flip_card.dart';
import 'package:bloc_expenses_tracker/screens/stats/widgets/wave_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_custom_carousel/flutter_custom_carousel.dart';
import 'package:lottie/lottie.dart';

class StatsScreen extends StatefulWidget {
  const StatsScreen({super.key});

  @override
  State<StatsScreen> createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  final bool _over = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Theme.of(context).colorScheme.surface,
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Hello World!").animate().fade().scale(),

              DownloadButton(onPressed: () {})
                  .animate(onPlay: (controller) => controller.repeat())
                  .shimmer(delay: 4000.ms, duration: 1800.ms) // shimmer +
                  .shake(hz: 4, curve: Curves.easeInOutCubic) // shake +
                  .scale(
                      begin: const Offset(1, 1),
                      end: const Offset(1.1, 1.1),
                      duration: 600.ms) // scale up
                  .then(delay: 600.ms) // then wait and
                  .scale(
                    begin: const Offset(1, 1),
                    end: const Offset(1 / 1.1, 1 / 1.1),
                  ),

              // very basic example that scrolls children vertically from -250px to +250px
              SizedBox(
                height: 400,
                child: CustomCarousel(
                  effectsBuilder: CustomCarousel.effectsBuilderFromAnimate(
                    effects: EffectList().moveY(begin: -250, end: 250),
                  ),
                  children: [
                    DownloadButton(isYellowButton: true, onPressed: () {}),
                    DownloadButton(onPressed: () {}),
                  ],
                ),
              ),

              const FlipCard(),

              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(25),
                    topLeft: Radius.circular(25)),
                child: Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                        left: 15,
                        right: 5,
                      ),
                      height: MediaQuery.of(context).size.height * 0.13,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Color(0xff2057A6),
                          Colors.blue,
                        ],
                      )),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Credit Card',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              Text(
                                'Get your own credit\ncard with our service',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.white.withOpacity(0.7),
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                              child: Lottie.asset(
                            'assets/lottie/credit-card.json',
                            height: 70,
                          ))
                        ],
                      ),
                    ),
                    const Positioned(
                      bottom: -25,
                      left: 0,
                      right: 0,
                      child: WaterEffect(),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 30,
              ),
              const Text(
                'Transactions',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(12),
                ), // BoxDecoration
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(12, 20, 12, 12),
                  child: MyChart(),
                ), // Padding
              ) // Container
            ],
          ),
        ),
      ),
    );
  }
}
