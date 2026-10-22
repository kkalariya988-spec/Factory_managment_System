import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'supplier_management_screen.dart';
import 'purchase_order_screen.dart';
import 'inventory_screen.dart';

class MaterialsMenuDrawer extends StatelessWidget {
  const MaterialsMenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
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
            _buildMenuItem('Supplier Management', Icons.inventory_2_outlined, context, () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SupplierManagementScreen()),
              );
            }),
            _buildMenuItem('Purchase order', Icons.request_quote_outlined, context, () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PurchaseOrderScreen()),
              );
            }),
            _buildMenuItem('Inventory', Icons.assignment_turned_in_outlined, context, () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const InventoryScreen()),
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
