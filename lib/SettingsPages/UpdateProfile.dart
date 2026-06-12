import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:phoenix/Utils/helper/appbar.dart';
import 'package:phoenix/Utils/providers/userprovider.dart';
import 'package:phoenix/Utils/service/usreservice.dart';
import 'package:provider/provider.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final List<String> governorates = [
    "Cairo",
    "Alexandria",
    "Port Said",
    "Suez",
    "Giza",
    "Damietta",
    "Dakahlia",
    "Sharqia",
    "Qalyubia",
    "Kafr El Sheikh",
    "Gharbia",
    "Monufia",
    "Beheira",
    "Ismailia",
    "Beni Suef",
    "Fayoum",
    "Minya",
    "Asyut",
    "Sohag",
    "Qena",
    "Luxor",
    "Aswan",
    "Red Sea",
    "New Valley",
    "Matrouh",
    "North Sinai",
    "South Sinai",
  ];
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _addresscontroller = TextEditingController();

  String? _selectedGovernorate;

  // Image picker state
  final ImagePicker _picker = ImagePicker();
  XFile? _profileImage;

  Future<void> _pickProfileImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _profileImage = image;
      });
    }
  }

  @override
  void initState() {
    super.initState();

    final user = context.read<Userprovider>().User;

    _nameController.text = user?.name ?? '';
    _cityController.text = user?.city ?? '';
    _addresscontroller.text = user?.address ?? '';
    _selectedGovernorate = governorates.contains(user?.governorate)
        ? user?.governorate
        : null;
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Userprovider>(context).User;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: appbar(width: width),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Theme.of(context).colorScheme.outline),
          ),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                // Avatar + Change Photo
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Color(0xfff0500a),
                  backgroundImage: user!.image!.isNotEmpty
                      ? NetworkImage(user.image!)
                      : null,
                  child: user.image!.isEmpty
                      ? Text(
                          user.name.substring(0, 2).toUpperCase(), // initials,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : null,
                ),
                TextButton(
                  onPressed: _pickProfileImage,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 16,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: const LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xfffec517), Color(0xfff43f06)],
                      ),
                    ),
                    child: const Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.camera_alt, color: Colors.white),
                          SizedBox(width: 8),
                          Text(
                            "Change Photo",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Full Name
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: "Full Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide: BorderSide(
                        color: Color(0xfff0500a),
                        width: 2,
                      ),
                    ),
                    floatingLabelStyle: TextStyle(color: Color(0xfff0500a)),
                  ),
                ),
                const SizedBox(height: 12),

                // Email (disabled)
                // TextFormField(
                //   controller: _emailController,
                //   enabled: false,
                //   decoration: const InputDecoration(
                //     labelText: "Email",
                //     helperText:
                //         "If you need to change your email, please contact support.",
                //     border: OutlineInputBorder(
                //       borderRadius: BorderRadius.all(Radius.circular(16)),
                //     ),
                //     focusedBorder: OutlineInputBorder(
                //       borderRadius: BorderRadius.all(Radius.circular(16)),
                //       borderSide: BorderSide(
                //         color: Color(0xfff0500a),
                //         width: 2,
                //       ),
                //     ),
                //     floatingLabelStyle: TextStyle(color: Color(0xfff0500a)),
                //   ),
                // ),
                // const SizedBox(height: 12),

                // Phone Number (disabled)
                // TextFormField(
                //   controller: _phoneController,
                //   enabled: false,
                //   decoration: const InputDecoration(
                //     labelText: "Phone Number",
                //     helperText:
                //         "If you need to change your phone number, please contact support.",
                //     border: OutlineInputBorder(
                //       borderRadius: BorderRadius.all(Radius.circular(16)),
                //     ),
                //     focusedBorder: OutlineInputBorder(
                //       borderRadius: BorderRadius.all(Radius.circular(16)),
                //       borderSide: BorderSide(
                //         color: Color(0xfff0500a),
                //         width: 2,
                //       ),
                //     ),
                //     floatingLabelStyle: TextStyle(color: Color(0xfff0500a)),
                //   ),
                // ),
                // const SizedBox(height: 12),

                // Governorate dropdown
                DropdownButtonFormField<String>(
                  value: governorates.contains(_selectedGovernorate)
                      ? _selectedGovernorate
                      : null,
                  items: governorates
                      .map(
                        (gov) => DropdownMenuItem(value: gov, child: Text(gov)),
                      )
                      .toList(),
                  onChanged: (val) =>
                      setState(() => _selectedGovernorate = val),
                  decoration: const InputDecoration(
                    labelText: "Governorate",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide: BorderSide(
                        color: Color(0xfff0500a),
                        width: 2,
                      ),
                    ),
                    floatingLabelStyle: TextStyle(color: Color(0xfff0500a)),
                  ),
                ),
                const SizedBox(height: 12),

                // City
                TextFormField(
                  controller: _cityController,
                  decoration: const InputDecoration(
                    labelText: "City",
                    hintText: "e.g. Nasr City",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide: BorderSide(
                        color: Color(0xfff0500a),
                        width: 2,
                      ),
                    ),
                    floatingLabelStyle: TextStyle(color: Color(0xfff0500a)),
                  ),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _addresscontroller,
                  decoration: const InputDecoration(
                    labelText: "address",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide: BorderSide(
                        color: Color(0xfff0500a),
                        width: 2,
                      ),
                    ),
                    floatingLabelStyle: TextStyle(color: Color(0xfff0500a)),
                  ),
                ),

                // Bio
                // TextFormField(
                //   controller: _bioController,
                //   maxLines: 3,
                //   decoration: const InputDecoration(
                //     labelText: "Bio",
                //     hintText: "write anything you want bro",
                //     border: OutlineInputBorder(
                //       borderRadius: BorderRadius.all(Radius.circular(16)),
                //     ),
                //     focusedBorder: OutlineInputBorder(
                //       borderRadius: BorderRadius.all(Radius.circular(16)),
                //       borderSide: BorderSide(
                //         color: Color(0xfff0500a),
                //         width: 2,
                //       ),
                //     ),
                //     floatingLabelStyle: TextStyle(color: Color(0xfff0500a)),
                //   ),
                // ),

                // const SizedBox(height: 20),

                // Save button
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                SizedBox(
                  width: width,
                  height: 55,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(
                      16,
                    ), // ripple respects rounded corners
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        print("🚀 Sending update request...");

                        final update = await Usreservice().updateUser(
                          name: _nameController.text,
                          governorate: _selectedGovernorate,
                          city: _cityController.text,
                          address: _addresscontroller.text,
                          // image: _profileImage?.path,
                        );

                        print("🔥 update result = $update");

                        if (update) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Changes saved")),
                          );
                          Navigator.pop(context, true);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Update failed ❌")),
                          );
                        }
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: const LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.bottomRight,
                          colors: [Color(0xfffec517), Color(0xfff43f06)],
                        ),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        "Save Changes",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
