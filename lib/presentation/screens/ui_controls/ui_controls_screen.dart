import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const name = 'ui_controls_screen';

  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Controls'),
      ),
      body: const _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation { car, plane, boat, submarine }

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDeveloper = true;
  Transportation seletedTransportation = Transportation.car;

  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wanstDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics:
          const ClampingScrollPhysics(), //El atributo physics de los widgets ListView y GridView en Flutter se utiliza para especificar el comportamiento de desplazamiento del widget.
      //El atributo ClampingScrollPhysics() evita que el widget se desplace más allá de sus límites. Esto significa que el widget no se desplazará más allá de su primer o último elemento.
      children: [
        SwitchListTile(
            title: const Text('Developer Mode'),
            subtitle: const Text('Controles adicionales'),
            value: isDeveloper,
            onChanged: (value) => setState(() {
                  isDeveloper = !isDeveloper;
                })),
        ExpansionTile(
          title: const Text('Veículo de transporte'),
          subtitle: Text('$seletedTransportation'),
          children: [
            RadioListTile(
              title: const Text('By car'),
              subtitle: const Text('Viajar por auto'),
              value: Transportation.car,
              groupValue: seletedTransportation,
              onChanged: (value) => setState(() {
                seletedTransportation = Transportation.car;
              }),
            ),
            RadioListTile(
              title: const Text('By plane'),
              subtitle: const Text('Viajar por avion'),
              value: Transportation.plane,
              groupValue: seletedTransportation,
              onChanged: (value) => setState(() {
                seletedTransportation = Transportation.plane;
              }),
            ),
            RadioListTile(
              title: const Text('By boat'),
              subtitle: const Text('Viajar por barco'),
              value: Transportation.boat,
              groupValue: seletedTransportation,
              onChanged: (value) => setState(() {
                seletedTransportation = Transportation.boat;
              }),
            ),
            RadioListTile(
              title: const Text('By submarine'),
              subtitle: const Text('Viajar por submarino'),
              value: Transportation.submarine,
              groupValue: seletedTransportation,
              onChanged: (value) => setState(() {
                seletedTransportation = Transportation.submarine;
              }),
            )
          ],
        ),

        CheckboxListTile(
          title: const Text('¿Deayuno?'),
          value: wantsBreakfast, 
          onChanged: (value) => setState(() {
            wantsBreakfast = !wantsBreakfast;
          }),
        ), 
        CheckboxListTile(
          title: const Text('¿Almuerzo?'),
          value: wantsLunch, 
          onChanged: (value) => setState(() {
            wantsLunch = !wantsLunch;
          }),
        ), 
        CheckboxListTile(
          title: const Text('¿Cena?'),
          value: wanstDinner, 
          onChanged: (value) => setState(() {
            wanstDinner = !wanstDinner;
          }),
        )
      ],
    );
  }
}
