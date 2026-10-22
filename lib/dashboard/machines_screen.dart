import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'add_machine_screen.dart';
import 'machines_menu_drawer.dart';

class MachinesScreen extends StatelessWidget {
  const MachinesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const MachinesMenuDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu, color: Colors.black),
              onPressed: () => Scaffold.of(context).openDrawer(),
            );
          },
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Machines',
              style: GoogleFonts.inter(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Monitor all factory machines',
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
                  // Top Stats Grid
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 1.5,
                    children: [
                      _buildStatCard('Total Machines', '56', null, Icons.precision_manufacturing_outlined, const Color(0xFFEFF6FF), const Color(0xFF3B82F6), null),
                      _buildStatCard('Running', '42', '75.0%', Icons.play_arrow, const Color(0xFFF0FDF4), const Color(0xFF22C55E), const Color(0xFF22C55E)),
                      _buildStatCard('Idle', '8', '14.3%', Icons.pause, const Color(0xFFFAF5FF), const Color(0xFFA855F7), const Color(0xFFA855F7)),
                      _buildStatCard('Stop', '6', '10.7%', Icons.stop, const Color(0xFFFFFBEB), const Color(0xFFF59E0B), const Color(0xFFF59E0B)),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Filter Pills
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildFilterPill('All (56)', true, false),
                        _buildFilterPill('Running(42)', false, false),
                        _buildFilterPill('Idle (8)', false, false),
                        _buildFilterPill('Stop (6)', false, false),
                        _buildFilterPill('Filter', false, true),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Machine List
                  _buildMachineItem(
                    'Machine 01', 'CNC Milling machine', 'Production line 1', 
                    'Running', 'OEE 85%', Icons.precision_manufacturing_outlined, 
                    const Color(0xFFEFF6FF), const Color(0xFF3B82F6), const Color(0xFF22C55E), const Color(0xFFF0FDF4)
                  ),
                  const SizedBox(height: 12),
                  _buildMachineItem(
                    'Machine 02', 'CNC Lathe Machine', 'Production line 2', 
                    'Running', 'OEE 78%', Icons.factory_outlined, 
                    const Color(0xFFF0FDF4), const Color(0xFF22C55E), const Color(0xFF22C55E), const Color(0xFFF0FDF4)
                  ),
                  const SizedBox(height: 12),
                  _buildMachineItem(
                    'Machine 03', 'Drill Press Machine', 'Production line 3', 
                    'Idle', 'OEE 60%', Icons.construction_outlined, 
                    const Color(0xFFFFFBEB), const Color(0xFFF59E0B), const Color(0xFFF59E0B), const Color(0xFFFFFBEB)
                  ),
                  const SizedBox(height: 12),
                  _buildMachineItem(
                    'Machine 04', 'Laser cutting machine', 'Production line 4', 
                    'Stop', 'OEE 20%', Icons.format_color_fill, 
                    const Color(0xFFFEF2F2), const Color(0xFFEF4444), const Color(0xFFEF4444), const Color(0xFFFEF2F2)
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
          
          // Add New Machine Button pinned at bottom
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AddMachineScreen()),
                  );
                },
                icon: const Icon(Icons.add, color: Colors.white, size: 20),
                label: Text(
                  'Add New Machine',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2563EB),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String title, String value, String? pct, IconData icon, Color bgColor, Color iconColor, Color? pctColor) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: bgColor,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black, height: 1.1),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.inter(fontSize: 11, color: Colors.grey[500], fontWeight: FontWeight.w500),
                  ),
                  if (pct != null)
                    Text(
                      pct,
                      style: GoogleFonts.inter(fontSize: 11, color: pctColor, fontWeight: FontWeight.bold),
                    ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFilterPill(String label, bool isSelected, bool isFilterIcon) {
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
          if (isFilterIcon) ...[
            const Icon(Icons.filter_alt_outlined, size: 16, color: Colors.black),
            const SizedBox(width: 4),
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

  Widget _buildMachineItem(String title, String subtitle, String location, String status, String oee, IconData icon, Color iconBgColor, Color iconColor, Color statusColor, Color statusBgColor) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Row(
        children: [
          // Icon Container
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: iconBgColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: iconColor, size: 28),
          ),
          const SizedBox(width: 12),
          // Main Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: GoogleFonts.inter(fontSize: 13, color: Colors.grey[600]),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.location_on_outlined, size: 14, color: Colors.grey[600]),
                    const SizedBox(width: 4),
                    Text(
                      location,
                      style: GoogleFonts.inter(fontSize: 12, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Status Info
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: statusBgColor,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: statusColor),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: statusColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      status,
                      style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w600, color: statusColor),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Text(
                oee,
                style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.bold, color: statusColor),
              ),
            ],
          ),
          const SizedBox(width: 8),
          const Icon(Icons.arrow_forward_ios, color: Colors.black, size: 14),
        ],
      ),
    );
  }
}
