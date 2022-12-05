import 'package:flutter/material.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  // variaveis
  TextEditingController _textEditingController = TextEditingController();
  List<String> tarefas = [];

  addText(text) {
    setState(() {
      tarefas.add(text);
    });
  }

  clearTarefas() {
    setState(() {
      tarefas.clear();
    });
  }

  removeTarefa(index) {
    setState(() {
      tarefas.removeAt(index);
      print("Removendo:" + index.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tarefas'),
      ),
      body: Container(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(
              controller: _textEditingController,
            ),
            Container(
              height: 400,
              child: ListView.separated(
                separatorBuilder: (context, index) => const Divider(),
                itemCount: tarefas.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(tarefas[index]),
                    onLongPress: () {
                      removeTarefa(index);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.green,
            onPressed: () {
              if (_textEditingController.text.length > 0) {
                addText(_textEditingController.text);
                _textEditingController.clear();
              }
              print(tarefas);
            },
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            backgroundColor: Colors.red,
            onPressed: () {
              if (tarefas.length > 0) {
                clearTarefas();
              }
            },
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
