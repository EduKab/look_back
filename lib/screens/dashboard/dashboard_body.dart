import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Text('data'),
        FutureBuilder(
          future: FirebaseStorage.instance.ref().child("products").listAll(),
          builder: (context, AsyncSnapshot<ListResult> snapshot) {
            if (snapshot.hasData) {
              int i = snapshot.data!.items.length;
              return GridView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(7),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: .9,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10),
                  itemCount: i,
                  itemBuilder: (context, index) {
                    snapshot.data!.items[index].getMetadata().then((value) {
                      print('VALUE -> ${value.name}');
                    });
                    return FutureBuilder(
                      future: snapshot.data!.items[index].getDownloadURL(),
                      builder: (BuildContext context,
                          AsyncSnapshot<String> snapshot2) {
                        if (snapshot2.hasData) {
                          //return Text(snapshot2.data!);
                          return Image.network(snapshot2.data!);
                        } else {
                          return const CircularProgressIndicator();
                        }
                      },
                    );
                  });
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Ocurrio un error :('),
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ],
    );
  }
}
