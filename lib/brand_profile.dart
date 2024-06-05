import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';

class BrandProfile extends StatefulWidget {
  @override
  _BrandProfileState createState() => _BrandProfileState();
}

class _BrandProfileState extends State<BrandProfile> {
  final TextEditingController _nameController = TextEditingController();
  String _selectedCategory = 'Deporte';
  File? _profileImage;
  List<File> _galleryImages = [];
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final List<Map<String, dynamic>> _categories = [
    {'name': 'Deporte', 'icon': FontAwesomeIcons.futbol},
    {'name': 'Entretenimiento', 'icon': FontAwesomeIcons.film},
    {'name': 'Humor', 'icon': FontAwesomeIcons.laugh},
    {'name': 'Belleza', 'icon': FontAwesomeIcons.palette},
    {'name': 'Tecnologías', 'icon': FontAwesomeIcons.laptop},
    {'name': 'Gastronomía', 'icon': FontAwesomeIcons.utensils},
    {'name': 'Música', 'icon': FontAwesomeIcons.music},
  ];

  Future<void> _pickImage(ImageSource source, {bool isProfile = false}) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        if (isProfile) {
          _profileImage = File(pickedFile.path);
          _uploadImage(_profileImage!, isProfile: true);
        } else {
          final File image = File(pickedFile.path);
          _galleryImages.add(image);
          _uploadImage(image);
        }
      });
    }
  }

  Future<void> _uploadImage(File image, {bool isProfile = false}) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        throw Exception("No user is signed in.");
      }
      String userId = user.uid;
      final ref = FirebaseStorage.instance
          .ref()
          .child('user_images')
          .child(userId)
          .child(DateTime.now().toIso8601String() + '.jpg');
      await ref.putFile(image);
      final url = await ref.getDownloadURL();

      final userDoc = _firestore.collection('users').doc(userId);

      if (isProfile) {
        await userDoc.set({'profileImage': url}, SetOptions(merge: true));
      } else {
        await userDoc.set({
          'galleryImages': FieldValue.arrayUnion([url])
        }, SetOptions(merge: true));
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 133, 25, 240), // Fondo morado
      appBar: AppBar(
        title: Text('Perfil de Marca'),
        backgroundColor: const Color.fromARGB(255, 255, 214, 90), // Fondo amarillo
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => _pickImage(ImageSource.gallery, isProfile: true),
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white24,
                  backgroundImage: _profileImage != null ? FileImage(_profileImage!) : null,
                  child: _profileImage == null
                      ? Icon(Icons.add_a_photo, color: Colors.white, size: 50)
                      : null,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: 'Introduce tu nombre',
                  hintStyle: const TextStyle(color: Colors.white70),
                  filled: true,
                  fillColor: Colors.white24,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: _selectedCategory,
                items: _categories.map((category) {
                  return DropdownMenuItem<String>(
                    value: category['name'],
                    child: Row(
                      children: [
                        FaIcon(category['icon'], color: Colors.white),
                        const SizedBox(width: 10),
                        Text(category['name']),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedCategory = newValue!;
                  });
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white24,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: const TextStyle(color: Colors.white),
                dropdownColor: Colors.purple[800],
              ),
              const SizedBox(height: 20),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: _galleryImages.length + 1,
                itemBuilder: (context, index) {
                  if (index == _galleryImages.length) {
                    return GestureDetector(
                      onTap: () => _pickImage(ImageSource.gallery),
                      child: Container(
                        color: Colors.white24,
                        child: Icon(Icons.add, color: Colors.white, size: 50),
                      ),
                    );
                  } else {
                    return Image.file(_galleryImages[index], fit: BoxFit.cover);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
