import 'package:flutter/material.dart';
import 'package:new_gen_note/addNotes.dart';
import 'package:new_gen_note/editNotes.dart';
import 'package:new_gen_note/login.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, String>> notes = [
    {"title": "Flutter Basics", "description": "Learn about widgets, state, and UI in Flutter."},
    {"title": "Dart Programming", "description": "Understand Dart syntax and programming concepts."},
    {"title": "Firebase Integration", "description": "How to connect Flutter with Firebase services."},
  ];

  void updateNote(int index, String newTitle, String newDescription) {
    setState(() {
      notes[index]["title"] = newTitle;
      notes[index]["description"] = newDescription;
    });
  }

  void _logout() {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Notes",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
        backgroundColor: Colors.orangeAccent,
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.black),
            onPressed: _logout,
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orange.shade200, Colors.orange.shade400],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) {
              return Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                color: Colors.white,
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  title: Text(
                    notes[index]["title"]!,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
                  ),
                  subtitle: Text(notes[index]["description"]!, style: const TextStyle(color: Colors.black)),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.black),
                    onPressed: () {
                      setState(() {
                        notes.removeAt(index);
                      });
                    },
                  ),
                  onTap: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditNotePage(
                          title: notes[index]["title"]!,
                          description: notes[index]["description"]!,
                          index: index,
                        ),
                      ),
                    );
                    if (result != null) {
                      updateNote(index, result["title"], result["description"]);
                    }
                  },
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow[700],
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddNotePage()),
          );

          if (result != null) {
            setState(() {
              notes.add(result);
            });
          }
        },
        child: const Icon(Icons.add, size: 30, color: Colors.black),
      ),
    );
  }
}