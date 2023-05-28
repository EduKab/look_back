import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';

import '../../models/product_model.dart';

class DashboardBody2 extends StatefulWidget {
  const DashboardBody2({super.key});

  @override
  State<DashboardBody2> createState() => _DashboardBody2State();
}

class _DashboardBody2State extends State<DashboardBody2> {
  Stream<List<Product>> readProducts() => FirebaseFirestore.instance
      .collection('products')
      .snapshots()
      .map((event) =>
          event.docs.map((e) => Product.fromJson(e.data())).toList());
          
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              StreamBuilder(
                  stream: readProducts(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return GridView.builder(
                          physics: const ScrollPhysics(),
                          shrinkWrap: true,
                          padding: const EdgeInsets.all(7),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: .8,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Text(snapshot.data![index].name),
                                InkWell(
                                  child: Image.network(
                                    snapshot.data![index].url,
                                    fit: BoxFit.cover,
                                    height: 160,
                                    width: double.maxFinite,
                                  ),
                                  onTap: () {
                                    CoolAlert.show(
                                      context: context,
                                      type: CoolAlertType.info,
                                      title: snapshot.data![index].name,
                                      text: snapshot.data![index].desc,
                                      confirmBtnText: 'Accept',
                                    );
                                  },
                                ),
                                Text('\$${snapshot.data![index].price}'),
                              ],
                            );
                          });
                    } else {
                      return const CircularProgressIndicator();
                    }
                  })
            ],
          ),
        ),
      );
  }
}