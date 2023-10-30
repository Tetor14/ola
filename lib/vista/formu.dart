import 'package:flutter/material.dart';
import 'package:ola/modelo/objeto.dart';
import 'package:ola/vista/widgets/image_input.dart';

class Formu extends StatefulWidget {
  const Formu({super.key});

  @override
  State<Formu> createState() => _FormuState();
}

class _FormuState extends State<Formu> {
  //Objeto objeto = Objeto(id: 0, titulo: '', descripcion: '');
  //List<Objeto> objetos = [];
  final formkey = GlobalKey<FormState>();
  int id = 0;
  var titulo = '';
  var descripcion = '';

  int plus() {
    id++;
    return id;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add')),
      body: Center(
          child: Form(
        key: formkey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const ImageInput(),
            const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Titulo"),
              onSaved: (value) {
                titulo = value!;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Introduce titulo';
                }
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              maxLines: 3,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Descripcion"),
              onSaved: (value) {
                descripcion = value!;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Introduce descripcion';
                }
              },
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                var form = formkey.currentState;
                if (form!.validate()) {
                  form.save();
                  Navigator.of(context).pop(Objeto(
                      id: plus(),
                      titulo: titulo,
                      descripcion: descripcion,
                      estado: true));
                }
              },
              style:
                  ElevatedButton.styleFrom(padding: const EdgeInsets.all(15)),
              child: const Text("Agregar"),
            )
          ],
        ),
      )),
    );
  }
}
