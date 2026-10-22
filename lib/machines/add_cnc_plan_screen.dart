import 'package:flutter/material.dart';

class AddCncPlanScreen extends StatefulWidget {
  const AddCncPlanScreen({Key? key}) : super(key: key);

  @override
  State<AddCncPlanScreen> createState() => _AddCncPlanScreenState();
}

class _AddCncPlanScreenState extends State<AddCncPlanScreen> {
  String _selectedPriority = 'Medium';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Add New CNC Plan',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text(
              'Plan and schedule CNC operations',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.save_outlined, color: Colors.black),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLabel('Machine Name :'),
            _buildTextField(hint: 'Enter machine name', icon: Icons.precision_manufacturing, iconColor: Colors.blue),
            const SizedBox(height: 16),
            
            _buildLabel('Job / Part :'),
            _buildTextField(hint: 'Job or Part', icon: Icons.inventory_2, iconColor: Colors.green),
            const SizedBox(height: 16),
            
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLabel('Plan Date :'),
                      _buildTextField(hint: 'DD / MM / YYYY', icon: Icons.calendar_today, iconColor: Colors.purple),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLabel('Planned Start Time :'),
                      _buildTextField(hint: '00 : 00', icon: Icons.access_time, iconColor: Colors.orange),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            
            _buildLabel('Operation / Task :'),
            _buildTextField(
              hint: 'Enter operation or task details',
              icon: Icons.notes,
              iconColor: Colors.amber,
              maxLines: 4,
            ),
            const SizedBox(height: 16),
            
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLabel('Planned Duration :'),
                      _buildTextField(hint: 'e.g.2h 30m', icon: Icons.timer, iconColor: Colors.blue, suffix: 'hr'),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLabel('Target Quantity :'),
                      _buildTextField(hint: 'Enter quantity', icon: Icons.track_changes, iconColor: Colors.green, suffix: 'pcs'),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            
            _buildLabel('Assigned To (Operator) :'),
            _buildTextField(hint: 'Operator Name', icon: Icons.assignment_ind, iconColor: Colors.redAccent),
            const SizedBox(height: 16),
            
            _buildLabel('Notes (Optional) :'),
            _buildTextField(
              hint: 'Enter notes',
              icon: Icons.person_outline,
              iconColor: Colors.greenAccent,
              maxLines: 3,
            ),
            const SizedBox(height: 16),
            
            _buildLabel('Priority', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 8),
            Row(
              children: [
                _buildPriorityButton('Low'),
                const SizedBox(width: 12),
                _buildPriorityButton('Medium'),
                const SizedBox(width: 12),
                _buildPriorityButton('High'),
              ],
            ),
            
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.add, color: Colors.white),
                label: const Text('Save Plan', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String text, {TextStyle? style}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        text,
        style: style ?? const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
      ),
    );
  }

  Widget _buildTextField({
    required String hint,
    required IconData icon,
    required Color iconColor,
    int maxLines = 1,
    String? suffix,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment: maxLines > 1 ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: iconColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: iconColor, size: 20),
            ),
          ),
          Expanded(
            child: TextField(
              maxLines: maxLines,
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: const TextStyle(color: Colors.grey),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: maxLines > 1 ? 16 : 0),
              ),
            ),
          ),
          if (suffix != null)
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Text(suffix, style: const TextStyle(color: Colors.grey)),
            )
        ],
      ),
    );
  }

  Widget _buildPriorityButton(String priority) {
    final isSelected = _selectedPriority == priority;
    Color textColor;
    if (isSelected) {
      textColor = Colors.white;
    } else {
      switch (priority) {
        case 'Low':
          textColor = Colors.blue;
          break;
        case 'Medium':
          textColor = Colors.blue;
          break;
        case 'High':
          textColor = Colors.red;
          break;
        default:
          textColor = Colors.black;
      }
    }
    
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedPriority = priority;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? Colors.blue : Colors.white,
            border: Border.all(color: isSelected ? Colors.blue : Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              priority,
              style: TextStyle(
                color: textColor,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
