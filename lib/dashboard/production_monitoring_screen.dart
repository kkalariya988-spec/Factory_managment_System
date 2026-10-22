import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductionMonitoringScreen extends StatelessWidget {
  const ProductionMonitoringScreen({super.key});

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
              'Production Monitoring',
              style: GoogleFonts.inter(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Monitor live production performnce',
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
                    childAspectRatio: 1.3,
                    children: [
                      _buildStatCard('08', 'Production Lines', Icons.factory_outlined, const Color(0xFFEFF6FF), const Color(0xFF3B82F6), false),
                      _buildStatCard('BATCH-2026', 'Current Batch', Icons.inventory_2_outlined, const Color(0xFFF0FDF4), const Color(0xFF22C55E), false),
                      _buildStatCard('5,000', 'Today\'s Target', Icons.track_changes, const Color(0xFFFFFBEB), const Color(0xFFF59E0B), true),
                      _buildStatCard('3,650', 'Completed', Icons.check_circle_outline, const Color(0xFFFEF2F2), const Color(0xFFEF4444), true),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Production Progress
                  Text(
                    'Production Progress',
                    style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey[200]!),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Today\'s Production',
                              style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black),
                            ),
                            Text(
                              '73%',
                              style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.bold, color: const Color(0xFF2563EB)),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: LinearProgressIndicator(
                            value: 0.73,
                            backgroundColor: const Color(0xFFDBEAFE),
                            valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF2563EB)),
                            minHeight: 8,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildProgressInfo('Completed:', '3,650 Units'),
                            _buildProgressInfo('Remaining:', '1,350 Units'),
                            _buildProgressInfo('Estimated Completion:', '03:45 PM'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Shift Details
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey[200]!),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Shift Details : Shift A',
                              style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black),
                            ),
                            _buildStatusPill('Running', const Color(0xFF22C55E), const Color(0xFFF0FDF4)),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildDetailRow('Operator: ', 'ABC'),
                                const SizedBox(height: 8),
                                _buildDetailRow('Endt Time: ', '08:00 AM'),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildDetailRow('Start Time: ', '08:00 AM'),
                                const SizedBox(height: 8),
                                _buildDetailRow('End Time : ', '04:00 PM'),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Production Line Status
                  Text(
                    'Production Line Status',
                    style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  const SizedBox(height: 12),
                  
                  _buildLineStatusCard(
                    'Production Line 01', 'Running', 'BATCH-2026',
                    '1000', '180', '820', 0.82, const Color(0xFF22C55E), const Color(0xFFF0FDF4),
                  ),
                  const SizedBox(height: 12),
                  _buildLineStatusCard(
                    'Production Line 02', 'Running', 'BATCH-2026',
                    '1200', '240', '960', 0.80, const Color(0xFF22C55E), const Color(0xFFF0FDF4),
                  ),
                  const SizedBox(height: 12),
                  _buildLineStatusCard(
                    'Production Line 03', 'Maintenance', '---',
                    null, null, null, 0.0, const Color(0xFFEF4444), const Color(0xFFFEF2F2),
                    customStatusText: 'Statued'
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

  Widget _buildStatCard(String value, String title, IconData icon, Color iconBg, Color iconColor, bool hasUnits) {
    return Container(
      padding: const EdgeInsets.all(16),
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
            child: Icon(icon, color: iconColor, size: 20),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    value,
                    style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  if (hasUnits)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 2, left: 2),
                      child: Text(
                        'Units',
                        style: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.w600, color: Colors.black),
                      ),
                    ),
                ],
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

  Widget _buildProgressInfo(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(fontSize: 11, color: Colors.black87),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.grey[500]),
        ),
      ],
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Text.rich(
      TextSpan(
        text: label,
        style: GoogleFonts.inter(fontSize: 12, color: Colors.black87),
        children: [
          TextSpan(
            text: value,
            style: GoogleFonts.inter(fontSize: 12, color: Colors.grey[600]),
          ),
        ],
      ),
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildStatusPill(String text, Color color, Color bgColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color),
      ),
      child: Text(
        text,
        style: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w600, color: color),
      ),
    );
  }

  Widget _buildLineStatusCard(
    String title, String status, String batch,
    String? target, String? remaining, String? comp, double progress,
    Color statusColor, Color statusBgColor,
    {String? customStatusText}
  ) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Icon Container
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFDCFCE7),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.factory_outlined, color: Color(0xFF16A34A), size: 28),
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
                    Expanded(
                      child: Text(
                        title,
                        style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 8),
                    _buildStatusPill(customStatusText ?? status, statusColor, statusBgColor),
                  ],
                ),
                const SizedBox(height: 4),
                _buildDetailRow('Status : ', status),
                const SizedBox(height: 2),
                _buildDetailRow('Current Batch : ', batch),
                const SizedBox(height: 2),
                if (target != null) ...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: _buildDetailRow('Target : ', '$target Units')),
                      const SizedBox(width: 4),
                      Expanded(child: _buildDetailRow('Remaining : ', '$remaining Units')),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: _buildDetailRow('Comp: ', '$comp Units')),
                      Text(
                        '${(progress * 100).toInt()}%',
                        style: GoogleFonts.inter(fontSize: 12, color: Colors.black, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ] else ...[
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      '${(progress * 100).toInt()}%',
                      style: GoogleFonts.inter(fontSize: 13, color: Colors.black, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: progress,
                    backgroundColor: const Color(0xFFDBEAFE),
                    valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF2563EB)),
                    minHeight: 6,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          const Icon(Icons.arrow_forward_ios, color: Colors.black, size: 16),
        ],
      ),
    );
  }
}
