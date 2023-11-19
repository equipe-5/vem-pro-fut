import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreateMatch extends StatefulWidget {
  const CreateMatch({super.key});

  @override
  State<CreateMatch> createState() => _CreateMatchState();
}

class _CreateMatchState extends State<CreateMatch> {
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar Partida'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.start, // Align components centrally
          children: [
            const TextField(
              decoration: InputDecoration(labelText: 'Nome da Partida'),
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
              controller: _timeController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                labelText: 'Hora',
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
                    _timeController.text = formattedTime;
                  });
                }
              },
            ),
            const SizedBox(height: 16.0),
            const Row(
              children: [
                Text(
                  'Limite máximo de jogadores:',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            const TextField(
              decoration: InputDecoration(labelText: 'Observações'),
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
            ButtonTheme(
              // Set the minimum width of the button to match the screen width
              height: 50.0, // Set the height of the button
              child: ElevatedButton.icon(
                onPressed: () {
                  return;
                },
                icon: const Icon(Icons.add),
                label: const Text('Criar Partida'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(0), // Set the button shape
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
