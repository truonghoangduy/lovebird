import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lovebird/blocs/scan/bloc/scan_bloc.dart';
import 'package:lovebird/config/styles/color.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({Key? key}) : super(key: key);

  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<ScanBloc>().add(ScanStartEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.tiffany,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Text(
              "Tìm kiếm tình yêu",
              textAlign: TextAlign.center,
            ),
            IconButton(
              onPressed: () => {context.read<ScanBloc>().add(ScanStartEvent())},
              icon: const Icon(Icons.replay_rounded),
              color: Colors.red,
            ),
          ],
        ),
      ),
      body: BlocConsumer<ScanBloc, ScanState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is ScanResult) {
            return Column(
              children: state.scanResult
                  .map((e) => Text(e.geoFirePoint!.latitude.toString()))
                  .toList(),
            );
          }

          //   child: Image.network(
          // "https://media.giphy.com/media/3oriNO0p3Sn0itamg8/giphy.gif%22)",
          return Stack(children: [
            Center(
                child: Image.network(
                    "https://media.giphy.com/media/3oriNO0p3Sn0itamg8/giphy.gif"))
          ]);
        },
      ),
    );
  }
}
