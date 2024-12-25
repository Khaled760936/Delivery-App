import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/Components/my_user.dart';

// User model

class UserProfilePage extends StatefulWidget {
  final User user;

  const UserProfilePage({super.key, required this.user});

  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController locationController;

  @override
  void initState() {
    super.initState();
    firstNameController = TextEditingController(text: widget.user.firstName);
    lastNameController = TextEditingController(text: widget.user.lastName);
    locationController = TextEditingController(text: widget.user.location);
    _loadUserData();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    locationController.dispose();
    super.dispose();
  }

  // Load user data from shared preferences
  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      widget.user.firstName =
          prefs.getString('firstName') ?? widget.user.firstName;
      widget.user.lastName =
          prefs.getString('lastName') ?? widget.user.lastName;
      widget.user.location =
          prefs.getString('location') ?? widget.user.location;
      final imagePath = prefs.getString('profileImage');
      if (imagePath != null) {
        widget.user.profileImage = File(imagePath);
      }
      firstNameController.text = widget.user.firstName;
      lastNameController.text = widget.user.lastName;
      locationController.text = widget.user.location;
    });
  }

  // Save user edits to shared preferences
  Future<void> _saveUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('firstName', firstNameController.text);
    await prefs.setString('lastName', lastNameController.text);
    await prefs.setString('location', locationController.text);
    if (widget.user.profileImage != null) {
      await prefs.setString('profileImage', widget.user.profileImage!.path);
    }

    setState(() {
      widget.user.firstName = firstNameController.text;
      widget.user.lastName = lastNameController.text;
      widget.user.location = locationController.text;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Profile updated successfully!")),
    );
  }

  // Method to pick an image
  Future<void> _pickImage(ImageSource source) async {
    try {
      final pickedFile = await ImagePicker().pickImage(source: source);
      if (pickedFile != null) {
        setState(() {
          widget.user.profileImage = File(pickedFile.path);
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to pick an image: $e")),
      );
    }
  }

  // Show dialog for selecting image source
  void _showImageSourceDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Select Image Source"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera),
              title: const Text("Camera"),
              onTap: () {
                Navigator.of(context).pop();
                _pickImage(ImageSource.camera);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo),
              title: const Text("Gallery"),
              onTap: () {
                Navigator.of(context).pop();
                _pickImage(ImageSource.gallery);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Profile"),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Profile picture
              GestureDetector(
                onTap: _showImageSourceDialog,
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.grey.shade300,
                  backgroundImage: widget.user.profileImage != null
                      ? FileImage(widget.user.profileImage!)
                      : null,
                  child: widget.user.profileImage == null
                      ? const Icon(Icons.camera_alt,
                          size: 60, color: Colors.grey)
                      : null,
                ),
              ),
              const SizedBox(height: 20),

              // First name
              TextField(
                controller: firstNameController,
                decoration: InputDecoration(
                  labelText: "First Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Last name
              TextField(
                controller: lastNameController,
                decoration: InputDecoration(
                  labelText: "Last Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Location
              TextField(
                controller: locationController,
                decoration: InputDecoration(
                  labelText: "Location",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Save profile button
              ElevatedButton.icon(
                onPressed: _saveUserInfo,
                icon: const Icon(Icons.save),
                label: const Text("Save Changes"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.background,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
