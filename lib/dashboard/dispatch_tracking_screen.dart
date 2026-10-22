import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DispatchTrackingScreen extends StatelessWidget {
  const DispatchTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false, // Hides default back button
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Dispatch Tracking',
              style: GoogleFonts.inter(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Track deliveries and dispatch orders',
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
                      _buildStatCard('156', 'Total Dispatches', Icons.local_shipping, const Color(0xFFEFF6FF), const Color(0xFF3B82F6)),
                      _buildStatCard('132', 'Delivered', Icons.local_shipping, const Color(0xFFF0FDF4), const Color(0xFF22C55E), showCheckmark: true),
                      _buildStatCard('18', 'In Transit', Icons.moving_outlined, const Color(0xFFFFFBEB), const Color(0xFFF59E0B)),
                      _buildStatCard('6', 'Pending', Icons.local_shipping, const Color(0xFFFEF2F2), const Color(0xFFEF4444)),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Search and Filter Bar
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search Dispatch ID...',
                            hintStyle: GoogleFonts.inter(color: Colors.grey[400], fontSize: 14),
                            prefixIcon: Icon(Icons.search, color: Colors.grey[400]),
                            contentPadding: const EdgeInsets.symmetric(vertical: 0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Colors.grey[300]!),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Colors.grey[300]!),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[300]!),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(Icons.tune, color: Colors.black54, size: 20),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Filter Pills
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildFilterPill('All', true),
                        _buildFilterPill('Pending', false),
                        _buildFilterPill('In Transit', false),
                        _buildFilterPill('Delivered', false),
                        _buildFilterPill('Today', false),
                        _buildFilterPill('This Week', false),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  Text(
                    'DISPATCHED LIST',
                    style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  const SizedBox(height: 12),

                  // Dispatched List
                  _buildDispatchCard(
                    'DIS-1001', 'ABC Industry', 'Customer', 'GJ01AB1234', '15 July 2026', 'Status', 'Delivery',
                    'Delivered', const Color(0xFF22C55E), const Color(0xFFF0FDF4),
                  ),
                  const SizedBox(height: 12),
                  
                  _buildDispatchCard(
                    'DIS-1002', 'XYZ Manufacturing', 'Customer', 'MH12CD5678', '16 july 2026', 'Status', 'Status',
                    'In Transit', const Color(0xFF3B82F6), const Color(0xFFEFF6FF),
                  ),
                  const SizedBox(height: 12),
                  
                  _buildDispatchCard(
                    'DIS-1003', 'Prime Enigineering', 'Customer', 'RJ14EF9012', '16 july 2026', 'Status', 'Status',
                    'Pending', const Color(0xFFF59E0B), const Color(0xFFFFFBEB),
                  ),
                  const SizedBox(height: 16),

                  // Bottom Cards Row
                  IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: _buildTimelineCard(),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildCompletedOrdersCard(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
          
          // Back to Machines Button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back, color: Colors.white, size: 20),
                label: Text(
                  'Back to Machines',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2563EB),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
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

  Widget _buildStatCard(String value, String title, IconData icon, Color iconBg, Color iconColor, {bool showCheckmark = false}) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: iconBg,
              shape: BoxShape.circle,
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Icon(icon, color: iconColor, size: 20),
                if (showCheckmark)
                  Positioned(
                    right: -4,
                    bottom: -4,
                    child: Container(
                      decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                      child: const Icon(Icons.check_circle, color: Color(0xFF22C55E), size: 12),
                    ),
                  ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              const SizedBox(height: 2),
              Text(
                title,
                style: GoogleFonts.inter(fontSize: 11, color: Colors.grey[500], fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFilterPill(String label, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF2563EB) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: isSelected ? const Color(0xFF2563EB) : Colors.grey[300]!),
      ),
      child: Text(
        label,
        style: GoogleFonts.inter(
          color: isSelected ? Colors.white : Colors.black87,
          fontSize: 13,
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildDispatchCard(
    String id, String title, String dispatchIdVal, String vehicle, String date, String statusVal, String statusLabel,
    String status, Color statusColor, Color statusBgColor,
  ) {
    return Container(
      padding: const EdgeInsets.all(12),
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
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFDCFCE7),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.local_shipping, color: Color(0xFF16A34A), size: 28),
          ),
          const SizedBox(width: 12),
          // Main Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      id,
                      style: GoogleFonts.inter(fontSize: 11, color: Colors.grey[500], fontWeight: FontWeight.w500),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                      decoration: BoxDecoration(
                        color: statusBgColor,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: statusColor),
                      ),
                      child: Text(
                        status,
                        style: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w600, color: statusColor),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  title,
                  style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildDetailCol('Dispatch ID', dispatchIdVal),
                          const SizedBox(height: 8),
                          _buildDetailCol('Dispatch Date', date),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildDetailCol('Vehicle number', vehicle),
                          const SizedBox(height: 8),
                          _buildDetailCol(statusLabel, statusVal),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          const Padding(
            padding: EdgeInsets.only(top: 24.0),
            child: Icon(Icons.arrow_forward_ios, color: Colors.black, size: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailCol(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(fontSize: 10, color: Colors.black87),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: GoogleFonts.inter(fontSize: 11, color: const Color(0xFF64748B), fontWeight: FontWeight.w500),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget _buildTimelineCard() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'TRACKING TIMELINE CARD',
            style: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const SizedBox(height: 12),
          _buildTimelineItem('Order Confirmed', Icons.check_circle, true),
          _buildTimelineArrow(),
          _buildTimelineItem('Packed', Icons.check_circle, true),
          _buildTimelineArrow(),
          _buildTimelineItem('Dispatched', Icons.check_circle, true),
          _buildTimelineArrow(),
          _buildTimelineItem('In Transit', Icons.local_shipping, true, isCurrent: true),
          _buildTimelineArrow(),
          _buildTimelineItem('Delivered', Icons.home, false, isLast: true),
        ],
      ),
    );
  }

  Widget _buildTimelineItem(String label, IconData endIcon, bool isDone, {bool isCurrent = false, bool isLast = false}) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: isDone ? Colors.black : Colors.grey[300],
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 12),
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 11,
            color: isDone ? Colors.black : Colors.grey[500],
            fontWeight: isCurrent ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        const SizedBox(width: 6),
        Icon(endIcon, size: 12, color: isDone ? Colors.black : Colors.grey[400]),
      ],
    );
  }

  Widget _buildTimelineArrow() {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0, top: 4, bottom: 4),
      child: Icon(Icons.arrow_downward, size: 10, color: Colors.grey[600]),
    );
  }

  Widget _buildCompletedOrdersCard() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'COMPLETED ORDERS CARD',
            style: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.black),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 16),
          Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CircularProgressIndicator(
                    value: 0.75,
                    backgroundColor: Colors.grey[200],
                    valueColor: const AlwaysStoppedAnimation<Color>(Colors.black),
                    strokeWidth: 4,
                  ),
                  Center(
                    child: Text(
                      '75%',
                      style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          _buildOrdersStatRow('Completed Today', '18 Orders'),
          const SizedBox(height: 8),
          _buildOrdersStatRow('This Week', '92 Orders'),
          const SizedBox(height: 8),
          _buildOrdersStatRow('On-time Delivery', '98%'),
        ],
      ),
    );
  }

  Widget _buildOrdersStatRow(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(fontSize: 11, color: const Color(0xFF64748B)),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: GoogleFonts.inter(fontSize: 12, color: Colors.black87, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
