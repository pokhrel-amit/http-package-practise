import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http_implementation/model/fact_response.dart';
import 'package:http_implementation/services/fact_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('network apis'),
      ),
      body: Center(
        child: FutureBuilder(
            future: albumResponse(),
            builder: ((context, snapshot) {
              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                throw SocketException(snapshot.error.toString());
              } else {
                FactResponse factResponse = snapshot.data as FactResponse;

                return ListView.builder(
                  itemCount: factResponse.facts.length,
                  itemBuilder: ((context, index) {
                    return Text(
                      '$index.${factResponse.facts[index].description}\n',
                      style: TextStyle(fontSize: 50),
                    );
                  }),
                );
              }
            })),
      ),
    );
  }
}
