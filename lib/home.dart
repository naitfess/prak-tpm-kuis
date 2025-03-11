import 'package:flutter/material.dart';
import 'package:responsi/about.dart';
import 'package:responsi/listmenu.dart';
import 'package:responsi/login.dart';

class HomePage extends StatefulWidget {
  final String username;
  const HomePage({Key? key, required this.username}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 16),
        iconTheme: IconThemeData(color: Colors.white),
        title: Text('HomePage'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20, bottom: 10), 
                child: Text('Selamat Datang, ${widget.username}!', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AboutPage()),
                    );
                  },
                  child: Text('Klik untuk ke halaman About', style: TextStyle(color: Colors.green )),
                ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Daftar Menu :',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  children: const [
                    Menu(name: 'Nasi Goreng', price: 'Rp. 15.000'),
                    Menu(name: 'Mie Goreng', price: 'Rp. 12.000'),
                    Menu(name: 'Ayam Goreng', price: 'Rp. 10.000'),
                    Menu(name: 'Sate Ayam', price: 'Rp. 20.000'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
