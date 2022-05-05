import 'package:flutter/material.dart';

class Loader extends StatefulWidget {
  final Future<bool> Function() loader;
  final Widget child;

  const Loader({
    Key? key,
    required this.loader,
    required this.child,
  }) : super(key: key);

  @override
  createState() => _LoaderState();
}

class _LoaderState extends State<Loader> {
  late Future<bool> Function() loader;

  @override
  void initState() {
    super.initState();

    loader = widget.loader;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      alignment: Alignment.center,
      child: FutureBuilder<bool>(
        future: loader(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const CircularProgressIndicator();
          } else if (snapshot.data ?? false) {
            return Center(
              child: Column(
                children: [
                  const Text('Falha ao carregar os dados para visualização!'),
                  ElevatedButton(
                    child: const Text('Tentar novamente'),
                    onPressed: () => setState(() => loader = widget.loader),
                  ),
                ],
              ),
            );
          } else {
            return widget.child;
          }
        },
      ),
    );
  }
}
