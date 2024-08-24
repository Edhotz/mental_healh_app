import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mental_healh_app/configs/constants/appImages.dart';
import 'package:mental_healh_app/features/meditations/presentation/pages/meditation_screen.dart';
import 'package:mental_healh_app/features/music/presentation/pages/playlist_screen.dart';
import 'package:mental_healh_app/presentation/bottomNavBar/bloc/navigation_bloc.dart';
import 'package:mental_healh_app/presentation/bottomNavBar/bloc/navigation_state.dart';
import 'package:mental_healh_app/presentation/bottomNavBar/widgets/bottom_navbar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    super.key,
  });

  final List<Widget> pages = [
    const MeditationScreen(),
    PlaylistScreen(),
  ];

  BottomNavigationBarItem createBottomNavigationBarItem(
      String assetName, bool isActive, BuildContext context) {
    return BottomNavigationBarItem(
        icon: Image.asset(
          assetName,
          height: 45,
          color: isActive
              ? Theme.of(context).focusColor
              : Theme.of(context).primaryColor,
        ),
        label: "Home");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: BlocBuilder<NavigationBloc, NavigationState>(
          builder: (context, state) {
        debugPrint("state name : $state");

        if (state is NavigationChanged) {
          return pages[state.index];
        }

        return pages[0];
      })),
      bottomNavigationBar: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (current, state) {
          int currentIndex = 0;
          if (state is NavigationChanged) {
            currentIndex = state.index;
          }

          final List<BottomNavigationBarItem> bottomNavBarItems = [
            createBottomNavigationBarItem(
                Appimages.menuHome, currentIndex == 0, context),
            createBottomNavigationBarItem(
                Appimages.menuSongs, currentIndex == 1, context),
          ];

          return BottomNavbar(
              items: bottomNavBarItems, currentIndex: currentIndex);
        },
      ),
    );
  }
}
