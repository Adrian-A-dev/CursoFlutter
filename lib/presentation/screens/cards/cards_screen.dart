import 'package:flutter/material.dart';

const cards = <Map<String, dynamic>>[
  {  'elevation':0.0, 'label': 'Elevation 0' },
  {  'elevation':0.1, 'label': 'Elevation 1' },
  {  'elevation':0.2, 'label': 'Elevation 2' },
  {  'elevation':0.3, 'label': 'Elevation 3' },
  {  'elevation':0.4, 'label': 'Elevation 4' },
  {  'elevation':0.5, 'label': 'Elevation 5' },
];


class CardsScreen extends StatelessWidget {

  static const String name = 'cads_screen';

  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('cards Screen'),
      ),
      body: const _CardsView(),
    );
  }
}

class _CardsView extends StatelessWidget {
  const _CardsView();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(//widget de un unico hijo que no es tipo lista pero de igual forma hace scroll
      child: Column(
        children: [
    
          ...cards.map(
            (card) => _CardType1(label: card['label'], elevation: card['elevation']),
          ),
    
          ...cards.map(
            (card) => _CardType2(label: card['label'], elevation: card['elevation']),
          ),

          ...cards.map(
            (card) => _CardType3(label: card['label'], elevation: card['elevation']),
          ),

          ...cards.map(
            (card) => _CardType4(label: card['label'], elevation: card['elevation']),
          ),

          const SizedBox(height: 50),
        ],
      ),
    );
  }
}

class _CardType1 extends StatelessWidget {

  final String label;
  final double elevation;

  const _CardType1({
    required this.label, 
    required this.elevation});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: (){}, 
                icon: const Icon(Icons.more_vert_outlined)
                ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(label),
            ),
          ],
        ),
      ),
    );
  }
}


class _CardType2 extends StatelessWidget {

  final String label;
  final double elevation;

  const _CardType2({
    required this.label, 
    required this.elevation});

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        side: BorderSide(
          color: colors.outline
        ),
      ),
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: (){}, 
                icon: const Icon(Icons.more_vert_outlined)
                ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text('$label - outline'),
            ),
          ],
        ),
      ),
    );
  }
}


class _CardType3 extends StatelessWidget {

  final String label;
  final double elevation;

  const _CardType3({
    required this.label, 
    required this.elevation});

  @override
  Widget build(BuildContext context) {

     final colors = Theme.of(context).colorScheme;

    return Card(
      color: colors.surfaceVariant,
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: (){}, 
                icon: const Icon(Icons.more_vert_outlined)
                ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text('$label - Filled'),
            ),
          ],
        ),
      ),
    );
  }
}



class _CardType4 extends StatelessWidget {

  final String label;
  final double elevation;

  const _CardType4({
    required this.label, 
    required this.elevation});

  @override
  Widget build(BuildContext context) {


    return Card(
      clipBehavior: Clip.hardEdge,//aca redondeamos los bordes de esta tarjeta y hacemos que los hijos no se salgan del borde
      elevation: elevation,
      child: Stack(
        children: [

          Image.network('https://picsum.photos/id/${elevation.toInt()}/600/350',
          height: 350,
          fit: BoxFit.cover,
          ),

          Align(
            alignment: Alignment.topRight,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20))
              ),
              child: IconButton(
                onPressed: (){}, 
                icon: const Icon(Icons.more_vert_outlined)
                ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Text('$label - images'),
          ),
        ],
      ),
    );
  }
}

