import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:todo_app_riverpod/widgets/widgets.dart';

class SelectDateTime extends StatelessWidget {
  const SelectDateTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CommonTextField(
            taskTitle: 'Date',
            hintText: 'Aug 07',
            readOnly: true,
            suffixIcon: IconButton(
              onPressed: () => _selectDate(context),
              icon: const FaIcon(
                FontAwesomeIcons.calendar,
              ),
            ),
          ),
        ),
        const Gap(16),
        Expanded(
          child: CommonTextField(
            taskTitle: 'Time',
            hintText: '10:30',
            readOnly: true,
            suffixIcon: IconButton(
              onPressed: () => _selectTime(context),
              icon: const FaIcon(
                FontAwesomeIcons.clock,
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _selectTime(BuildContext context) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      //TODO: Implement the logic to save the selected time
      print(pickedTime.format(context));
    }
  }

  void _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime(2090),
    );

    if (pickedDate != null) {
      //TODO: Implement the logic to save the selected date
      print(pickedDate.toLocal().toString());
    }
  }
}
