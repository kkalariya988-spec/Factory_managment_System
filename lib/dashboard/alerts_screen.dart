import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AlertsScreen extends StatelessWidget {
  const AlertsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Alerts',
              style: GoogleFonts.inter(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Stay updated with factory alerts',
              style: GoogleFonts.inter(
                color: Colors.grey[400],
                fontSize: 12,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Color(0xFF2563EB)),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Filter Pills
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildFilterPill('All', true, null),
                        _buildFilterPill('Critical', false, const Color(0xFFEF4444)),
                        _buildFilterPill('Warning', false, const Color(0xFFF59E0B)),
                        _buildFilterPill('Information', false, const Color(0xFF3B82F6)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Alert List
                  _buildAlertItem(
                    'Machine',
                    'CNC Milling - Unit 4',
                    'Temperature Critical',
                    'Spindle temperature exceeded 110 C\n(114.8 C). Action Required.',
                    '11:45 AM , Jun 28',
                    Icons.precision_manufacturing_outlined,
                    Icons.thermostat_outlined,
                    const Color(0xFFEF4444),
                    const Color(0xFFFEF2F2),
                    true,
                  ),
                  const SizedBox(height: 16),
                  _buildAlertItem(
                    'Assembly Line 3 - Robot',
                    'Low Coolant Level',
                    null,
                    'Coolant low below 15% threshold.',
                    '11:32AM',
                    Icons.construction_outlined,
                    null,
                    const Color(0xFFF59E0B),
                    const Color(0xFFFFFBEB),
                    false,
                  ),
                  const SizedBox(height: 16),
                  _buildAlertItem(
                    'HVAC System - B3',
                    'Maintenance Reminder',
                    null,
                    'Scheduled filter replacement due today.',
                    '10:55AM',
                    Icons.info_outline,
                    null,
                    const Color(0xFF3B82F6),
                    const Color(0xFFEFF6FF),
                    false,
                  ),
                  const SizedBox(height: 16),
                  _buildAlertItem(
                    'Injection Molder M1',
                    'Pressure Restored',
                    null,
                    'Molding pressure stabilized after\noutage.',
                    '10:48AM',
                    Icons.check_circle_outline,
                    null,
                    const Color(0xFF22C55E),
                    const Color(0xFFF0FDF4),
                    false,
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
          
          // Bottom Buttons
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 52,
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.check_box_outlined, color: Color(0xFF2563EB)),
                      label: Text(
                        'Mark All Read',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF2563EB),
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        side: const BorderSide(color: Color(0xFF2563EB)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: SizedBox(
                    height: 52,
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.delete_outline, color: Colors.black87),
                      label: Text(
                        'Clear Alerts',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        side: BorderSide(color: Colors.grey[400]!),
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

  Widget _buildFilterPill(String label, bool isSelected, Color? dotColor) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF2563EB) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: isSelected ? const Color(0xFF2563EB) : Colors.grey[300]!),
      ),
      child: Row(
        children: [
          if (dotColor != null) ...[
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: dotColor,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 6),
          ],
          Text(
            label,
            style: GoogleFonts.inter(
              color: isSelected ? Colors.white : Colors.black87,
              fontSize: 13,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAlertItem(String overtitle, String title, String? subtitle, String body, String time, IconData icon, IconData? secondaryIcon, Color themeColor, Color bgColor, bool isCritical) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon Container
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: bgColor,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: themeColor, size: 24),
          ),
          const SizedBox(width: 16),
          // Main Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  overtitle,
                  style: GoogleFonts.inter(fontSize: 13, color: Colors.grey[500], fontWeight: FontWeight.w500),
                ),
                Text(
                  title,
                  style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                const SizedBox(height: 8),
                if (subtitle != null) ...[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (secondaryIcon != null) ...[
                        Icon(secondaryIcon, color: themeColor, size: 16),
                        const SizedBox(width: 4),
                      ],
                      Expanded(
                        child: Text(
                          subtitle,
                          style: GoogleFonts.inter(fontSize: 13, fontWeight: FontWeight.w600, color: const Color(0xFF475569)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                ],
                Text(
                  body,
                  style: GoogleFonts.inter(fontSize: 13, color: Colors.black87, height: 1.3),
                ),
                const SizedBox(height: 8),
                Text(
                  time,
                  style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black87),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
