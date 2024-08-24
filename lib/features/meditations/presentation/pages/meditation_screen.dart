import 'package:flutter/material.dart';
import 'package:mental_healh_app/configs/constants/appImages.dart';
import 'package:mental_healh_app/core/theme.dart';
import 'package:mental_healh_app/features/meditations/presentation/widgets/feelingButton.dart';
import 'package:mental_healh_app/features/meditations/presentation/widgets/task_card.dart';

class MeditationScreen extends StatelessWidget {
  const MeditationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Image.asset(
          Appimages.menuBurger,
        ),
        actions: const [
          CircleAvatar(
            backgroundImage: AssetImage(Appimages.profile),
          ),
          SizedBox(
            width: 16,
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Welcome back, Sabrina",
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(
                height: 32,
              ),
              Text("How are feeeling today?",
                  style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(
                height: 16,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Feelingbutton(
                    label: "Relaxed",
                    image: Appimages.happy,
                    color: DefaultColors.pink,
                  ),
                  Feelingbutton(
                    label: "Relaxed",
                    image: Appimages.calm,
                    color: DefaultColors.purple,
                  ),
                  Feelingbutton(
                    label: "Relaxed",
                    image: Appimages.relax,
                    color: DefaultColors.orange,
                  ),
                  Feelingbutton(
                    label: "Relaxed",
                    image: Appimages.focus,
                    color: DefaultColors.lightteal,
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                'Today\'s Task',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(
                height: 16,
              ),
              TaskCard(
                  title: "Noon",
                  description: "Lets open up to the thing that matters to you",
                  color: DefaultColors.task1),
              const SizedBox(
                height: 16,
              ),
              TaskCard(
                  title: "Evening",
                  description: "Lets tell you what you want to do",
                  color: DefaultColors.task2),
              const SizedBox(
                height: 16,
              ),
              TaskCard(
                  title: "Night",
                  description: "Take a deep breath and relax",
                  color: DefaultColors.task3),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
