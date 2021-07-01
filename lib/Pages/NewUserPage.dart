// import 'dart:io';
import 'dart:async';
import 'dart:io';
// import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:lets_roll/models/Api.dart';
import 'package:lets_roll/models/User.dart';
// import '../User.dart';

class NewUserPage extends StatefulWidget {
  NewUserPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _NewUserPageState createState() => _NewUserPageState();
}

class _NewUserPageState extends State<NewUserPage> {
  double height = 60.0;
  TextEditingController _user = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool _hidePassword = true;
  String _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NewUser'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          cadastrar(context);
        },
        child: Icon(Icons.save),
      ),
      body: Center(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(5.0),
              child: TextField(
                controller: _user,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                ),
                maxLength: 100,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: TextField(
                controller: _email,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
                maxLength: 100,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: TextField(
                controller: _password,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  suffix: InkWell(
                    child: Icon(_hidePassword
                        ? Icons.visibility_off
                        : Icons.visibility),
                    onTap: changeVisibilty,
                  ),
                ),
                maxLength: 100,
                obscureText: _hidePassword,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: _image == null
                  ? Center(
                      child: GestureDetector(
                        onTap: addPicture,
                        child: Wrap(
                          children: [
                            Icon(Icons.camera_alt),
                            Text("Nenhuma imagem selecionada"),
                          ],
                        ),
                      ),
                    )
                  : Image.network(_image),
            ),
          ],
        ),
      ),
    );
  }

  void changeVisibilty() {
    setState(() {
      _hidePassword = !_hidePassword;
    });
  }

  Future getImage(ImageSource source) async {
    // ignore: invalid_use_of_visible_for_testing_member
    var image = await ImagePicker.platform.pickImage(source: source);

    if (image != null) {
      setState(() {
        _image = image.path;
      });
    }
  }

  void cadastrar(BuildContext context) {
    //Salvar no banco
    if (_user.text == '' || _email.text == '' || _password.text == '')
      showError();
    // Api.insertUser(User(
    //   username: _user.text,
    //   email: _email.text,
    //   password: _password.text,
    //   profilePhoto: _image,
    // ));
    Navigator.pop(context);
  }

  void showError() {
    String erro = '';
    if (_user.text == '') erro += 'Usuário obrigatório\n\n';
    if (_email.text == '') erro += 'Email obrigatório\n\n';
    if (_password.text == '') erro += 'Senha obrigatório\n\n';
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Erro'),
        content: Text(erro),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void addPicture() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text("Camera"),
                onTap: () {
                  getImage(ImageSource.camera);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.image),
                title: Text("Galeria"),
                onTap: () {
                  getImage(ImageSource.gallery);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
