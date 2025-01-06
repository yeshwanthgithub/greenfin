import 'package:flutter/material.dart';
import 'package:green_fin/presentation/screens/account_service.dart';
import 'package:green_fin/presentation/screens/home.dart';
import 'package:green_fin/presentation/screens/payment_transfer.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _selectedIndex = 0;

  static const Map<int, String> _titles = {
    0: "Green Fin",
    1: "Account Services",
    2: "Payment Transfer",
  };

  final List<Widget> _screens = [
    const Home(),
    const AccountServiceWidget(),
    const PaymentTransfer(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedIndex] ?? '',
            style: TextStyle(
                color: Theme.of(context).textTheme.titleLarge!.color!)),
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.only(
        bottom: 20,
        left: 15,
        right: 15,
      ),
      padding: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Color(0x12B729B7),
            offset: Offset(0, -5),
            blurRadius: 30,
            spreadRadius: 0,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Theme(
          data: Theme.of(context).copyWith(
            splashFactory: NoSplash.splashFactory,
          ),
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            selectedIconTheme:
                Theme.of(context).bottomNavigationBarTheme.selectedIconTheme,
            selectedLabelStyle:
                Theme.of(context).bottomNavigationBarTheme.selectedLabelStyle,
            unselectedLabelStyle:
                Theme.of(context).bottomNavigationBarTheme.unselectedLabelStyle,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_balance_wallet),
                label: 'Accounts',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.payment),
                label: 'Transfer',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
