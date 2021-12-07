import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lovebird/blocs/scan/bloc/scan_bloc.dart';
import 'package:lovebird/config/styles/color.dart';
import 'package:lovebird/pages/bio/bio_screen.dart';
import 'package:lovebird/pages/match/match_screen.dart';

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
    return BlocConsumer<ScanBloc, ScanState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.tiffany,
            title: const Text(
              "Tìm kiếm tình yêu",
              textAlign: TextAlign.center,
            ),
          ),
          body: Stack(
            children: [
              Container(
                alignment: Alignment.center,
                child: Container(),
              )
            ],
          ),
        );
      },
    );
  }
}
