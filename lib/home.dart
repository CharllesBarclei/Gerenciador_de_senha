import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

void main() => runApp(MaterialApp(
      title: 'Gerenciador de Senhas',
      home: PasswordManagerApp(),
    ));

class PasswordManagerApp extends StatefulWidget {
  @override
  _PasswordManagerAppState createState() => _PasswordManagerAppState();
}

class _PasswordManagerAppState extends State<PasswordManagerApp> {
  List<Service> services = [];
  List<Service> filteredServices = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerenciador de Senhas'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  filteredServices = filterServices(value);
                });
              },
              decoration: InputDecoration(
                labelText: 'Buscar por serviço',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredServices.length,
              itemBuilder: (context, index) {
                final service = filteredServices[index];
                return ListTile(
                  title: Text(service.name),
                  trailing: Icon(Icons.lock),
                  onTap: () {
                    _openServiceDetails(context, service);
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addNewService();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _addNewService() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final TextEditingController nameController = TextEditingController();
        final TextEditingController passwordController = TextEditingController();

        return AlertDialog(
          title: const Text('Adicionar Serviço'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Nome do Serviço',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                final String name = nameController.text;
                final String password = passwordController.text;
                if (name.isNotEmpty && password.isNotEmpty) {
                  setState(() {
                    services.add(Service(name, password));
                    filteredServices = services;
                  });
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Salvar'),
            ),
            TextButton(
              onPressed: () {
                final String name = nameController.text;
                final String password = _generateRandomPassword();
                if (name.isNotEmpty) {
                  setState(() {
                    services.add(Service(name, password));
                    filteredServices = services;
                  });
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Gerar Senha Aleatória'),
            ),
          ],
        );
      },
    );
  }

  void _openServiceDetails(BuildContext context, Service service) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final TextEditingController passwordController =
            TextEditingController(text: service.password);

        return AlertDialog(
          title: Text(service.name),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  service.password = passwordController.text;
                });
                Navigator.of(context).pop();
              },
              child: const Text('Salvar'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  services.remove(service);
                  filteredServices = services;
                });
                Navigator.of(context).pop();
              },
              child: const Text('Excluir'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  passwordController.text = _generateRandomPassword();
                  service.password = passwordController.text;
                });
              },
              child: const Text('Gerar Senha Aleatória'),
            ),
          ],
        );
      },
    );
  }

  List<Service> filterServices(String keyword) {
    if (keyword.isEmpty) {
      return services;
    }

    return services
        .where((service) =>
            service.name.toLowerCase().contains(keyword.toLowerCase()))
        .toList();
  }

  String _generateRandomPassword() {
    final password = randomAlphaNumeric(10);
    return password;
  }
}

class Service {
  final String name;
  String password;

  Service(this.name, this.password);
}
