import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vem_pro_fut_app/src/commons/components/header.dart';
import 'package:vem_pro_fut_app/src/commons/components/navbar.dart';
import 'package:vem_pro_fut_app/src/matches/future_matches.dart';
import 'package:vem_pro_fut_app/src/model/match.dart';

class CreateMatch extends StatefulWidget {
  const CreateMatch({super.key});

  @override
  State<CreateMatch> createState() => _CreateMatchState();
}

class _CreateMatchState extends State<CreateMatch> {
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _startTimeController = TextEditingController();
  final TextEditingController _endTimeController = TextEditingController();
  final TextEditingController _maxLimitController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideBarDrawer(),
      appBar: const Header(
          title: 'Criar Partida', subtitle: 'Crie suas próprias partidas'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.start, // Align components centrally
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Nome da Partida'),
            ),
            const SizedBox(height: 16.0),
            TextField(
                controller: _dateController,
                keyboardType: TextInputType.datetime,
                decoration: const InputDecoration(
                    labelText: 'Data',
                    suffixIcon: Icon(Icons.calendar_today),
                    border: OutlineInputBorder()),
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (pickedDate != null) {
                    String formattedDate =
                        DateFormat('dd/MM/yyyy').format(pickedDate);
                    setState(() {
                      _dateController.text = formattedDate;
                    });
                  }
                }),
            const SizedBox(height: 16.0),
            TextField(
              controller: _startTimeController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                labelText: 'Hora de Inicio',
                suffixIcon: Icon(Icons.access_time),
                border: OutlineInputBorder(),
              ),
              onTap: () async {
                TimeOfDay? pickedTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (pickedTime != null) {
                  // ignore: use_build_context_synchronously
                  String formattedTime = pickedTime.format(context);
                  setState(() {
                    _startTimeController.text = formattedTime;
                  });
                }
              },
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _endTimeController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                labelText: 'Hora de término',
                suffixIcon: Icon(Icons.access_time),
                border: OutlineInputBorder(),
              ),
              onTap: () async {
                TimeOfDay? pickedTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (pickedTime != null) {
                  // ignore: use_build_context_synchronously
                  String formattedTime = pickedTime.format(context);
                  setState(() {
                    _endTimeController.text = formattedTime;
                  });
                }
              },
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                const Text(
                  'Limite máximo de jogadores:',
                  style: TextStyle(fontSize: 16.0),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: TextField(
                    controller: _maxLimitController,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Observações'),
            ),
            const SizedBox(height: 24.0),
            const Text(
              "Selecione o Local",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            ButtonTheme(
              minWidth: 1000.0, // Set the minimum width of the button
              height: 50.0,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Selecionar No Mapa'),
              ),
            ),
            const SizedBox(height: 32.0),
            Container(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton.icon(
                onPressed: () {
                  _addMatch();
                },
                icon: const Icon(Icons.add),
                label: const Text('Criar Partida'),
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

  void _addMatch() {
    if (_nameController.text.isEmpty ||
        _dateController.text.isEmpty ||
        _startTimeController.text.isEmpty ||
        _endTimeController.text.isEmpty ||
        _maxLimitController.text.isEmpty) {
      return showEmptyFieldAlert(context, 'Todos os campos são obrigatórios');
    }

    if (DateFormat('dd/MM/yyyy').parse(_dateController.text).isBefore(
        DateFormat('yyyy-MM-dd')
            .parse(DateTime.now().toString().split(' ')[0]))) {
      return showEmptyFieldAlert(
          context, 'Não é possível voltar no tempo!! verifique sua data');
    }

    Match match = Match(
        _nameController.text,
        _dateController.text,
        _startTimeController.text,
        _endTimeController.text,
        int.parse(_maxLimitController.text),
        _descriptionController.text,
        1,
        'Admin',
        IdMatches);

    futureMatches.add(match);
    IdMatches += 1;

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const FutureMatches()));
  }
}
