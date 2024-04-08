import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FetchImage extends StatefulWidget {
  const FetchImage({super.key});

  @override
  State<FetchImage> createState() => _FetchImageState();
}

class _FetchImageState extends State<FetchImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Fetch Images"),
          centerTitle: true,
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("Persons").snapshots(),
          builder: (context, snapshot) {
            if (ConnectionState.waiting == snapshot.connectionState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.hasError) {
              return Center(
                child: Text("there is some issue with the server"),
              );
            }

            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: snapshot.data!.docs[index]['image'] != null ? Image(
                        image: NetworkImage('${snapshot.data!.docs[index]['image']}'),
                        width: 200,
                        height: 200) : Image.asset("images/Git-Error.png", width: 200, height: 200),
                  );
                },
              );
            }

            return Container();
          },
        )
    );
  }
}
