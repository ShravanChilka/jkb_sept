import 'package:flutter/material.dart';
import 'package:jkb_sept/model/hotel.dart';
import 'package:jkb_sept/widgets/hotel_card.dart';

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
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade50,
        title: const Text('Home Screen'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
      body: Stack(
        children: [
          Image(
            width: double.maxFinite,
            height: double.maxFinite,
            fit: BoxFit.cover,
            color: Colors.black.withOpacity(0.6),
            colorBlendMode: BlendMode.multiply,
            loadingBuilder: (context, child, loadingProgress) {
              print(loadingProgress);
              if (loadingProgress == null) return child;
              return Center(
                child: CircularProgressIndicator(),
              );
            },
            image: NetworkImage(
              'https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: hotels.map((hotel) {
                return HotelCard(hotel: hotel);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
