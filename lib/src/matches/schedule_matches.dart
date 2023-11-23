import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class ScheduleMatches extends StatefulWidget {
  const ScheduleMatches({super.key});

  @override
  State<ScheduleMatches> createState() => _ScheduleMatchesState();
}

class _ScheduleMatchesState extends State<ScheduleMatches> {
  TextEditingController _dataController = TextEditingController();
  TextEditingController _horaController = TextEditingController();
  final List<String> _estados = [
    'Paraná',
    'Santa Catarina',
    'Rio Grande do Sul',
    'Rio de Janeiro',
    'Minas Gerais',
    'Ceará',
    'Espirito Santo',
    'Bahia',
    'Pernambuco',
  ];
  final List<String> _cidades = [
    'Toledo',
    'Cascavel',
    'Porto Alegre',
    'Curitiba',
    'Florianópolis'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agendar Jogo'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        // Adicionando SingleChildScrollView aqui
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  child: const Column(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage('URL_TO_PROFILE_PICTURE'),
                      ),
                      SizedBox(height: 12),
                      Text(
                        'Nome do Jogo',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Column(
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      // Handle button click here
                    },
                    icon: const Icon(Icons.people),
                    label: const Text('Ver Participantes'),
                  ),
                  const SizedBox(height: 64.0),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                        controller: _dataController,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Selecione uma data',
                          icon: Icon(Icons.calendar_today),
                        ),
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1950),
                            lastDate: DateTime(2100),
                          );
                          if (pickedDate != null) {
                            String formattedDate =
                                DateFormat('dd/MM/yyyy').format(pickedDate);
                            setState(() {
                              _dataController.text = formattedDate;
                            });
                          }
                        }),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                        controller: _horaController,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Selecione uma hora',
                          icon: Icon(Icons.access_time),
                        ),
                        onTap: () async {
                          TimeOfDay? pickedTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                          if (pickedTime != null) {
                            setState(() {
                              _horaController.text = pickedTime.format(context);
                            });
                          }
                        }),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                readOnly: false,
                decoration: const InputDecoration(
                  labelText: 'Observações',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),
              Container(
                margin: const EdgeInsets.only(bottom: 16.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: TextFormField(
                        readOnly: false,
                        decoration: const InputDecoration(
                          labelText: 'Endereço',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      flex: 1,
                      child: TextField(
                        decoration: const InputDecoration(
                          labelText: "Número",
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ], // Only numbers can be entered
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 16.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: TextFormField(
                        readOnly: false,
                        decoration: const InputDecoration(
                          labelText: 'Cidade',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      flex: 1,
                      child: TextField(
                        decoration: const InputDecoration(
                          labelText: "Estado",
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ], // Only numbers can be entered
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton.icon(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Confirmar Agendamento'),
                        content: const Text(
                            'Tem certeza que deseja agendar este jogo?'),
                        actions: [
                          TextButton(
                            onPressed: () {},
                            child: const Text('Cancelar'),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text('Confirmar'),
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: const Icon(Icons.calendar_today),
                label: const Text('Agendar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
