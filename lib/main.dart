//Null
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//Function
void main() {
  // Run
  runApp(const _Application());
}

//Widget (Stateless or Stateful)

//State

//Class
class _Application extends StatelessWidget {
  //Class constructor
  const _Application();

  @override
  Widget build(BuildContext context) {
    //Const for performance improvement
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      //Scaffold
      home: const _MainScreen(),
    );
    // return CupertinoApp();
  }
}

//Code visibility
class _MainScreen extends StatelessWidget {
  const _MainScreen();

  @override
  Widget build(BuildContext context) {
    void onPressed() {
      //Stack
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            //Anonymous function
            return _CreateAnEventScreen();
          },
        ),
      );
      //Go to "Create an event screen"
    }

    return Scaffold(
      body: Center(
        //TextButton
        child: TextButton(
          //State (Active state, disabled state, clicked state)
          //onPressed: null,
          onPressed: onPressed,
          child: const Text(
            //Positioned or named parameters
            'Hello, World!',
            style: TextStyle(),
          ),
        ),
      ),
    );
  }
}

class _CreateAnEventScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CreateAnEventScreenState();
  }
}

class _CreateAnEventScreenState extends State<_CreateAnEventScreen> {
  final List<String> choiceChipLabels = [
    '5 min', // 0 - index
    '10 min', // 1
    '30 min', // 2
    '1 h', // 3
    '2 h', // 4
    '3 h', // 5
    '4 h',
    '5 h',
    '6 h',
    '7 h',
    '8 h',
    '9 h',
    '10 h',
  ];

  int _selectedChoiceChip = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create an Event'),
        actions: [
          //Properties and methods of a class
          //Function
          //Variable
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.done),
          ),
        ],
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.attachment)),
            IconButton(onPressed: () {}, icon: Icon(Icons.mic)),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            _IntroCardWidget(),
            SizedBox(height: 12.0),
            _TitleTextFieldWidget(),
            SizedBox(width: 12.0, height: 12.0),
            _DescriptionTextFieldWidget(),
            SizedBox(height: 12.0),
            _InfoCardWidget(),
            SizedBox(height: 12.0),

            //Constraints
            _DateTimePickerWidget(),
            SizedBox(height: 12.0),

            // ==; !=; =; ...
            //Ternary operator
            // ...List.from([
            //   ChoiceChip(label: label, selected: selected),
            //   ChoiceChip(label: label, selected: selected),
            //   ChoiceChip(label: label, selected: selected),
            //   ChoiceChip(label: label, selected: selected),
            // ]),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...List.generate(12, (int index) {
                    return Row(
                      children: [
                        ChoiceChip(
                          label: Text(choiceChipLabels[index]),
                          //condition ? condition is met : condition is not met
                          selected: _selectedChoiceChip == index ? true : false,
                          onSelected: (bool value) {
                            setState(() => _selectedChoiceChip = index);
                          },
                        ),
                        const SizedBox(width: 12),
                      ],
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// _ private class
//UpperCamelCase

class _DateTimePickerWidget extends StatefulWidget {
  const _DateTimePickerWidget();

  @override
  State<_DateTimePickerWidget> createState() => _DateTimePickerWidgetState();
}

class _DateTimePickerWidgetState extends State<_DateTimePickerWidget> {
  DateTime initialDate = DateTime.now();
  TimeOfDay initialTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ListTile(
            leading: const Icon(Icons.calendar_today),
            title: Text(DateFormat.yMMMd().format(initialDate)),
            dense: true,
            onTap: () {
              //Generic type <T>, <R>
              //List<Widget>
              //List<String>
              //List<int>
              showDatePicker(
                context: context,
                initialDate: initialDate,
                firstDate: initialDate,
                lastDate: initialDate.add(const Duration(days: 7)),
              ).then((DateTime? pickedDate) {
                //flow
                if (pickedDate == null) {
                  return;
                } else {
                  // /flow
                  setState(() => initialDate = pickedDate);
                }
              });
            },
          ),
        ),
        Expanded(
          child: ListTile(
            leading: const Icon(Icons.timer),
            title: Text(
              DateFormat.Hm().format(
                DateTime(
                  initialDate.year,
                  initialDate.month,
                  initialDate.day,
                  initialTime.hour,
                  initialTime.minute,
                ),
              ),
            ),
            dense: true,
            onTap: () {
              showTimePicker(context: context, initialTime: initialTime).then((
                TimeOfDay? pickedTime,
              ) {
                if (pickedTime != null) {
                  setState(() => initialTime = pickedTime);
                }
                return;
              });
            },
          ),
        ),
      ],
    );
  }
}

class _InfoCardWidget extends StatelessWidget {
  const _InfoCardWidget();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 12.0),
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Text(
          'By default, the date and the time \'re set to current values',
        ),
      ),
    );
  }
}

class _DescriptionTextFieldWidget extends StatelessWidget {
  const _DescriptionTextFieldWidget();

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 5,
      decoration: InputDecoration(
        labelText: 'Desciption',
        border: OutlineInputBorder(),
      ),
    );
  }
}

class _TitleTextFieldWidget extends StatelessWidget {
  const _TitleTextFieldWidget();

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Title',
        border: OutlineInputBorder(),
      ),
    );
  }
}

class _IntroCardWidget extends StatelessWidget {
  const _IntroCardWidget();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 12.0),
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Text('Fill the blanks, and name your party'),
      ),
    );
  }
}
