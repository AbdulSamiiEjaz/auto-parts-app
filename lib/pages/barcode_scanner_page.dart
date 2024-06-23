import 'package:flutter/material.dart';
import 'package:fzc_app/api/product_api.dart';
import 'package:fzc_app/models/product_model.dart';
import 'package:fzc_app/utils/constants.dart';

class BarcodeScannerPage extends StatefulWidget {
  const BarcodeScannerPage({super.key});

  @override
  State<BarcodeScannerPage> createState() => _BarcodeScannerPageState();
}

class _BarcodeScannerPageState extends State<BarcodeScannerPage> {
  late Future<List<ProductModel>> _products;

  @override
  void initState() {
    super.initState();
    _products = getProducts();
  }

  Future<void> _refreshProducts() async {
    setState(() {
      _products = getProducts();
    });
  }

  Widget productCartd(String title, String id, double price) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 3),
            ),
          ],
          color: Constants.secondaryColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                id,
                style: const TextStyle(color: Colors.white),
              ),
              Text(
                '${price.toString()} AED',
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton.icon(
                onPressed: () {},
                label: const Text("View Details!"),
                icon: const Icon(Icons.arrow_forward),
                iconAlignment: IconAlignment.end,
                style: TextButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Barcode Scanner')),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: FutureBuilder(
            future: _products,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Text("Error ${snapshot.error}");
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Text("No data found!");
              } else {
                return RefreshIndicator(
                  onRefresh: _refreshProducts,
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return productCartd(
                          snapshot.data![index].title,
                          snapshot.data![index].id.toString(),
                          snapshot.data![index].price);
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                  ),
                );
              }
            }),
      ),
    );
  }
}
