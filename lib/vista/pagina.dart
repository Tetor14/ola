import 'package:flutter/material.dart';
import 'package:ola/modelo/objeto.dart';
import 'package:ola/vista/formu.dart';
import 'package:ola/vista/widgets/ficha.dart';

class Pagina extends StatefulWidget {
  const Pagina({super.key});

  @override
  State<Pagina> createState() => _PaginaState();
}

class _PaginaState extends State<Pagina> {
  /*List<Map<String, dynamic>> _allData = [];

  bool _isLoading = true;

  void _refreshData() async {
    final data = await SQLHelper.getAllData();
    setState(() {
      _allData = data;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshData();
  }

  Future<void> _addData() async {
    await SQLHelper.createData(_titleController.text, _descController.text);
    _refreshData();
  }

  Future<void> _updateData(int id) async {
    await SQLHelper.updateData(id, _titleController.text, _descController.text);
    _refreshData();
  }

  void _deleteData(int id) async {
    await SQLHelper.deleteData(id);
    _refreshData();
  }

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  void showBottomSheet(int? id) async {
    if (id != null) {
      final existingData =
          _allData.firstWhere((element) => element['id'] == id);
      _titleController.text = existingData['title'];
      _descController.text = existingData['desc'];
    }
  }*/

  final List<Objeto> objetos = [];
  @override
  Widget build(BuildContext context) {
    Widget contenido = const Center(
      child: Text('No has agregado objetos aun'),
    );

    if (objetos.isNotEmpty) {
      contenido = Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: objetos.length,
          itemBuilder: (context, index) {
            final item = objetos[index];
            return Ficha(
                id: item.id,
                titulo: item.titulo,
                descripcion: item.descripcion,
                estado: item.estado);
          },
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Prueba')),
      body: contenido,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final nuevo = await Navigator.of(context).push<Objeto>(
              MaterialPageRoute(builder: (context) => const Formu()));
          if (nuevo == null) {
            return;
          }
          objetos.add(nuevo);
        },
        //backgroundColor: Colors.indigo,
        child: const Icon(Icons.add),
      ),
    );
  }
}
