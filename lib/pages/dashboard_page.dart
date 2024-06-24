import 'package:auto_parts_app/utils/constants.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final List<Map<String, dynamic>> items = [
    {
      "title": "Barcode Scanner",
      "icon": Icons.qr_code_scanner,
      "routeUrl": "/barcodescanner",
    },
    {
      "title": "Sale Invoice",
      "icon": Icons.receipt_long,
      "routeUrl": "/saleinvoice",
    },
    {
      "title": "Purchase Invoice",
      "icon": Icons.shopping_cart,
      "routeUrl": "/purchaseinvoice",
    },
    // {
    //   "title": "Login Page",
    //   "icon": Icons.shopping_cart,
    //   "routeUrl": "/auth/login",
    // },
  ];

  Widget cardTile(String title, IconData icon, String routeUrl) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, routeUrl);
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Constants.secondaryColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Constants.whiteColor,
                size: 50,
              ),
              const SizedBox(height: 20),
              Text(
                title,
                style:
                    const TextStyle(color: Constants.whiteColor, fontSize: 18),
              ),
            ],
          )),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashoard"),
      ),
      body: Container(
          padding: const EdgeInsets.all(10),
          child: GridView.builder(
            itemCount: items.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                mainAxisExtent: 150),
            itemBuilder: (BuildContext context, int index) {
              return cardTile(items[index]["title"], items[index]["icon"],
                  items[index]["routeUrl"]);
            },
          )),
    );
  }
}
