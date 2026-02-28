import 'package:flutter/material.dart';
import 'package:event_hub_app/core/utils/app_assets.dart';

class FilterView extends StatefulWidget {
  const FilterView({super.key});

  @override
  State<FilterView> createState() => _FilterViewState();
}

class _FilterViewState extends State<FilterView> {
  
  String selectedCategory = "Sports";
  String selectedTime = "Today";
  RangeValues _currentRangeValues = const RangeValues(20, 80);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black, size: 28),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Filter",
          style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 25),
            
            
            _buildSectionTitle("Category"),
            const SizedBox(height: 15),
            _buildCategories(),
            
            const SizedBox(height: 35),
            
           
            _buildSectionTitle("Time & Date"),
            const SizedBox(height: 15),
            _buildTimeFilters(),
            
            const SizedBox(height: 35),
            
            
            _buildSectionTitle("Location"),
            const SizedBox(height: 15),
            _buildLocationSelector(),
            
            const SizedBox(height: 35),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSectionTitle("Select Price Range"),
                Text(
                  "\$${_currentRangeValues.start.round()} - \$${_currentRangeValues.end.round()}",
                  style: const TextStyle(color: Color(0xFF5669FF), fontWeight: FontWeight.bold),
                ),
              ],
            ),
            _buildPriceSlider(),
            
            const SizedBox(height: 50),
            
            _buildActionButtons(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF120D26)),
    );
  }

  
  Widget _buildCategories() {
    List<Map<String, dynamic>> categories = [
      {"name": "Sports", "icon": AppAssets.sports, "color": const Color(0xFFF0635A)},
      {"name": "Music", "icon": AppAssets.music, "color": const Color(0xFFF59762)},
      {"name": "Food", "icon": AppAssets.food, "color": const Color(0xFF29D697)},
      {"name": "Art", "icon": AppAssets.sports, "color": const Color(0xFF46CDFB)}, // مثال إضافي
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((cat) {
          bool isSelected = selectedCategory == cat['name'];
          return GestureDetector(
            onTap: () => setState(() => selectedCategory = cat['name']),
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: isSelected ? cat['color'] : Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: isSelected ? cat['color'] : Colors.grey.shade200),
                      boxShadow: isSelected ? [BoxShadow(color: cat['color'].withOpacity(0.3), blurRadius: 10, offset: const Offset(0, 5))] : [],
                    ),
                    child: Image.asset(cat['icon'], width: 30, color: isSelected ? Colors.white : Colors.grey),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    cat['name'], 
                    style: TextStyle(
                      color: isSelected ? const Color(0xFF120D26) : Colors.grey,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  
  Widget _buildTimeFilters() {
    List<String> times = ["Today", "Tomorrow", "This Week"];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: times.map((time) {
        bool isSelected = selectedTime == time;
        return GestureDetector(
          onTap: () => setState(() => selectedTime = time),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFF5669FF) : Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: isSelected ? const Color(0xFF5669FF) : Colors.grey.shade300),
            ),
            child: Text(
              time,
              style: TextStyle(color: isSelected ? Colors.white : Colors.grey, fontWeight: FontWeight.w500),
            ),
          ),
        );
      }).toList(),
    );
  }

  
  Widget _buildLocationSelector() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: const Color(0xFFE6E9FF), borderRadius: BorderRadius.circular(12)),
            child: const Icon(Icons.location_on, color: Color(0xFF5669FF)),
          ),
          const SizedBox(width: 15),
          const Text("New York, USA", style: TextStyle(fontSize: 16, color: Color(0xFF120D26), fontWeight: FontWeight.w500)),
          const Spacer(),
          const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        ],
      ),
    );
  }

  
  Widget _buildPriceSlider() {
    return RangeSlider(
      values: _currentRangeValues,
      max: 500,
      divisions: 50,
      activeColor: const Color(0xFF5669FF),
      inactiveColor: const Color(0xFFE6E9FF),
      labels: RangeLabels(
        _currentRangeValues.start.round().toString(),
        _currentRangeValues.end.round().toString(),
      ),
      onChanged: (RangeValues values) {
        setState(() => _currentRangeValues = values);
      },
    );
  }

  
  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: () {
              setState(() {
                selectedCategory = "Sports";
                selectedTime = "Today";
                _currentRangeValues = const RangeValues(20, 80);
              });
            },
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              side: const BorderSide(color: Colors.grey, width: 0.5),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            ),
            child: const Text("RESET", style: TextStyle(color: Color(0xFF120D26), fontWeight: FontWeight.bold, fontSize: 16)),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF5669FF),
              padding: const EdgeInsets.symmetric(vertical: 16),
              elevation: 5,
              shadowColor: const Color(0xFF5669FF).withOpacity(0.5),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            ),
            child: const Text("APPLY", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
          ),
        ),
      ],
    );
  }
}