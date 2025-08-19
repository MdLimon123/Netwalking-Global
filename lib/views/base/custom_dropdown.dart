import 'package:flutter/material.dart';
import 'package:netwalking_global/utils/app_colors.dart';
import 'package:netwalking_global/views/base/custom_text_field.dart';

class CustomDropdown extends StatefulWidget {

  final List<String> options;
  final ValueChanged<String?> onChanged;
  final String title;

  const CustomDropdown({
    super.key,
    required this.title,
    required this.options,
    required this.onChanged,
  });

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? _selectedValue;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Color(0xFFE6EEF7),

      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [


          /// Dropdown Options
          DropdownButtonFormField<String>(
            value: _selectedValue,
            decoration: const InputDecoration.collapsed(hintText: ''),
            hint:  Text(widget.title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.textColor
            ),),
            items: widget.options.map((e) {
              return DropdownMenuItem(
                value: e,
                child: Text(e,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textColor
                  ),),
              );
            }).toList(),
            onChanged: (val) {
              setState(() {
                _selectedValue = val;
              });
              widget.onChanged(val);
            },
          ),

          /// Self-describe TextField
          if (_selectedValue == "Self-describe") ...[
            const SizedBox(height: 12),

            CustomTextField(
              controller: _controller,
              maxLines: 4,
              onChanged: (val){
                widget.onChanged(val);
              },
              hintText: 'Write here',
            )


          ],
        ],
      ),
    );
  }
}
