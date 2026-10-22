import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 20),
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
        ),
        title: Row(
          children: [
            Text(
              'Notifications',
              style: GoogleFonts.inter(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(width: 6),
            const Icon(Icons.notifications_none, color: Colors.black, size: 20),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_alt_outlined, color: Colors.black, size: 24),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Column(
          children: [
            _buildNotificationCard(
              context,
              time: '3h ago',
              title: 'Purchase Approval',
              icon: Icons.assignment_turned_in_outlined,
              backgroundColor: const Color(0xFFB4CCFA),
              borderColor: const Color(0xFF4A72E9),
              iconCircleColor: const Color(0xFFD6E3FF),
              iconColor: const Color(0xFF4A72E9),
              textColor: const Color(0xFF28489A),
              timeColor: const Color(0xFF6785C8),
            ),
            const SizedBox(height: 16),
            _buildNotificationCard(
              context,
              time: '2h ago',
              title: 'Dispatch Update',
              icon: Icons.local_shipping,
              backgroundColor: const Color(0xFFA5E1B5),
              borderColor: const Color(0xFF1E8231),
              iconCircleColor: const Color(0xFF8FD8A3),
              iconColor: const Color(0xFF156525),
              textColor: const Color(0xFF156525),
              timeColor: const Color(0xFF389749),
            ),
            const SizedBox(height: 16),
            _buildNotificationCardWithButton(
              context,
              title: 'Production Completed',
              icon: Icons.precision_manufacturing_outlined,
              buttonText: 'Track Order',
              backgroundColor: const Color(0xFFFFF0D1),
              borderColor: const Color(0xFFF09B36),
              iconCircleColor: const Color(0xFFFBE0A7),
              iconColor: const Color(0xFFF09B36),
              textColor: const Color(0xFFE88A1A),
              topRightIcon: Icons.check_circle,
            ),
            const SizedBox(height: 16),
            _buildNotificationCard(
              context,
              time: '',
              title: 'Maintenance Reminder',
              icon: Icons.calendar_today,
              backgroundColor: const Color(0xFFFFC5C5),
              borderColor: const Color(0xFFE53935),
              iconCircleColor: const Color(0xFFFFAFAF),
              iconColor: const Color(0xFFD32F2F),
              textColor: const Color(0xFFD32F2F),
              timeColor: Colors.transparent,
              trailingIcon: Icons.construction,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.grey[200]!, width: 1)),
        ),
        child: BottomNavigationBar(
          currentIndex: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.grey[600],
          unselectedItemColor: Colors.black87,
          selectedLabelStyle: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.w500),
          unselectedLabelStyle: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.w500),
          elevation: 0,
          items: [
            _buildNavItem(Icons.home_outlined, 'Dashboard'),
            _buildNavItem(Icons.factory_outlined, 'Machines'),
            _buildNavItem(Icons.inventory_2_outlined, 'Materials'),
            _buildNavItem(Icons.notifications_outlined, 'Alerts'),
            _buildNavItem(Icons.person_outline, 'Profile'),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(IconData icon, String label) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(bottom: 4.0),
        child: Icon(icon, size: 24, color: Colors.black87),
      ),
      label: label,
    );
  }

  Widget _buildNotificationCard(BuildContext context, {
    required String time,
    required String title,
    required IconData icon,
    required Color backgroundColor,
    required Color borderColor,
    required Color iconCircleColor,
    required Color iconColor,
    required Color textColor,
    required Color timeColor,
    IconData? trailingIcon,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor, width: 0.5),
      ),
      child: Stack(
        children: [
          if (time.isNotEmpty)
            Positioned(
              right: 0,
              top: 0,
              child: Text(
                time,
                style: GoogleFonts.inter(
                  color: timeColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          if (trailingIcon != null)
            Positioned(
              right: 0,
              top: 0,
              child: Icon(trailingIcon, color: textColor, size: 20),
            ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: iconCircleColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, color: iconColor, size: 28),
                ),
                const SizedBox(height: 16),
                Text(
                  title,
                  style: GoogleFonts.inter(
                    color: textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationCardWithButton(BuildContext context, {
    required String title,
    required IconData icon,
    required String buttonText,
    required Color backgroundColor,
    required Color borderColor,
    required Color iconCircleColor,
    required Color iconColor,
    required Color textColor,
    required IconData topRightIcon,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor, width: 0.5),
      ),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            top: 0,
            child: Icon(topRightIcon, color: iconColor, size: 24),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: iconCircleColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, color: iconColor, size: 28),
                ),
                const SizedBox(height: 16),
                Text(
                  title,
                  style: GoogleFonts.inter(
                    color: textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  height: 44,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: iconColor,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      buttonText,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
