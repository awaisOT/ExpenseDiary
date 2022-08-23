import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './expenses.dart';

class CHART extends StatelessWidget {
  final List<Expenses> rDays;
  CHART(this.rDays);

  List<Map<String, Object>> get requireDays {
    return List.generate(7, (index) {
      final Day = DateTime.now().subtract(Duration(days: index));

      double amount = 0;
      for (int i = 0; i < rDays.length; i++) {
        if (Day.day == rDays[i].date.day &&
            Day.month == rDays[i].date.month &&
            Day.year == rDays[i].date.year) {
              amount+=rDays[i].amount;
            }
      }
      return ({'day': DateFormat.E().format(Day), 'amount': amount});
    });
    
  }

  @override
  Widget build(BuildContext context) {
    print(requireDays);
    return Card(
      child: Row(
        
        children: [
          
        ],
      ),
    );
  }
}
