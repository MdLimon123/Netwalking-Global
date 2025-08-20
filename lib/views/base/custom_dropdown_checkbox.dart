import 'package:flutter/material.dart';

class CustomDropdownCheckbox extends StatefulWidget {
  final String title;
  final List<String> options;
  final bool showCheckbox;
  final Color? bgColor;
  final Widget? leadingIcon;
  final ValueChanged<List<String>> onChanged;

  const CustomDropdownCheckbox({
    super.key,
    required this.title,
    required this.options,
    required this.onChanged,
    this.showCheckbox = true,
    this.bgColor,

    this.leadingIcon,
  });

  @override
  State<CustomDropdownCheckbox> createState() => _CustomDropdownCheckboxState();
}

class _CustomDropdownCheckboxState extends State<CustomDropdownCheckbox> {
  bool _isExpanded = false;
  late Map<String, bool> _selectedValues;

  @override
  void initState() {
    super.initState();
    _selectedValues = {for (var opt in widget.options) opt: false};
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            setState(() => _isExpanded = !_isExpanded);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: widget.bgColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      if ( widget.leadingIcon != null) ...[
                        widget.leadingIcon!,
                        const SizedBox(width: 8),
                      ],
                      Flexible(
                        child: Text(
                          _getSelectedText(),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  _isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: Colors.black87,
                ),
              ],
            ),
          ),
        ),

        // Dropdown expanded list
        AnimatedSize(
          duration: const Duration(milliseconds: 300),
          child: _isExpanded
              ? Column(
            key: const ValueKey(true),
            children: widget.options.map((option) {
              return widget.showCheckbox
                  ? CheckboxListTile(
                dense: true,
                title: Row(
                  children: [
                    if ( widget.leadingIcon != null)
                      widget.leadingIcon!,
                    if ( widget.leadingIcon != null)
                      const SizedBox(width: 8),
                    Text(
                      option,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                value: _selectedValues[option],
                onChanged: (bool? value) {
                  setState(() {
                    _selectedValues[option] = value ?? false;
                    _isExpanded = false;
                  });
                  widget.onChanged(
                    _selectedValues.entries
                        .where((e) => e.value)
                        .map((e) => e.key)
                        .toList(),
                  );
                },
              )
                  : ListTile(
                dense: true,
                leading: widget.leadingIcon,
                title: Text(option),
                onTap: () {
                  setState(() {
                    _selectedValues = {
                      for (var opt in widget.options) opt: false
                    };
                    _selectedValues[option] = true;
                    _isExpanded = false;
                  });
                  widget.onChanged([option]);
                },
              );
            }).toList(),
          )
              : const SizedBox(
            width: double.infinity,
            height: 0,
          ),
        ),
      ],
    );
  }

  /// Selected text in header
  String _getSelectedText() {
    final selected = _selectedValues.entries
        .where((entry) => entry.value)
        .map((entry) => entry.key)
        .toList();

    if (selected.isEmpty) return widget.title;
    return selected.join(", ");
  }
}
