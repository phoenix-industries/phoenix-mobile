import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class addimagefunction extends StatefulWidget {
  final Function(List<XFile>) onImagesChanged;
  const addimagefunction({super.key, required this.onImagesChanged});

  @override
  State<addimagefunction> createState() => _addimagefunctionState();
}

class _addimagefunctionState extends State<addimagefunction> {
  @override
  List<XFile> images = [];
  final ImagePicker picker = ImagePicker();

  Future<void> pickImage() async {
    if (images.length >= 8) return;
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        images.add(image);
        widget.onImagesChanged(images);
      });
    }
  }

  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: images.length < 8 ? images.length + 1 : images.length,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemBuilder: (context, index) {
        if (index == images.length && images.length < 8) {
          return GestureDetector(
            onTap: pickImage,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(child: Icon(Icons.add_a_photo, size: 30)),
            ),
          );
        }
        return Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.file(
                File(images[index].path),
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            Positioned(
              top: 5,
              right: 5,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    images.removeAt(index);
                    widget.onImagesChanged(images);
                  });
                },
                child: Icon(Icons.close, color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }
}
