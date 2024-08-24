import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mental_healh_app/configs/constants/appImages.dart';
import 'package:mental_healh_app/core/theme.dart';
import 'package:mental_healh_app/features/meditations/presentation/bloc/meditation_bloc.dart';
import 'package:mental_healh_app/features/meditations/presentation/bloc/meditation_state.dart';
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
        body: BlocBuilder<MeditationBloc, MeditationState>(
            builder: (context, state) {
          if (state is MeditationLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is DailyQuoteLoaded) {
            return Container(
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Feelingbutton(
                          onTap: () {},
                          label: "Happy",
                          image: Appimages.happy,
                          color: DefaultColors.pink,
                        ),
                        Feelingbutton(
                          onTap: () {},
                          label: "Calm",
                          image: Appimages.calm,
                          color: DefaultColors.purple,
                        ),
                        Feelingbutton(
                          onTap: () {},
                          label: "Relaxed",
                          image: Appimages.relax,
                          color: DefaultColors.orange,
                        ),
                        Feelingbutton(
                          onTap: () {},
                          label: "Focused",
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
                        description:
                            "Lets open up to the thing that matters to you",
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
            );
          } else if (state is MoodMessageLoaded) {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: Text('My message for you',
                          style: Theme.of(context).textTheme.titleLarge),
                      content: Text(state.moodMessage.text,
                          style: Theme.of(context).textTheme.titleMedium),
                      actions: [
                        TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text('Ok',
                                style: Theme.of(context).textTheme.labelSmall)),
                      ],
                    ));
            return Container();
          } else if (state is MeditationError) {
            return Center(
              child: Text(
                state.message,
                style: Theme.of(context).textTheme.labelSmall,
              ),
            );
          } else {
            return Center(
              child: Text(
                "No Quotes found",
                style: Theme.of(context).textTheme.labelSmall,
              ),
            );
          }
        }));
  }
}
