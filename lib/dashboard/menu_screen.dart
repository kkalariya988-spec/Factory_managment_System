import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../auth/login_screen.dart';
import 'machines_screen.dart';
import 'materials_screen.dart';
import 'production_monitoring_screen.dart';
import 'quality_inspection_screen.dart';
import 'finished_goods_screen.dart';
import 'dispatch_tracking_screen.dart';
import 'supplier_management_screen.dart';
import 'purchase_order_screen.dart';
import 'inventory_screen.dart';
import '../machines/cnc_planning_screen.dart';
import 'user_management_screen.dart';
import 'reports_analytics_screen.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  bool _machinesExpanded = false;
  bool _materialsExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Menu',
              style: GoogleFonts.inter(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'factory management system',
              style: GoogleFonts.inter(
                color: Colors.grey[400],
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Profile Card
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFFD3E3FD), // Light blue
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: 64,
                            height: 64,
                            decoration: const BoxDecoration(
                              color: Color(0xFF6DA5FF),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.person,
                              size: 40,
                              color: Color(0xFF1E3A8A),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'Hi , Admin',
                            style: GoogleFonts.inter(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Factory Manager',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Menu Title
                    Text(
                      'Menu',
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1E293B),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Menu Items
                    _buildMenuItem('Dashboard', Icons.home_outlined, const Color(0xFF2563EB), const Color(0xFFDBEAFE), context),
                    _buildExpandableMenuItem(
                      'Machines', 
                      Icons.precision_manufacturing_outlined, 
                      const Color(0xFFD946EF), 
                      const Color(0xFFFAE8FF), 
                      _machinesExpanded,
                      () {
                        setState(() {
                          _machinesExpanded = !_machinesExpanded;
                        });
                      },
                      [
                        _buildSubMenuItem('Production Monitoring', Icons.grid_view_rounded, context),
                        _buildSubMenuItem('Quality Inspection', Icons.inventory_2_outlined, context),
                        _buildSubMenuItem('Finished Goods', Icons.assignment_turned_in_outlined, context),
                        _buildSubMenuItem('Dispatch Tracking', Icons.local_shipping_outlined, context),
                      ],
                    ),
                    _buildExpandableMenuItem(
                      'Materials', 
                      Icons.inventory_2_outlined, 
                      const Color(0xFFF59E0B), 
                      const Color(0xFFFEF3C7), 
                      _materialsExpanded,
                      () {
                        setState(() {
                          _materialsExpanded = !_materialsExpanded;
                        });
                      },
                      [
                        _buildSubMenuItem('Supplier Management', Icons.inventory_2_outlined, context),
                        _buildSubMenuItem('Purchase order', Icons.request_quote_outlined, context),
                        _buildSubMenuItem('Inventory', Icons.assignment_turned_in_outlined, context),
                      ],
                    ),
                    _buildMenuItem('Report & Analytics', Icons.bar_chart, const Color(0xFF475569), const Color(0xFFF1F5F9), context),
                    _buildMenuItem('User Management', Icons.people_outline, const Color(0xFF0F172A), const Color(0xFFE2E8F0), context),
                    _buildMenuItem('CNC Planning', Icons.construction_outlined, const Color(0xFF78350F), const Color(0xFFF5D0FE), context),
                  ],
                ),
              ),
            ),
            
            // Logout Button
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const LoginScreen()),
                    (route) => false,
                  );
                },
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[300]!),
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFEE2E2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(Icons.logout, color: Color(0xFFEF4444), size: 20),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          'Log Out',
                          style: GoogleFonts.inter(
                            fontSize: 15,
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.black),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(String title, IconData icon, Color iconColor, Color iconBgColor, BuildContext context, {bool isDropdown = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: InkWell(
        onTap: () {
          if (title == 'Dashboard') {
            Navigator.pop(context);
          } else if (title == 'Machines') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MachinesScreen()),
            );
          } else if (title == 'Materials') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MaterialsScreen()),
            );
          } else if (title == 'CNC Planning') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CncPlanningScreen()),
            );
          } else if (title == 'User Management') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const UserManagementScreen()),
            );
          } else if (title == 'Report & Analytics') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ReportsAnalyticsScreen()),
            );
          }
        },
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
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: iconBgColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: iconColor, size: 20),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: 15,
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Icon(
                isDropdown ? Icons.keyboard_arrow_down : Icons.arrow_forward_ios,
                size: isDropdown ? 24 : 14,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExpandableMenuItem(String title, IconData icon, Color iconColor, Color iconBgColor, bool isExpanded, VoidCallback onTap, List<Widget> children) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Column(
        children: [
          InkWell(
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
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: iconBgColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(icon, color: iconColor, size: 20),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      title,
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Icon(
                    isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                    size: 24,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
          if (isExpanded)
            Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 8.0, right: 16.0),
              child: Column(
                children: children,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildSubMenuItem(String title, IconData icon, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: InkWell(
        onTap: () {
          Widget? screen;
          if (title == 'Production Monitoring') screen = const ProductionMonitoringScreen();
          else if (title == 'Quality Inspection') screen = const QualityInspectionScreen();
          else if (title == 'Finished Goods') screen = const FinishedGoodsScreen();
          else if (title == 'Dispatch Tracking') screen = const DispatchTrackingScreen();
          else if (title == 'Supplier Management') screen = const SupplierManagementScreen();
          else if (title == 'Purchase order') screen = const PurchaseOrderScreen();
          else if (title == 'Inventory') screen = const InventoryScreen();
          
          if (screen != null) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => screen!));
          }
        },
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
                  color: const Color(0xFFDCFCE7),
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
