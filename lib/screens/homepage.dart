import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Widgets/user_item.dart';
import '../providers/user_provider.dart';
import 'details.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    UserProvider providerObject = UserProvider.getObject(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Random Users"),
        centerTitle: true,
      ),
      body: Consumer<UserProvider>(
        builder: (context, userProvider, child) {
          final result = userProvider.userData?.result;

          if (result == null) {
            providerObject.fetchUsers();
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.separated(
              itemCount: result.length,
              itemBuilder: (context, index) {
                final user = result[index];
                print("************************************************");
                print(user["image"]);
                print("************************************************");

                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => DetailsPage(
                          name: user["name"],
                          email: user["email"],
                          address: user["address"] ?? "Unknown",
                          image: user["image"],
                        ),
                      ),
                    );
                  },
                  child: UserItem(
                    name: user["name"],
                    email: user["email"],
                    image: user["image"],
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 10),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          providerObject.fetchUsers();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}