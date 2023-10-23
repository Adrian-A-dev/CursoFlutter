import 'package:flutter/material.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {

  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (value){
        setState(() {
          navDrawerIndex = value;
        });
      },
      children: const [
        NavigationDestination(
          icon: Icon(Icons.add), 
          label: Text('Home screen'),
        ),

        NavigationDestination(
          icon: Icon(Icons.add_shopping_cart_rounded), 
          label:Text('Otra pantalla'),
          ),
      ]
    );
}}

