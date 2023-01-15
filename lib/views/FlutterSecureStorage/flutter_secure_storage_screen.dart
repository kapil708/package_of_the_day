import 'package:flutter/material.dart';
import 'package:package_of_the_day/views/FlutterSecureStorage/secure_storage.dart';

class FlutterSecureStorageScreen extends StatefulWidget {
  const FlutterSecureStorageScreen({Key? key}) : super(key: key);

  @override
  State<FlutterSecureStorageScreen> createState() => _FlutterSecureStorageScreenState();
}

class _FlutterSecureStorageScreenState extends State<FlutterSecureStorageScreen> {
  TextEditingController txtName = TextEditingController();
  String nameKey = "name_key";
  String nameListKey = "name_list_key";

  String savedName = "";
  List savedNameList = [];

  @override
  void initState() {
    // TODO: implement initState
    showData();
    super.initState();
  }

  void showData() async {
    var name = await SecureStorage().getValue(nameKey) ?? '';
    var nameList = await SecureStorage().getValue(nameListKey) ?? [];

    setState(() {
      savedName = name;
      savedNameList = nameList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Secure Storage"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: txtName,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      width: 1,
                      style: BorderStyle.solid,
                      color: Colors.grey,
                    ),
                  ),
                  hintText: "Name",
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      if (txtName.text.isNotEmpty) {
                        //Save to last name
                        await SecureStorage().setValue(nameKey, txtName.text);

                        //Get data from list
                        List nameList = await SecureStorage().getValue(nameListKey) ?? [];
                        nameList.insert(0, txtName.text);

                        //Save name to list
                        await SecureStorage().setValue(nameListKey, nameList);

                        var snackBar = const SnackBar(content: Text('Added successfully'));
                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);

                        txtName.clear();
                        showData();
                      }
                    },
                    child: const Text("Save Name"),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () async {
                      await SecureStorage().deleteValue(nameKey);
                      await SecureStorage().deleteValue(nameListKey);

                      txtName.clear();

                      showData();
                    },
                    child: const Text("Clear All Data"),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(8),
                width: MediaQuery.of(context).size.width,
                color: Colors.grey.withOpacity(0.4),
                child: const Text(
                  "Last Name",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                savedName,
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(8),
                width: MediaQuery.of(context).size.width,
                color: Colors.grey.withOpacity(0.4),
                child: const Text(
                  "Name List",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 10),
              ...savedNameList.map((name) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    "$name",
                    style: const TextStyle(fontSize: 20),
                  ),
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
