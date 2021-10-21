import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController nombre = TextEditingController();
  TextEditingController usuario = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController correo = TextEditingController();
  TextEditingController nivel = TextEditingController();
  TextEditingController set = TextEditingController();
  final firebase = FirebaseFirestore.instance;
  create() async {
    try {
      await firebase.collection("usuarios").doc().set({
        "nombre": nombre.text,
        "usuario": usuario.text,
        "password": password.text,
        "correo": correo.text,
        "nivel": nivel.text,
        "set": set.text,
      });
    } catch (e) {
      print(e);
    }
  }

  update() async {
    try {
      firebase.collection("usuarios").doc(nombre.text).update({
        'usuario': usuario.text,
        'password': password.text,
        'correo': correo.text,
        'nivel': nivel.text,
        'set': set.text,
      });
    } catch (e) {
      print(e);
    }
  }

  delete() async {
    try {
      firebase.collection("User").doc(nombre.text).delete();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Parcial 3"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text("Formulario de Mantenimiento de usuarios"),
              SizedBox(
                height: 10,
              ),
              TextField(
                  controller: nombre,
                  decoration: InputDecoration(
                      labelText: "Nombre",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ))),
              SizedBox(
                height: 10,
              ),
              TextField(
                  controller: usuario,
                  decoration: InputDecoration(
                      labelText: "Usuario",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ))),
              SizedBox(
                height: 10,
              ),
              TextField(
                  controller: password,
                  decoration: InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ))),
              SizedBox(
                height: 10,
              ),
              TextField(
                  controller: correo,
                  decoration: InputDecoration(
                      labelText: "Correo",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ))),
              SizedBox(
                height: 10,
              ),
              TextField(
                  controller: nivel,
                  decoration: InputDecoration(
                      labelText: "Nivel",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ))),
              SizedBox(
                height: 10,
              ),
              TextField(
                  controller: set,
                  decoration: InputDecoration(
                      labelText: "Set",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ))),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      style:
                          TextButton.styleFrom(backgroundColor: Colors.green),
                      onPressed: () {
                        create();
                        nombre.clear();
                        usuario.clear();
                        password.clear();
                        correo.clear();
                        nivel.clear();
                        set.clear();
                      },
                      child: Text("Crear")),
                  ElevatedButton(
                      style:
                          TextButton.styleFrom(backgroundColor: Colors.amber),
                      onPressed: () {
                        update();
                        nombre.clear();
                        usuario.clear();
                        password.clear();
                        correo.clear();
                        nivel.clear();
                        set.clear();
                      },
                      child: Text("Actualizar")),
                  ElevatedButton(
                      style: TextButton.styleFrom(backgroundColor: Colors.red),
                      onPressed: () {
                        delete();
                        nombre.clear();
                        usuario.clear();
                        password.clear();
                        correo.clear();
                        nivel.clear();
                        set.clear();
                      },
                      child: Text("Borrar")),
                ],
              )
            ],
          ),
        ));
  }
}
