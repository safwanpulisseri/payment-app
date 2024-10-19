import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../controller/user_store.dart';


class PaymentScreen extends StatelessWidget {
  final UserStore store = UserStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Payments"),
      ),
      body: Observer(
  builder: (_) {
    if (store.users.isEmpty) {
      // While loading, show CircularProgressIndicator
      return Center(child: CircularProgressIndicator());
    }

    // If no users are loaded after fetching, show error
    if (store.users.isEmpty && store.users == null) {
      return Center(child: Text("No users found or error occurred."));
    }

    return ListView(
      children: store.users.map((user) {
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(user.profilePictureUrl),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: user.paymentAmount != 2500 ? Colors.green : Colors.transparent,
                  width: 2,
                ),
              ),
            ),
          ),
          title: Text(user.name),
          subtitle: Text("Amount: ${user.paymentAmount}"),
          trailing: DropdownButton<String>(
            value: user.paymentMethod,
            items: ['Cash', 'UPI'].map((method) {
              return DropdownMenuItem(value: method, child: Text(method));
            }).toList(),
            onChanged: (newMethod) {
              store.updatePayment(user, newMethod!, user.paymentAmount);
            },
          ),
        );
      }).toList(),
    );
  },
),

      floatingActionButton: FloatingActionButton(
        onPressed: store.addVisitor,
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: ElevatedButton(
        onPressed: store.clearAllData,
        child: Text("Clear All"),
      ),
    );
  }
}