import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class PaginationController extends StatefulWidget {
  final Function adapterHelp;
  final List<String> listOfData;
  const PaginationController(this.adapterHelp, this.listOfData, {Key? key})
      : super(key: key);

  @override
  State<PaginationController> createState() => _PaginationControllerState();
}

class _PaginationControllerState extends State<PaginationController> {
  int pageNum = 0;
  int elementsPerPage = 7;
  List<String> pages = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    pages.clear();
    int totalPages = (widget.listOfData.length / elementsPerPage).ceil();
    for (int i = 0; i < totalPages; ++i) {
      pages.add("$i");
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Pages"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text("Select page:"),
                SizedBox(width: 20),
                DropdownButton(
                  underline: null,
                  isExpanded: false,
                  dropdownColor: Colors.white,
                  focusColor: Color(0xff676767),
                  // Initial Value
                  value: pages[pageNum],

                  // Down Arrow Icon
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Color(0xff676767),
                  ),

                  // Array list of items
                  items: pages.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    setState(() {
                      pageNum = pages.indexOf(newValue!);
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
                pageNum == totalPages - 1
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
          widget.adapterHelp(safeSubList(
              widget.listOfData,
              pageNum * elementsPerPage,
              pageNum * elementsPerPage + elementsPerPage)),
        ],
      ),
    );
  }

  List<String> safeSubList(List<String> listOfData, int instart, int exend) {
    int safeExclusiveness =
        listOfData.length < exend ? listOfData.length : exend;
    print("$instart, $safeExclusiveness");

    print(listOfData.sublist(instart, safeExclusiveness).length);
    return listOfData.sublist(instart, safeExclusiveness);
  }
}
