import 'package:flutter/material.dart';
import 'package:fzc_app/pages/dashboard_page.dart';
import 'package:fzc_app/utils/constants.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;

  final List<Widget> screens = [
    const Dashboard(),
    const Center(child: Text("User Account"))
  ];

  void changeScreen(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      minimum: const EdgeInsets.only(top: 20),
      child: Scaffold(
        body: screens[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Constants.secondaryColor,
          unselectedItemColor: Constants.whiteColor,
          selectedItemColor: Constants.primaryColor,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: changeScreen,
          items: [
            BottomNavigationBarItem(
              icon: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return FadeTransition(opacity: animation, child: child);
                },
                child: _selectedIndex == 0
                    ? Container(
                        key: ValueKey<int>(_selectedIndex),
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 5),
                          decoration: BoxDecoration(
                              color: Constants.primaryColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.dashboard_rounded,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Dashboard",
                                style: TextStyle(
                                    color: Constants.whiteColor,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      )
                    : const Icon(
                        Icons.dashboard_rounded,
                        key: ValueKey<int>(-1),
                      ),
              ),
              label: "Dashboard",
            ),
            BottomNavigationBarItem(
              icon: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return FadeTransition(opacity: animation, child: child);
                },
                child: _selectedIndex == 1
                    ? Container(
                        key: ValueKey<int>(_selectedIndex),
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 5),
                          decoration: BoxDecoration(
                              color: Constants.primaryColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.verified_user_rounded,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Account",
                                style: TextStyle(
                                    color: Constants.whiteColor,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      )
                    : const Icon(
                        Icons.verified_user_rounded,
                        key: ValueKey<int>(-1),
                      ),
              ),
              label: "Account",
            ),
          ],
        ),
      ),
    );
  }
}
