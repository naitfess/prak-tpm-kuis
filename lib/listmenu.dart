import 'package:flutter/material.dart';
import 'package:responsi/order.dart';

class Listmenu {
  final String name;
  final int price;

  const Listmenu({required this.name, required this.price});
}

List<Listmenu> listmenu = [
  Listmenu(name: 'Nasi Goreng', price: 15000),
  Listmenu(name: 'Mie Ayam', price: 12000),
  Listmenu(name: 'Sate Ayam', price: 20000),
  Listmenu(name: 'Bakso', price: 10000),
  Listmenu(name: 'Soto Ayam', price: 13000),
  Listmenu(name: 'Gado-Gado', price: 14000),
];

class Menu extends StatelessWidget {
  final String name;
  final String price;

  const Menu({Key? key, required this.name, required this.price})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 3,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
            child: Image.asset(
              'assets/images/piring.jfif',
              fit: BoxFit.cover,
              width: 100,
              height: 100,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(price, style: const TextStyle(color: Colors.green)),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrderPage(name: name, price: price),
                  ),
                );
              },
              child: const Text('Pesan', style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}