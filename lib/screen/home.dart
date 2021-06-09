import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'form_input.screen.dart';
import 'home.viewmodel.dart';

class FormScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    final vm = watch(homeViewModel);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (c) => FormInput(),
            ),
          );
        },
      ),
      appBar: AppBar(
        title: Text("Forms Data"),
        actions: [
          InkWell(
            onTap: () async {
              final canExport = await vm.checkPermissions();
              if (canExport) {
                vm.exportCsv();
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  "Export to Csv",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      body: StreamBuilder(
        stream: vm.db.watchAllForms(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final list = snapshot.data as List;

            return ListView.builder(
              itemCount: list.length,
              itemBuilder: (c, i) {
                final item = list[i];
                return Card(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${item.id}"),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("First Name: ${item.firstName}"),
                            Text("Last Name: ${item.lastName}"),
                            Text("Gender: ${item.gender ? 'Male' : 'Female'}"),
                            Text("Phone Number: ${item.phoneNumber}"),
                            Text("Address: ${item.address}"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ));
              },
            );
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
