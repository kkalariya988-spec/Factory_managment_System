import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QualityInspectionScreen extends StatelessWidget {
  const QualityInspectionScreen({super.key});

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
              'Quality Inspection',
              style: GoogleFonts.inter(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Monitor product quality and inspections',
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
                      _buildStatCard('128', 'Total Inspections', Icons.assignment_outlined, const Color(0xFFEFF6FF), const Color(0xFF3B82F6)),
                      _buildStatCard('112', 'Passed', Icons.inventory_2_outlined, const Color(0xFFF0FDF4), const Color(0xFF22C55E)),
                      _buildStatCard('10', 'Failed', Icons.warning_amber_rounded, const Color(0xFFFFFBEB), const Color(0xFFF59E0B)),
                      _buildStatCard('6', 'Pending', Icons.cancel_outlined, const Color(0xFFFEF2F2), const Color(0xFFEF4444)),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Search and Filter Bar
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search batch or project...',
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
                        _buildFilterPill('Passed', false),
                        _buildFilterPill('Failed', false),
                        _buildFilterPill('Pending', false),
                        _buildFilterPill('Today\'s', false),
                        _buildFilterPill('This Week', false),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Inspections List
                  _buildInspectionCard(
                    'INS-001', 'Steel Gear', 'BAT-2058', 'Rahul Sharma', 'Completed',
                    'Pass', const Color(0xFF22C55E), const Color(0xFFF0FDF4),
                    Icons.settings,
                  ),
                  const SizedBox(height: 12),
                  
                  _buildInspectionCard(
                    'INS-002', 'Bearing Housing', 'BAT-2059', 'Amit Patel', 'Completed',
                    'Fail', const Color(0xFFEF4444), const Color(0xFFFEF2F2),
                    Icons.adjust,
                    defectNotes: 'Surface Crack Found',
                  ),
                  const SizedBox(height: 12),
                  
                  // Outlined Button
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xFF2563EB)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      child: Text(
                        'Inspection Report',
                        style: GoogleFonts.inter(
                          color: const Color(0xFF2563EB),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  
                  _buildInspectionCard(
                    'INS-003', 'Aluminium Bracket', 'BAT-2063', 'Neha Shah', 'Pending',
                    'Pending', const Color(0xFFF59E0B), const Color(0xFFFFFBEB),
                    Icons.data_object,
                  ),
                  const SizedBox(height: 16),

                  // Inspection Report Card
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey[200]!),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'INSPECTION REPORT CARD',
                          style: GoogleFonts.inter(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        const SizedBox(height: 12),
                        Container(
                          height: 1,
                          color: Colors.grey[200],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(child: _buildReportRow('Batch No : ', 'BAT - 2058')),
                            Expanded(child: _buildReportRow('Inspection Score : ', '96%')),
                          ],
                        ),
                        const SizedBox(height: 8),
                        _buildReportRow('Defects : ', '2 Minor'),
                        const SizedBox(height: 8),
                        _buildReportRow('Quality Ratings : ', 'Excellent'),
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

  Widget _buildStatCard(String value, String title, IconData icon, Color iconBg, Color iconColor) {
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
            child: Icon(icon, color: iconColor, size: 20),
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

  Widget _buildInspectionCard(
    String id, String title, String batch, String inspector, String checklist,
    String status, Color statusColor, Color statusBgColor,
    IconData icon, {String? defectNotes}
  ) {
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon Container
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFFDCFCE7),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: const Color(0xFF16A34A), size: 28),
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
                        Expanded(child: _buildDetailCol('Batch Number', batch)),
                        Expanded(child: _buildDetailCol('Inspector', inspector)),
                        Expanded(child: _buildDetailCol('Checklist', checklist)),
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
          if (defectNotes != null) ...[
            const SizedBox(height: 12),
            Container(height: 1, color: Colors.grey[200]),
            const SizedBox(height: 12),
            Text.rich(
              TextSpan(
                text: 'Defect Notes:\n',
                style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black87),
                children: [
                  TextSpan(
                    text: defectNotes,
                    style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.black87),
                  ),
                ],
              ),
            ),
          ],
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
          style: GoogleFonts.inter(fontSize: 11, color: Colors.grey[600], fontWeight: FontWeight.w500),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget _buildReportRow(String label, String value) {
    return Text.rich(
      TextSpan(
        text: label,
        style: GoogleFonts.inter(fontSize: 12, color: Colors.black87),
        children: [
          TextSpan(
            text: value,
            style: GoogleFonts.inter(fontSize: 12, color: const Color(0xFF64748B)),
          ),
        ],
      ),
      overflow: TextOverflow.ellipsis,
    );
  }
}
