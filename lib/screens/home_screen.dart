import 'dart:developer' as dev;
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jkb_sept/model/hotel.dart';
import 'package:jkb_sept/widgets/hotel_card.dart';

final List<int> numbers = List.generate(
  100,
  (index) => index + 1,
);

const List<Hotel> hotels = [
  Hotel(
    name: 'Sherman Oaks',
    imageUrl:
        'https://images.unsplash.com/photo-1445019980597-93fa8acb246c?q=80&w=2948&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    address: '1 Wallech St Singapore',
    rating: 4.1,
    price: 400,
    totalBedroom: 4,
    totalBathroom: 2,
  ),
  Hotel(
    name: 'Taj',
    imageUrl:
        'https://images.unsplash.com/photo-1529290130-4ca3753253ae?q=80&w=2952&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    address: '1 Wallech St Singapore',
    rating: 4.9,
    price: 500,
    totalBedroom: 5,
    totalBathroom: 4,
  ),
  Hotel(
    name: 'German',
    imageUrl:
        'https://images.unsplash.com/photo-1445019980597-93fa8acb246c?q=80&w=2948&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    address: '1 Wallech St Singapore',
    rating: 4.1,
    price: 400,
    totalBedroom: 4,
    totalBathroom: 2,
  ),
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();
    double initialValue = 0;

    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade50,
        title: const Text('Home Screen'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: const Icon(Icons.arrow_upward),
            onPressed: () {
              scrollController.animateTo(
                0,
                curve: Curves.fastOutSlowIn,
                duration: Duration(milliseconds: 400),
              );
            },
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            child: const Icon(Icons.arrow_downward),
            onPressed: () {
              initialValue = initialValue + 201;
              scrollController.animateTo(
                initialValue,
                curve: Curves.bounceOut,
                duration: Duration(milliseconds: 400),
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          // Image(
          //   width: double.maxFinite,
          //   height: double.maxFinite,
          //   fit: BoxFit.cover,
          //   color: Colors.black.withOpacity(0.6),
          //   colorBlendMode: BlendMode.multiply,
          //   loadingBuilder: (context, child, loadingProgress) {
          //     print(loadingProgress);
          //     if (loadingProgress == null) return child;
          //     return Center(
          //       child: CircularProgressIndicator(),
          //     );
          //   },
          //   image: NetworkImage(
          //     'https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          //   ),
          // ),
          // GridView.builder(
          //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //     crossAxisCount: 2,
          //     crossAxisSpacing: 2,
          //     mainAxisSpacing: 2,
          //   ),
          //   itemCount: numbers.length,
          //   itemBuilder: (context, index) {
          //     final number = numbers[index];
          //     dev.log('built $number');
          //     return buildListItem(number);
          //   },
          // ),

          Scrollbar(
            interactive: true,
            controller: scrollController,
            thickness: 4,
            thumbVisibility: true,
            child: ListView.separated(
              controller: scrollController,
              itemCount: numbers.length,
              itemBuilder: (context, index) {
                final number = numbers[index];
                dev.log('container $number built');
                return buildListItem(number);
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  thickness: 1,
                  height: 1,
                  color: Colors.black,
                );
              },
            ),
          )
          // SingleChildScrollView(
          //   scrollDirection: Axis.vertical,
          //   child: Column(
          //     children: ,
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget buildGridView() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
      ),
      itemCount: numbers.length,
      itemBuilder: (context, index) {
        final number = numbers[index];
        dev.log('built $number');
        return buildListItem(number);
      },
    );
  }

  Container buildListItem(int number) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: getRandomColor(),
        // border: const Border(
        //   bottom: BorderSide(
        //     width: 1,
        //     color: Colors.black,
        //   ),
        // ),
      ),
      child: Center(
        child: Text(
          number.toString(),
          style: const TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 40,
          ),
        ),
      ),
    );
  }
}

Color getRandomColor() {
  return Color(Random().nextInt(0xFFFFFFFF));
}
