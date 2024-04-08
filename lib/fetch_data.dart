import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FetchData extends StatefulWidget {
  const FetchData({super.key});

  @override
  State<FetchData> createState() => _FetchDataState();
}

class _FetchDataState extends State<FetchData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fetch Data", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: StreamBuilder(
          stream:FirebaseFirestore.instance.collection("Products").snapshots(),
          builder: (context, snapshot) {
          if(ConnectionState.waiting == snapshot.connectionState){
            return Center(
                child: CircularProgressIndicator()
            );
          }

          if(snapshot.hasError){
            return Center(
              child: Text("There might be a issue"),
            );
          }

          if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(20),
                  child: Card(
                    elevation: 7,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Image(
                            image: NetworkImage('${snapshot.data!.docs[index]['image']}'
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 20,
                                width: 20,
                                child: Text('${snapshot.data!.docs[index]['ProductName']}'),
                              ),
                              SizedBox(
                                height: 20,
                                width: 20,
                                child: Text('${snapshot.data!.docs[index]['ProductPrice']}'),
                              ),
                              SizedBox(
                                height: 20,
                                width: 20,
                                child: Text('${snapshot.data!.docs[index]['ProductCategory']}'),
                              ),
                            ],
                          ),
                          TextButton(
                              onPressed: (){}, child: Text("Add To Cart"))
                        ],
                      ),
                    ) ,
                  ),
                );
              },
            );
          }
          return Container();
        },
        ),
      ),
    );
  }
}
