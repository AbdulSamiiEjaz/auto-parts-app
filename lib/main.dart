import "package:flutter/material.dart";
import "package:fzc_app/pages/barcode_scanner_page.dart";
import "package:fzc_app/pages/dashboard_page.dart";
import "package:fzc_app/pages/login_page.dart";
import "package:fzc_app/screens/splash_screen.dart";
import "package:fzc_app/utils/constants.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login Page",
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      theme: ThemeData(
          scaffoldBackgroundColor: Constants.bgColor,
          textTheme: const TextTheme(
              bodyMedium: TextStyle(color: Constants.whiteColor)),
          appBarTheme: const AppBarTheme(
              backgroundColor: Constants.secondaryColor,
              titleTextStyle: TextStyle(
                  color: Constants.whiteColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              centerTitle: true,
              iconTheme: IconThemeData(color: Constants.whiteColor))),
      routes: {
        "/": (context) => const CustomSplashScreen(),
        "/auth/login": (context) => const LoginPage(),
        "/barcodescanner": (context) => const BarcodeScannerPage(),
        "/saleinvoice": (context) => const SaleInvoicePage(),
        "/purchaseinvoice": (context) => const PurchaseInvoicePage(),
      },
    );
  }
}

class SaleInvoicePage extends StatelessWidget {
  const SaleInvoicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sale Invoice')),
      body: const Center(child: Text('Sale Invoice Page')),
    );
  }
}

class PurchaseInvoicePage extends StatelessWidget {
  const PurchaseInvoicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Purchase Invoice')),
      body: const Center(child: Text('Purchase Invoice Page')),
    );
  }
}
