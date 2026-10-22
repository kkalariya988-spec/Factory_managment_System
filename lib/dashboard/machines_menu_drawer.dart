import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'production_monitoring_screen.dart';
import 'quality_inspection_screen.dart';
import 'finished_goods_screen.dart';
import 'dispatch_tracking_screen.dart';

class MachinesMenuDrawer extends StatelessWidget {
  const MachinesMenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // Determine a width that looks like a side panel rather than full drawer
    return Drawer(
      backgroundColor: Colors.white,
      width: MediaQuery.of(context).size.width * 0.75, // Adjust width as needed
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Replicate the AppBar leading part in the drawer to look like the image
            Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 12.0, bottom: 12.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[300]!),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: IconButton(
                  icon: const Icon(Icons.menu, color: Colors.black),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),
            
            // Menu Items
            _buildMenuItem('Production Monitoring', Icons.grid_view_rounded, context, () {
              Navigator.pop(context); // Close drawer
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProductionMonitoringScreen()),
              );
            }),
            _buildMenuItem('Quality Inspection', Icons.inventory_2_outlined, context, () {
              Navigator.pop(context); // Close drawer
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const QualityInspectionScreen()),
              );
            }),
            _buildMenuItem('Finished Goods', Icons.assignment_turned_in_outlined, context, () {
              Navigator.pop(context); // Close drawer
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FinishedGoodsScreen()),
              );
            }),
            _buildMenuItem('Dispatch Tracking', Icons.local_shipping_outlined, context, () {
              Navigator.pop(context); // Close drawer
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DispatchTrackingScreen()),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(String title, IconData icon, BuildContext context, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: const Color(0xFFDCFCE7), // Light green background
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: const Color(0xFF16A34A), size: 20),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.black),
            ],
          ),
        ),
      ),
    );
  }
}
