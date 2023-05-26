import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'detail_bloc/detail_bloc.dart';

class DetailUserPage extends StatefulWidget {
  const DetailUserPage({super.key, required this.id});

  final int id;

  @override
  State<DetailUserPage> createState() => _DetailUserPageState();
}

class _DetailUserPageState extends State<DetailUserPage> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() {
    context.read<DetailBloc>().add(GetDetailEvent(widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail User')),
      body: BlocBuilder<DetailBloc, DetailState>(
        builder: (context, state) {
          if (state is SuccessDetail) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(state.user.avatar),
                  Text(state.user.name),
                  Text(state.user.email),
                ],
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
