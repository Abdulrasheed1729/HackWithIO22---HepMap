import 'package:flutter/material.dart';
import 'package:hack_with_io/main.dart';
import 'package:hack_with_io/modules/user_record/services/storage/local_storage.dart';
import 'package:hack_with_io/modules/user_record/user_record.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  late TextEditingController _nameController;
  late TextEditingController _userNameController;
  late TextEditingController _idController;

  User? user;

  late Box<User> userBox = Hive.box('user_record');

  @override
  void initState() {
    _nameController = TextEditingController();
    _userNameController = TextEditingController();
    _idController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25.0,
          vertical: 15.0,
        ),
        child: Column(
          children: [
            TextField(
              controller: _idController,
              decoration: InputDecoration(
                labelText: 'id',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            TextField(
              controller: _userNameController,
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            const SizedBox(height: 15.0),
            ElevatedButton(
              onPressed: () {
                User user = User(
                  id: _idController.text,
                  name: _nameController.text,
                  username: _userNameController.text,
                );
                getIt.get<UserLocalStorageApi>().updateUser(userBox, user);
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
