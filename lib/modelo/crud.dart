import 'package:flutter/material.dart';
import 'package:ola/modelo/db_helper.dart';

class Crud {
  List<Map<String, dynamic>> _allData = [];

  bool _isLoading = true;

  Future<void> _addData() async {
    await SQLHelper.createData(_titleController.text, _descController.text);
  }

  Future<void> _updateData(int id) async {
    await SQLHelper.updateData(id, _titleController.text, _descController.text);
  }

  void _deleteData(int id) async {
    await SQLHelper.deleteData(id);
  }

  final TextEditingController _titleController =
      TextEditingController(); //agregar en constructor
  final TextEditingController _descController =
      TextEditingController(); //agregar en constructor

  void showBottomSheet(int? id) async {
    if (id != null) {
      final existingData =
          _allData.firstWhere((element) => element['id'] == id);
      _titleController.text = existingData['title'];
      _descController.text = existingData['desc'];
    }
  }
}
