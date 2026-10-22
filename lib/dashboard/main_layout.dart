import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dashboard_screen.dart';
import 'machines_screen.dart';
import 'materials_screen.dart';
import 'alerts_screen.dart';
import 'profile_screen.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      const DashboardScreen(),
      const MachinesScreen(),
      const MaterialsScreen(),
      const AlertsScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.grey[200]!, width: 1)),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: const Color(0xFF2563EB), // Primary Blue
          unselectedItemColor: Colors.grey[600],
          selectedLabelStyle: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w600),
          unselectedLabelStyle: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w500),
          elevation: 0,
          items: [
            _buildNavItem(Icons.home_outlined, Icons.home, 'Dashboard', 0),
            _buildNavItem(Icons.factory_outlined, Icons.factory, 'Machines', 1),
            _buildNavItem(Icons.inventory_2_outlined, Icons.inventory_2, 'Materials', 2),
            _buildNavItem(Icons.notifications_outlined, Icons.notifications, 'Alerts', 3),
            _buildNavItem(Icons.person_outline, Icons.person, 'Profile', 4),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(IconData outlinedIcon, IconData filledIcon, String label, int index) {
    bool isSelected = _currentIndex == index;
    return BottomNavigationBarItem(
      icon: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFBFDBFE) : Colors.transparent, // Light blue pill
          borderRadius: BorderRadius.circular(16),
        ),
        child: Icon(
          isSelected ? filledIcon : outlinedIcon,
          color: isSelected ? const Color(0xFF2563EB) : Colors.grey[600],
        ),
      ),
      label: label,
    );
  }
}
