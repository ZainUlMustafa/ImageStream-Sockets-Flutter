import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:imagestream/ImageCard.dart';

class ImageListAdapter extends StatelessWidget {
  final List<String> listOfImages;
  const ImageListAdapter(this.listOfImages, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Column(
    //   children: [
    //     ...listOfImages.map((e) => ImageCard(e)).toList(),
    //   ],
    // );
    return Expanded(
      // height: 100,
      child: ListView.builder(itemCount: listOfImages.length, itemBuilder: (context, index) {
        return new ListTile(
          title: ImageCard(listOfImages[index]),
        );
      }),
    );
  }
}

Widget imageListAdaptHelp(List<String> listOfImages) {
  return ImageListAdapter(listOfImages);
}
