import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dropdownview3 extends StatefulWidget {
  late List<String> itemsded = [
    '5',
    '10',
    '15',
    '20',
  ];

  Dropdownview3({super.key});
  @override
  State<Dropdownview3> createState() => _Dropdownview3State();
}

class _Dropdownview3State extends State<Dropdownview3> {
  late int _selectedItemIndex;
  @override
  void initState() {
    super.initState();
    _selectedItemIndex = 0; // Set default selected item to the first item
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 60,
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Container(
                color: const Color(0xff092D51),
                height: 250,
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        'Select Number',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    CupertinoPicker(
                      backgroundColor: const Color(0xff092D51),
                      itemExtent: 90,
                      onSelectedItemChanged: (int index) {
                        setState(
                          () {
                            _selectedItemIndex = index;
                          },
                        );
                      },
                      children: widget.itemsded.map((String item) {
                        return Center(
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Done',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  widget.itemsded[_selectedItemIndex],
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Icon(
                Icons.arrow_drop_down,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
