import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:imagestream/Pagination/pagination_responsive_wrapper.dart';

class PaginationController extends StatefulWidget {
  final Function adapterHelp;
  final List<String> listOfData;
  const PaginationController(this.adapterHelp, this.listOfData, {Key? key})
      : super(key: key);

  @override
  State<PaginationController> createState() => _PaginationControllerState();
}

class _PaginationControllerState extends State<PaginationController> {
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

    return PaginationResponsiveWrapper(widget.listOfData, pages, widget.adapterHelp, elementsPerPage);
  }
}
