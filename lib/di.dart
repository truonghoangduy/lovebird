import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lovebird/blocs/authentication/authentication_bloc.dart';
import 'package:lovebird/blocs/scan/bloc/scan_bloc.dart';
import 'package:lovebird/services/auth/authenticaiton_repository.dart';
import 'package:lovebird/services/auth/providers/authentication_firebase_provider.dart';
import 'package:lovebird/services/auth/providers/google_sign_in_provider.dart';

class DependecyProvider extends StatefulWidget {
  final Widget child;
  const DependecyProvider({Key? key, required this.child}) : super(key: key);

  @override
  _DependecyProviderState createState() => _DependecyProviderState();
}

class _DependecyProviderState extends State<DependecyProvider> {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      lazy: false,
      create: (context) => AuthenticationRepository(
        authenticationFirebaseProvider: AuthenticationFirebaseProvider(
          firebaseAuth: FirebaseAuth.instance,
        ),
        googleSignInProvider: GoogleSignInProvider(
          googleSignIn: GoogleSignIn(),
        ),
      ),
      child: MultiBlocProvider(providers: [
        BlocProvider(
            lazy: false,
            create: (context) {
              return AuthenticationBloc(
                  authenticationRepository:
                      RepositoryProvider.of<AuthenticationRepository>(context));
            }),
        BlocProvider(
            lazy: false,
            create: (context) {
              return ScanBloc(
                  authenticationBloc:
                      BlocProvider.of<AuthenticationBloc>(context));
            })
      ], child: widget.child),
    );
  }
}
