import 'package:flutter/material.dart';
import 'package:fzc_app/components/bottom_navigaton_bar.dart';

class TabsNavigation extends StatefulWidget {
  const TabsNavigation({super.key});

  @override
  State<TabsNavigation> createState() => _TabsNavigationState();
}

class _TabsNavigationState extends State<TabsNavigation> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
