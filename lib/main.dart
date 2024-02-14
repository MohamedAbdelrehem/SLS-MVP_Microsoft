import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:sls_mvp_microsoft/constants.dart';
import 'package:sls_mvp_microsoft/core/utils/app_router.dart';
import 'package:sls_mvp_microsoft/features/home/view_model/signout_cubit/signout_cubit.dart';

void main() {
  // Gemini.init(apiKey: kGeminiApi, enableDebugging: true);
  WidgetsFlutterBinding.ensureInitialized();
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
    return BlocProvider(
      create: (context) => SignoutCubit(),
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
