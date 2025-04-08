import 'package:fe/services/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'models/place.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Place> places = [];

  @override
  void initState() {
    super.initState();
    loadPlaces();
  }

  void loadPlaces() async {
    final result = await ApiService.getAllPlaces();
    setState(() {
      places = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text("Hi Guy!\nWhere are you going next?",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search your destination",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Filter buttons...
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  FilterButton(icon: Icons.hotel, label: "Hotels"),
                  FilterButton(icon: Icons.flight, label: "Flights"),
                  FilterButton(icon: Icons.all_inclusive, label: "All"),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text("Popular Destinations",
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.builder(
                  itemCount: places.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3 / 4,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    final place = places[index];
                    return PlaceCard(place: place);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const FilterButton({required this.icon, required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(child: Icon(icon), backgroundColor: Colors.grey[200]),
        const SizedBox(height: 4),
        Text(label),
      ],
    );
  }
}

class PlaceCard extends StatelessWidget {
  final Place place;

  const PlaceCard({required this.place, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(place.imageUrl),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(place.name,
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              Row(
                children: [
                  const Icon(Icons.star, size: 14, color: Colors.yellow),
                  Text("${place.rating}",
                      style: const TextStyle(color: Colors.white)),
                ],
              ),
            ],
          ),
        ),
        const Positioned(
          top: 10,
          right: 10,
          child: Icon(Icons.favorite, color: Colors.red),
        ),
      ],
    );
  }
}