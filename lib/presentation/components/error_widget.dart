import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_buzz/logic/data_bloc/data_bloc.dart';
import 'package:movie_buzz/logic/data_bloc/data_event.dart';

// ignore: must_be_immutable
class CommonErrorWidget extends StatelessWidget {
  const CommonErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 300,
        width: 300,
        child: Card(
          color: Colors.white,
          elevation: 10,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error, color: Colors.red),

              Text("something went wrong", style: TextStyle(fontSize: 20)),
              SizedBox(height: 20),

              ElevatedButton(
                onPressed: () async {
                  context.read<DataBloc>().add(FetchDataEvent());
                },
                child: Text("retry"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
