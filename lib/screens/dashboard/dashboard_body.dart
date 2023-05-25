import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:look_back/models/product_model.dart';

class DashboardTop extends StatelessWidget {
  const DashboardTop({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          "List available products",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        // SizedBox(height: 16),
      ],
    );
  }
}

class DashboardBody extends StatefulWidget {
  const DashboardBody({super.key, required this.data});

  final List<String?> data;

  @override
  State<DashboardBody> createState() => _DashboardBodyState();
}

class _DashboardBodyState extends State<DashboardBody> {
  @override
  void initState() {
    super.initState();
  }

  Stream<List<Product>> readProducts() => FirebaseFirestore.instance
      .collection('products')
      .snapshots()
      .map((event) =>
          event.docs.map((e) => Product.fromJson(e.data())).toList());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StreamBuilder(
          stream: readProducts(),
          builder: (context, snapshot) {
            if(snapshot.hasData){
              return GridView.builder(
                scrollDirection: Axis.vertical,
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
                      Image.network(snapshot.data![index].url),
                      Text('\$${snapshot.data![index].price}'),
                    ],
                  );
                }
              );
            }else{
              return const CircularProgressIndicator();
            }
          }
        ),
      ],
    );
  }
}
