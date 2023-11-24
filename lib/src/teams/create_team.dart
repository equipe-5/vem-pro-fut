import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vem_pro_fut_app/src/commons/components/header.dart';
import 'package:vem_pro_fut_app/src/commons/components/navbar.dart';
import 'package:vem_pro_fut_app/src/model/team.dart';
import 'package:vem_pro_fut_app/src/teams/view_teams.dart';

class CreateTeam extends StatefulWidget {
  const CreateTeam({super.key});

  @override
  State<CreateTeam> createState() => _CreateTeamState();
}

class _CreateTeamState extends State<CreateTeam> {
  File? _imageFile;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideBarDrawer(),
      appBar: const Header(title: 'Criar Time', subtitle: 'Chame seus amigos!'),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 80,
                backgroundImage:
                    _imageFile != null ? FileImage(_imageFile!) : null,
                child: _imageFile == null
                    ? const Icon(Icons.add_a_photo, size: 40)
                    : null,
              ),
            ),
            const SizedBox(height: 32.0),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Nome do Time',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: 'Descricão do Time',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            Container(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton.icon(
                onPressed: () {
                  _addTeam();
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text(
                        'Time Criado!',
                        textAlign: TextAlign.center,
                      ),
                      content:
                          const Text('Clique para copiar o link de convite'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'OK'),
                          child: const Text('Copiar'),
                        ),
                      ],
                    ),
                  );
                },
                icon: const Icon(Icons.add),
                label: const Text('Criar Time'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  foregroundColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showEmptyFieldAlert(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Verifique as informações'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the alert
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _addTeam() {
    if (_nameController.text.isEmpty || _descriptionController.text.isEmpty) {
      return showEmptyFieldAlert(context, 'Todos os campos são obrigatórios');
    }

    Team team = Team(IdTeam, _nameController.text, _descriptionController.text);

    teams.add(team);
    IdTeam += 1;

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const ViewTeams()));
  }
}
