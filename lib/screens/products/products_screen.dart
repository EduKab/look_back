import 'package:cool_alert/cool_alert.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:look_back/models/product_model.dart';

DioCacheManager? _dioCacheManager;

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  Future<List<Product>> read() async {
    Dio dio = Dio();
    _dioCacheManager = DioCacheManager(CacheConfig(
      baseUrl: "http://www.google.com'https://firestore.googleapis.com/")
    );
    dio.interceptors.add(_dioCacheManager!.interceptor);
    final response = await dio.get(
      'https://firestore.googleapis.com/v1/projects/look-back-90825/databases/(default)/documents/products/',
      options: buildCacheOptions(const Duration(days: 7), forceRefresh: true),
    );
    var listJSON = response.data['documents'] as List;
    print(listJSON);
    if (response.statusCode == 200) {
      return listJSON.map((product) => Product.fromMap(product)).toList();
    }
    return List.empty();
  }

  /*Stream<List<Product>> readProducts(){

    return FirebaseFirestore.instance
      .collection('products')
      .snapshots()
      .map((event) =>
          event.docs.map((e) => Product.fromJson(e.data())).toList());
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop'),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.pink,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() async {
          Navigator.pushNamed(context, '/addProduct').then((value) async {
            print('cache limpiado');
            await _dioCacheManager!.clearAll();
            setState(() { });
          });
        }),
        child: const Icon(Icons.add_outlined),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              StreamBuilder(
                stream: Stream.fromFuture(read()),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return GridView.builder(
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(7),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: .8,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Text(
                                snapshot.data![index].name,
                                overflow: TextOverflow.ellipsis,
                              ),
                              InkWell(
                                child: CachedNetworkImage(
                                  imageUrl: snapshot.data![index].url,
                                  fit: BoxFit.cover,
                                  height: 140,
                                  width: double.maxFinite,
                                ),
                                /*Image.network(
                                      snapshot.data![index].url,
                                      fit: BoxFit.cover,
                                      height: 160,
                                      width: double.maxFinite,
                                    ),*/
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
                },
              )
            ],
          ),
        ),
      ),
    );



    
  }
}
