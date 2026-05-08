import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:phoenix/Utils/class/ItemSellClass.dart';
import 'package:phoenix/Utils/service/addImageFuncation.dart';
import 'package:phoenix/Utils/service/itemService.dart';
import 'package:phoenix/Utils/validations/sellValidation.dart';
import 'package:phoenix/Utils/helper/appbar.dart';

class DonateOrsellpage extends StatefulWidget {
  const DonateOrsellpage({super.key});

  @override
  State<DonateOrsellpage> createState() => _DonateOrsellpageState();
}

class _DonateOrsellpageState extends State<DonateOrsellpage> {
  List<XFile> Images = [];
  String Type = 'donate';
  TextEditingController _producttiilecontroller = TextEditingController();
  TextEditingController _descrabtioncontroller = TextEditingController();
  TextEditingController _brandcontroller = TextEditingController();
  TextEditingController _locationcontroller = TextEditingController();
  TextEditingController _pricecontroller = TextEditingController();
  List<String> Category = [
    "All Products",
    "Electronics",
    "Fashion",
    "Home",
    "Sports",
    "Books",
    "Toys",
  ];
  String selectedcategory = '';
  List<String> condition = ['New', 'Like New', 'Good', 'Fair'];
  String selectedcondition = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: Center(
                child: Row(
                  children: [
                    ChoiceChip(
                      selectedColor: Color(0xfff0500a),
                      disabledColor: Theme.of(context).cardColor,
                      label: Text('Donate'),
                      selected: Type == 'donate',
                      onSelected: (value) {
                        setState(() {
                          Type = 'donate';
                        });
                      },
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                    ChoiceChip(
                      selectedColor: Color(0xfff0500a),
                      disabledColor: Theme.of(context).cardColor,
                      label: Text('sell'),
                      selected: Type == 'sell',
                      onSelected: (value) {
                        setState(() {
                          Type = 'sell';
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            if (Type == 'donate') ...[
              Text(
                'Donate an Item',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40,
                  foreground: Paint()
                    ..shader = LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xfff0500a), Color(0Xfff8d402)],
                    ).createShader(const Rect.fromLTWH(0, 0, 200, 70)),
                ),
              ),
              Text(
                'Give Your belongings a new home. zero cost, maximum impact',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, color: Theme.of(context).colorScheme.onSurface),
              ),
            ],
            if (Type == 'sell') ...[
              Text(
                'sell an Item',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40,
                  foreground: Paint()
                    ..shader = LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xfff0500a), Color(0Xfff8d402)],
                    ).createShader(const Rect.fromLTWH(0, 0, 200, 70)),
                ),
              ),
              Text(
                'List your pre-loved items for sale at a fair price',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, color: Theme.of(context).colorScheme.onSurface),
              ),
            ],
            SizedBox(height: MediaQuery.of(context).size.width * 0.04),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: Theme.of(context).colorScheme.outline, width: 1),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(Icons.image_outlined, color: Color(0xfff0500a)),
                          Text(
                            'Product Images',
                            style: TextStyle(color: Theme.of(context).colorScheme.onSurface, fontSize: 28),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width * 0.04),
                    addimagefunction(
                      onImagesChanged: (imgs) {
                        setState(() {
                          Images = imgs;
                        });
                      },
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width * 0.04),
                    Row(
                      children: [
                        Icon(Icons.now_widgets, color: Color(0xfff0500a)),
                        Text(
                          'Basic Information',
                          style: TextStyle(color: Theme.of(context).colorScheme.onSurface, fontSize: 28),
                        ),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width * 0.04),
                    TextFormField(
                      validator: Sellvalidation.validateTitle,
                      controller: _producttiilecontroller,
                      decoration: InputDecoration(
                        hintText: 'MacBook pro 16-inch M3 ',
                        labelText: 'Product Title',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    borderSide: BorderSide(color: Color(0xfff0500a), width: 2),),
                    floatingLabelStyle: TextStyle(color: Color(0xfff0500a)),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width * 0.04),
                    TextFormField(
                      validator: Sellvalidation.validateDescraption,
                      controller: _descrabtioncontroller,
                      decoration: InputDecoration(
                        hintText:
                            'Describe your product in detail. Icloude any defects,accessories or special features ......',
                        labelText: 'descrabtion',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    borderSide: BorderSide(color: Color(0xfff0500a), width: 2),),
                    floatingLabelStyle: TextStyle(color: Color(0xfff0500a)),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width * 0.04),
                    TextFormField(
                      controller: _brandcontroller,
                      decoration: InputDecoration(
                        hintText: 'Apple,...',
                        labelText: 'Brand(optional)',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    borderSide: BorderSide(color: Color(0xfff0500a), width: 2),),
                    floatingLabelStyle: TextStyle(color: Color(0xfff0500a)),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width * 0.04),
                    DropdownButtonFormField(
                      items: Category.map((item) {
                        return DropdownMenuItem(value: item, child: Text(item));
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedcategory = value!;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Category',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    borderSide: BorderSide(color: Color(0xfff0500a), width: 2),),
                    floatingLabelStyle: TextStyle(color: Color(0xfff0500a)),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width * 0.04),
                    DropdownButtonFormField(
                      items: condition.map((item) {
                        return DropdownMenuItem(value: item, child: Text(item));
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedcondition = value!;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Condition',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    borderSide: BorderSide(color: Color(0xfff0500a), width: 2),),
                    floatingLabelStyle: TextStyle(color: Color(0xfff0500a)),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width * 0.04),
                    TextFormField(
                      validator: Sellvalidation.validateLocation,
                      controller: _locationcontroller,
                      decoration: InputDecoration(
                        hintText: 'City,...',
                        labelText: 'Location',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    borderSide: BorderSide(color: Color(0xfff0500a), width: 2),),
                    floatingLabelStyle: TextStyle(color: Color(0xfff0500a)),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width * 0.04),
                    if (Type == 'sell')
                      TextFormField(
                        validator: Sellvalidation.validatePrice,
                        controller: _pricecontroller,
                        decoration: InputDecoration(
                          hintText: '100',
                          labelText: 'Price',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    borderSide: BorderSide(color: Color(0xfff0500a), width: 2),),
                    floatingLabelStyle: TextStyle(color: Color(0xfff0500a)),
                        ),
                      ),
                    SizedBox(height: MediaQuery.of(context).size.width * 0.04),
                    Container(
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: const LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.bottomRight,
                          colors: [Color(0xfffec517), Color(0xfff43f06)],
                        ),
                      ),
                      child: InkWell(
                        onTap: () async {
                          List<String> base64Images = [];
                          for (var img in Images) {
                            final bytes = await File(img.path).readAsBytes();
                            base64Images.add(base64Encode(bytes));
                          }
                          final item = Itemsellclass(
                            images: base64Images,
                            productTitle: _producttiilecontroller.text,
                            description: _descrabtioncontroller.text,
                            Category: selectedcategory,
                            Condation: selectedcondition,
                            Location: _locationcontroller.text,
                            type: Type,
                            uploadtime: DateTime.now(),
                          );
                          bool success = await Itemservice.additem(item);

                          if (success) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("✅ Product added successfully"),
                              ),
                            );

                            Future.delayed(
                              const Duration(milliseconds: 500),
                              () {
                                Navigator.pushReplacementNamed(
                                  context,
                                  '/home',
                                );
                              },
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("❌ Failed to add product"),
                              ),
                            );
                          }
                        },
                        child: const Center(
                          child: Text(
                            'publish Listing',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
