import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class PgTablet extends StatefulWidget {
  final List listOfData;
  final List<String> pages;
  final Function adapterHelp;
  final int elementsPerPage;
  final Function safeSubList;
  const PgTablet(this.listOfData, this.pages, this.adapterHelp, this.elementsPerPage, this.safeSubList,{Key? key}) : super(key: key);

  @override
  State<PgTablet> createState() => _PgTabletState();
}

class _PgTabletState extends State<PgTablet> {
  int pageNum = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text("Select page tablet:"),
              SizedBox(width: 20),
              DropdownButton(
                underline: null,
                isExpanded: false,
                dropdownColor: Colors.white,
                focusColor: Color(0xff676767),
                // Initial Value
                value: widget.pages[pageNum],

                // Down Arrow Icon
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  color: Color(0xff676767),
                ),

                // Array list of items
                items: widget.pages.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                // After selecting the desired option,it will
                // change button value to selected value
                onChanged: (String? newValue) {
                  setState(() {
                    pageNum = widget.pages.indexOf(newValue!);
                  });
                },
              ),
              pageNum == 0
                  ? SizedBox.shrink()
                  : TextButton(
                      onPressed: () {
                        setState(() {
                          pageNum--;
                        });
                      },
                      child: Text("Prev"),
                    ),
              pageNum == widget.pages.length - 1
                  ? SizedBox.shrink()
                  : TextButton(
                      onPressed: () {
                        setState(() {
                          pageNum++;
                        });
                      },
                      child: Text("Next"),
                    ),
            ],
          ),
        ),
        widget.adapterHelp(widget.safeSubList(
            widget.listOfData,
            pageNum * widget.elementsPerPage,
            pageNum * widget.elementsPerPage + widget.elementsPerPage)),
      ],
    );
  }
}