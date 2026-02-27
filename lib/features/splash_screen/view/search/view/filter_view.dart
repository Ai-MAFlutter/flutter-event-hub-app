import 'package:event_hub_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class FilterView extends StatelessWidget {
  const FilterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          const Center(
            child: SizedBox(
              width: 40,
              child: Divider(thickness: 3),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "Filter",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          const Text("Time & Date"),
          const SizedBox(height: 10),
          Wrap(
            spacing: 10,
            children: [
              _chip("Today"),
              _chip("Tomorrow", selected: true),
              _chip("This week"),
            ],
          ),
          const SizedBox(height: 20),
          const Text("Location"),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border:
                  Border.all(color: Colors.grey.shade300),
            ),
            child: const Row(
              children: [
                Icon(Icons.location_on,
                    color: Colors.blue),
                SizedBox(width: 10),
                Text("New York, USA"),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  child: const Text("Reset"),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        AppColors.primary,
                  ),
                  onPressed: () {},
                  child: const Text("Apply"),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _chip(String text,
      {bool selected = false}) {
    return ChoiceChip(
      label: Text(text),
      selected: selected,
      selectedColor: AppColors.primary,
    );
  }
}