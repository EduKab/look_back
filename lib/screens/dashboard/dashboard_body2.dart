import 'package:cool_alert/cool_alert.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:look_back/models/product_model.dart';

class DashboardBody2 extends StatefulWidget {
  const DashboardBody2({super.key});

  @override
  State<DashboardBody2> createState() => _DashboardBody2State();
}

class _DashboardBody2State extends State<DashboardBody2> {
  
  Future<List<Product>> read() async {
    Dio dio = Dio();
    dio.interceptors.add(DioCacheManager(CacheConfig(baseUrl: "http://www.google.com'https://firestore.googleapis.com/")).interceptor);
    final response = await dio.get('https://firestore.googleapis.com/v1/projects/look-back-90825/databases/(default)/documents/products/', options: buildCacheOptions(Duration(days: 7)),);
    var listJSON = response.data['documents'] as List;
    print(listJSON);
    if( response.statusCode == 200 ){
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
  
    return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              FutureBuilder(
                  future: read(),
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
                                  child: 
                                  CachedNetworkImage(
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
                  })
            ],
          ),
        ),
      );
  }

}