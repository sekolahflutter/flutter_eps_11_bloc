import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'detail.dart';
import 'user_bloc/user_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    context.read<UserBloc>().add(GetUsersEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Belajar Flutter')),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state.status == StatuState.success) {
            return RefreshIndicator(
              onRefresh: () async {
                getData();
              },
              child: ListView(
                children: state.users
                    .map(
                      (e) => ListTile(
                        trailing: Image.network(e.avatar),
                        title: Text(e.name),
                        subtitle: Text(e.email),
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => DetailUserPage(id: e.id),
                            ),
                          );
                        },
                      ),
                    )
                    .toList(),
              ),
            );
          } else {
            return const LinearProgressIndicator();
          }
        },
      ),
    );
  }
}
