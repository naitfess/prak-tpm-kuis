import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  final String name;
  final String price;

  const OrderPage({Key? key, required this.name, required this.price})
    : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final TextEditingController _quantityController = TextEditingController();
  double total = 0;
  String message = '';

  void _calculateTotal() {
    final quantity = int.tryParse(_quantityController.text) ?? 0;
    final price =
        double.tryParse(widget.price.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;
    setState(() {
      if (quantity > 0) {
        total = quantity * price;
        message = '';
      } else {
        total = 0;
        message = 'Masukkan Angka Yang Valid!';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 16),
        iconTheme: IconThemeData(color: Colors.white),
        title: Text('Detail Order',),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Image.asset('assets/images/piring.jfif'),
            ),
            Text(
              widget.name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text('Harga: ${widget.price}'),
            _OrderQuantity(_quantityController),
            _OrderButton(_calculateTotal),
            _OrderTotal(total),
            if(message.isNotEmpty) Text(message, style: TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}

Widget _OrderQuantity(TextEditingController controller) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.shopping_cart),
        hintText: "Jumlah",
        contentPadding: EdgeInsets.all(8.0),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.green),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.green),
        ),
      ),
    ),
  );
}

Widget _OrderButton(VoidCallback onPressed) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
      ),
      onPressed: onPressed, child: const Text('Pesan', style: TextStyle(color: Colors.white)),
    ),
  );
}

Widget _OrderTotal(double totalPrice) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: Text(
      'Total: Rp. ${totalPrice.toStringAsFixed(0)}',
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    ),
  );
}
