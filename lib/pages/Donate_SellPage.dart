import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:phoenix/Utils/class/ItemSellClass.dart';
import 'package:phoenix/Utils/class/categoryClass.dart';
import 'package:phoenix/Utils/service/categoryService.dart';
import 'package:phoenix/Utils/service/itemService.dart';
import 'package:phoenix/Utils/service/mediaservice.dart';
import 'package:phoenix/Utils/validations/sellValidation.dart';

class DonateOrsellpage extends StatefulWidget {
  const DonateOrsellpage({super.key});

  @override
  State<DonateOrsellpage> createState() => _DonateOrsellpageState();
}

class _DonateOrsellpageState extends State<DonateOrsellpage> {
  File? Images;
  final ImagePicker picker = ImagePicker();
  String Type = 'donate';
  String image_id = '';
  bool donated = true;
  TextEditingController _producttiilecontroller = TextEditingController();
  TextEditingController _descrabtioncontroller = TextEditingController();
  TextEditingController _brandcontroller = TextEditingController();
  TextEditingController _locationcontroller = TextEditingController();
  TextEditingController _pricecontroller = TextEditingController();
  List<String> condition = ['New', 'Like New', 'Good', 'Fair'];
  String selectedcondition = 'Good';
  List<Categoryclass> categories = [];
  Categoryclass? selectedCategory;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    loadCategories();
  }

  Future<void> loadCategories() async {
    final result = await Categoryservice.getListCatgory();

    if (!mounted) return;

    if (result.isEmpty) return;

    setState(() {
      categories = result;
      selectedCategory = result.first;
    });
  }

  @override
  void dispose() {
    _producttiilecontroller.dispose();
    _descrabtioncontroller.dispose();
    _brandcontroller.dispose();
    _locationcontroller.dispose();
    _pricecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            if (donated) ...[
              Text(
                'Donate an Item',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
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
                style: TextStyle(
                  fontSize: 15,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ],
            if (!donated) ...[
              Text(
                'sell an Item',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
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
                style: TextStyle(
                  fontSize: 15,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ],
            SizedBox(height: MediaQuery.of(context).size.width * 0.04),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: Theme.of(context).colorScheme.outline,
                  width: 1,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.image_outlined,
                              color: Color(0xfff0500a),
                              size: 20,
                            ),
                            Text(
                              'Product Images',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onSurface,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.04,
                      ),

                      GestureDetector(
                        onTap: () async {
                          final XFile? pickedFile = await picker.pickImage(
                            source: ImageSource.gallery,
                            imageQuality: 80,
                          );

                          if (pickedFile != null) {
                            setState(() {
                              Images = File(pickedFile.path);
                            });
                          }
                        },
                        child: Container(
                          height: 120,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: Theme.of(context).colorScheme.outline,
                            ),
                            color: Theme.of(context).cardColor,
                          ),
                          child: Images == null
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      Icons.add_a_photo,
                                      size: 35,
                                      color: Color(0xfff0500a),
                                    ),
                                    SizedBox(height: 8),
                                    Text("Add Product Image"),
                                  ],
                                )
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Image.file(
                                    Images!,
                                    width: double.infinity,
                                    height: 120,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                        ),
                      ),

                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.04,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.now_widgets,
                            color: Color(0xfff0500a),
                            size: 20,
                          ),
                          Text(
                            'Basic Information',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onSurface,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.04,
                      ),
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
                            borderSide: BorderSide(
                              color: Color(0xfff0500a),
                              width: 2,
                            ),
                          ),
                          floatingLabelStyle: TextStyle(
                            color: Color(0xfff0500a),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.04,
                      ),
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
                            borderSide: BorderSide(
                              color: Color(0xfff0500a),
                              width: 2,
                            ),
                          ),
                          floatingLabelStyle: TextStyle(
                            color: Color(0xfff0500a),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.04,
                      ),
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
                            borderSide: BorderSide(
                              color: Color(0xfff0500a),
                              width: 2,
                            ),
                          ),
                          floatingLabelStyle: TextStyle(
                            color: Color(0xfff0500a),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.04,
                      ),
                      DropdownButtonFormField<Categoryclass>(
                        value: selectedCategory,
                        items: categories.map((item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text(item.name),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedCategory = value;
                          });
                        },
                        decoration: InputDecoration(
                          labelText: 'Category',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            borderSide: BorderSide(
                              color: Color(0xfff0500a),
                              width: 2,
                            ),
                          ),
                          floatingLabelStyle: TextStyle(
                            color: Color(0xfff0500a),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.04,
                      ),
                      DropdownButtonFormField(
                        items: condition.map((item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text(item),
                          );
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
                            borderSide: BorderSide(
                              color: Color(0xfff0500a),
                              width: 2,
                            ),
                          ),
                          floatingLabelStyle: TextStyle(
                            color: Color(0xfff0500a),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.04,
                      ),
                      Row(
                        children: [
                          Text(
                            'Donted',
                            style: TextStyle(
                              fontSize: 20,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.55,
                          ),
                          Switch(
                            activeColor: Color(0xfff0500a),
                            value: donated,
                            onChanged: (value) {
                              setState(() {
                                donated = value;
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.04,
                      ),
                      if (!donated)
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
                              borderRadius: BorderRadius.all(
                                Radius.circular(16),
                              ),
                              borderSide: BorderSide(
                                color: Color(0xfff0500a),
                                width: 2,
                              ),
                            ),
                            floatingLabelStyle: TextStyle(
                              color: Color(0xfff0500a),
                            ),
                          ),
                        ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.04,
                      ),
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
                            if (!_formKey.currentState!.validate()) {
                              return;
                            }
                            final media = await mediaservice().uploadImage(
                              Images,
                            );

                            late final Itemsellclass item;
                            if (donated) {
                              item = Itemsellclass(
                                image_id: media?.id,
                                name: _producttiilecontroller.text,
                                description: _descrabtioncontroller.text,
                                donated: donated,
                                category_id: selectedCategory!.id,
                                Brand: _brandcontroller.text,
                                Condation: selectedcondition,
                              );
                            } else {
                              item = Itemsellclass(
                                image_id: media?.id,
                                name: _producttiilecontroller.text,
                                description: _descrabtioncontroller.text,
                                donated: donated,
                                category_id: selectedCategory!.id,
                                Brand: _brandcontroller.text,
                                Condation: selectedcondition,
                                Price: int.tryParse(_pricecontroller.text),
                              );
                            }
                            bool success = await Itemservice.additem(item);
                            print("👌ITEM DATA: ${item.toJson()}");

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
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
