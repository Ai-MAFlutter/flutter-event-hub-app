import 'package:flutter/material.dart';
import 'package:event_hub_app/core/utils/app_assets.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  String selectedCategory = "Sports";
  String selectedTime = "Tomorrow";
  RangeValues _currentRangeValues = const RangeValues(20, 120);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(38)),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              Center(
                child: Container(
                  width: 40,
                  height: 5,
                  decoration: BoxDecoration(
                    color: const Color(0xFFB2B2B2).withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              const Text(
                "Filter",
                style: TextStyle(
                  fontSize: 25, 
                  fontWeight: FontWeight.w500, 
                  color: Color(0xFF120D26)
                ),
              ),
              const SizedBox(height: 25),

              _buildCategoriesList(),

              const SizedBox(height: 30),
              _buildSectionTitle("Time & Date"),
              const SizedBox(height: 15),
              _buildTimeSelector(),
              const SizedBox(height: 15),
              _buildCalendarPicker(),

              const SizedBox(height: 30),
              _buildSectionTitle("Location"),
              const SizedBox(height: 15),
              _buildLocationField(),

              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildSectionTitle("Select price range"),
                  Text(
                    "\$${_currentRangeValues.start.round()}-\$${_currentRangeValues.end.round()}",
                    style: const TextStyle(
                      color: Color(0xFF5669FF), 
                      fontWeight: FontWeight.bold, 
                      fontSize: 16
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              _buildPriceSlider(),

              const SizedBox(height: 40),
              _buildFooterButtons(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18, 
        fontWeight: FontWeight.bold, 
        color: Color(0xFF120D26)
      ),
    );
  }

  Widget _buildCategoriesList() {
    List<Map<String, dynamic>> categories = [
      {"name": "Sports", "icon": AppAssets.sports, "color": const Color(0xFF5669FF)},
      {"name": "Music", "icon": AppAssets.music, "color": const Color(0xFFF59762)},
      {"name": "Art", "icon": AppAssets.sports, "color": const Color(0xFF46CDFB)}, 
      {"name": "Food", "icon": AppAssets.food, "color": const Color(0xFF29D697)},
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      clipBehavior: Clip.none,
      child: Row(
        children: categories.map((cat) {
          bool isSelected = selectedCategory == cat['name'];
          return Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () => setState(() => selectedCategory = cat['name']),
                  child: Container(
                    width: 63,
                    height: 63,
                    decoration: BoxDecoration(
                      color: isSelected ? cat['color'] : Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isSelected ? cat['color'] : Colors.grey.shade200
                      ),
                      boxShadow: isSelected 
                        ? [BoxShadow(color: cat['color'].withOpacity(0.3), blurRadius: 10, offset: const Offset(0, 5))] 
                        : [],
                    ),
                    child: Center(
                      child: Image.asset(
                        cat['icon'], 
                        width: 28, 
                        color: isSelected ? Colors.white : Colors.grey
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  cat['name'], 
                  style: const TextStyle(color: Colors.grey, fontSize: 14)
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildTimeSelector() {
    List<String> options = ["Today", "Tomorrow", "This week"];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: options.map((opt) {
        bool isSelected = selectedTime == opt;
        return GestureDetector(
          onTap: () => setState(() => selectedTime = opt),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFF5669FF) : Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: isSelected ? const Color(0xFF5669FF) : Colors.grey.shade300
              ),
            ),
            child: Text(
              opt,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.grey, 
                fontWeight: FontWeight.w500
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildCalendarPicker() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 13),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Image.asset(AppAssets.calendarIcon, width: 22), 
          const SizedBox(width: 12),
          const Text(
            "Choose from calender", 
            style: TextStyle(color: Color(0xFF120D26), fontSize: 16)
          ),
          const Spacer(),
          const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _buildLocationField() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFFE6E9FF), 
              borderRadius: BorderRadius.circular(10)
            ),
            child: Image.asset(AppAssets.locationmarker, width: 20, color: const Color(0xFF5669FF)),
          ),
          const SizedBox(width: 15),
          const Text(
            "New York, USA", 
            style: TextStyle(fontSize: 16, color: Color(0xFF120D26))
          ),
          const Spacer(),
          const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _buildPriceSlider() {
    return Column(
      children: [
        
        Image.asset(
          AppAssets.pricegraph, 
          width: double.infinity, 
          height: 50, 
          fit: BoxFit.contain
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            trackHeight: 2,
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8),
            overlayShape: const RoundSliderOverlayShape(overlayRadius: 16),
          ),
          child: RangeSlider(
            values: _currentRangeValues,
            max: 500,
            activeColor: const Color(0xFF5669FF),
            inactiveColor: const Color(0xFFE6E9FF),
            onChanged: (values) => setState(() => _currentRangeValues = values),
          ),
        ),
      ],
    );
  }

  Widget _buildFooterButtons() {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: () {
              setState(() {
                selectedCategory = "Sports";
                selectedTime = "Today";
                _currentRangeValues = const RangeValues(20, 120);
              });
            },
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 18),
              side: const BorderSide(color: Color(0xFFE6E9FF)),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            ),
            child: const Text(
              "RESET", 
              style: TextStyle(color: Color(0xFF120D26), fontSize: 16, fontWeight: FontWeight.bold)
            ),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF5669FF),
              padding: const EdgeInsets.symmetric(vertical: 18),
              elevation: 5,
              shadowColor: const Color(0xFF5669FF).withOpacity(0.3),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            ),
            child: const Text(
              "APPLY", 
              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)
            ),
          ),
        ),
      ],
    );
  }
}