import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mental_healh_app/presentation/bottomNavBar/bloc/navigation_bloc.dart';
import 'package:mental_healh_app/presentation/bottomNavBar/bloc/navigation_event.dart';

class BottomNavbar extends StatelessWidget {
  final List<BottomNavigationBarItem> items;
  final int currentIndex;

  const BottomNavbar(
      {super.key, required this.items, required this.currentIndex});
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: items,
      currentIndex: currentIndex,
      onTap: (index) {
        context.read<NavigationBloc>().add(NavigateTo(index: index));
      },
    );
  }
}
