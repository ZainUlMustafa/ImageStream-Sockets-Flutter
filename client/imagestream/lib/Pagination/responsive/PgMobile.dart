import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class PgMobile extends StatefulWidget {
  final List listOfData;
  final List<String> pages;
  final Function adapterHelp;
  final int elementsPerPage;
  final Function safeSubList;
  const PgMobile(this.listOfData, this.pages, this.adapterHelp, this.elementsPerPage, this.safeSubList, {Key? key}) : super(key: key);

  @override
  State<PgMobile> createState() => _PgMobileState();
}

class _PgMobileState extends State<PgMobile> {
  int pageNum = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text("Select page mobile:"),
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