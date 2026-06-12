import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddImageFunction extends StatefulWidget {
  final Function(List<File>) onImagesChanged;

  const AddImageFunction({super.key, required this.onImagesChanged});

  @override
  State<AddImageFunction> createState() => _AddImageFunctionState();
}

class _AddImageFunctionState extends State<AddImageFunction> {
  List<File> images = [];
  final ImagePicker picker = ImagePicker();

  Future<void> pickImage() async {
    if (images.length >= 8) return;

    final XFile? picked = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (picked == null) return;

    final File file = File(picked.path);

    setState(() {
      images.add(file);
    });

    widget.onImagesChanged(List<File>.from(images));
  }

  void removeImage(int index) {
    setState(() {
      images.removeAt(index);
    });

    widget.onImagesChanged(List<File>.from(images));
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: images.length < 8 ? images.length + 1 : images.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemBuilder: (context, index) {
        // ➕ Add button
        if (index == images.length && images.length < 8) {
          return GestureDetector(
            onTap: pickImage,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(child: Icon(Icons.add_a_photo, size: 30)),
            ),
          );
        }

        // 🖼 Image preview
        return Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.file(
                images[index],
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),

            // ❌ remove button
            Positioned(
              top: 5,
              right: 5,
              child: GestureDetector(
                onTap: () => removeImage(index),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.black54,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.close, color: Colors.white, size: 18),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
