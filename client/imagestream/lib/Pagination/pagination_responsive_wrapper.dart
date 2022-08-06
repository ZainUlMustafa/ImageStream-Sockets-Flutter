import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:imagestream/Pagination/responsive/PgMobile.dart';
import 'package:imagestream/Pagination/responsive/PgTablet.dart';

class PaginationResponsiveWrapper extends StatelessWidget {
  final List listOfData;
  final List<String> pages;
  final Function adapterHelp;
  final int elementsPerPage;
  const PaginationResponsiveWrapper(this.listOfData, this.pages, this.adapterHelp, this.elementsPerPage, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLargeScreen = MediaQuery.of(context).size.width > 400;
    print(isLargeScreen);
    print(MediaQuery.of(context).size.width);
    return isLargeScreen ? PgTablet(listOfData, pages, adapterHelp, elementsPerPage, safeSubList) : PgMobile(listOfData, pages, adapterHelp, elementsPerPage, safeSubList);
  }

  List safeSubList(List listOfData, int instart, int exend) {
    int safeExclusiveness =
        listOfData.length < exend ? listOfData.length : exend;
    print("$instart, $safeExclusiveness");

    print(listOfData.sublist(instart, safeExclusiveness).length);
    return listOfData.sublist(instart, safeExclusiveness);
  }
}