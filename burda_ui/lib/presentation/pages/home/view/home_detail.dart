import 'package:burda_ui/models/product_model.dart';
import 'package:flutter/material.dart';

class HomeDetail extends StatefulWidget {
  const HomeDetail({super.key, required this.data});
  final ProductModel data;

  @override
  State<HomeDetail> createState() => _HomeDetailState();
}

class _HomeDetailState extends State<HomeDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detaile'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Image.network(widget.data.image ?? 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg'),
          ),
          Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(
                      widget.data.title!,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      widget.data.description!,
                      style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      widget.data.price.toString(),
                      style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 30, color: Colors.green),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
