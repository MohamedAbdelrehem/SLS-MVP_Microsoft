import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sls_mvp_microsoft/constants.dart';
import 'package:sls_mvp_microsoft/core/utils/app_router.dart';
import 'package:sls_mvp_microsoft/features/authentication/data/services/firebase_services.dart';
import 'package:sls_mvp_microsoft/features/home/view_model/fetch_users_cubit/fetch_users_cubit.dart';
import 'package:sls_mvp_microsoft/features/home/view_model/signout_cubit/signout_cubit.dart';
import 'package:sls_mvp_microsoft/features/home/view_model/vehicles/vehicles_cubit.dart';
import 'package:sls_mvp_microsoft/firebase_options.dart';

void main() async {
  // Gemini.init(apiKey: kGeminiApi, enableDebugging: true);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseFirestore.instance.clearPersistence();

  FirebaseFirestore.instance.settings =
      const Settings(persistenceEnabled: false);

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const SLS());
  });
}

class SLS extends StatelessWidget {
  const SLS({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SignoutCubit(),
        ),
        BlocProvider(
          create: (context) => FetchUsersCubit(),
        ),
        BlocProvider(
          create: (context) => VehiclesCubit(),
        )
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: kBGColor,
          // textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}
