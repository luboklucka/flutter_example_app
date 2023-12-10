import 'package:flutter_example_app/src/app/app_route.dart';
import 'package:flutter_example_app/src/features/home/home.dart';
import 'package:flutter_example_app/src/features/universities/view_model/universities_view_model.dart';
import 'package:flutter_example_app/src/features/universities/store/api_service_universities.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class ExampleApp extends StatefulWidget {
  const ExampleApp({
    Key? key,
  }) : super(key: key);

  @override
  State<ExampleApp> createState() => _ExampleAppState();
}

class _ExampleAppState extends State<ExampleApp> {
  late GlobalKey<NavigatorState> _navigationKey;
  late ApiService _apiService;

  @override
  void initState() {
    super.initState();
    _navigationKey = GlobalKey();

    final httpClient = http.Client();
    _apiService = ApiService(httpClient: httpClient);
  }

  Future<String> shouldSeeOnboarding() async {
    return Home.routeName;

    /* 
        App with Onboarding pages example:
    */
    // final prefs = await NativeSharedPreferences.getInstance();
    // final hasSeenOnboarding =
    //     prefs.getBool(SharedPreferencesKeys.hasViewedOnboarding) ?? false;
    //
    // return hasSeenOnboarding
    //     ? HomeBottomBar.routeName
    //     : OnboardingFlow.routeName;
  }

  PageRoute<T> _buildPageRoute<T>(RouteSettings settings) {
    final routes = <String, AppRoute>{
      // OnboardingFlow.routeName:
      //     AppRoute.standard(builder: (_) => const OnboardingFlow()),
      Home.routeName: AppRoute.standard(builder: (_) => const Home()),
    };

    final route = routes[settings.name];
    return route!.transitionPageRouteBuilder(route.builder, settings.arguments);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UniversitiesViewModel(apiService: _apiService),
        ),
      ],
      child: FutureBuilder<String>(
        future: shouldSeeOnboarding(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const SizedBox.shrink();

          return material.MaterialApp(
            title: '',
            navigatorKey: _navigationKey,
            theme: material.ThemeData(
              primarySwatch: material.Colors.blue,
              visualDensity: material.VisualDensity.adaptivePlatformDensity,
            ),
            onGenerateRoute: _buildPageRoute,
            initialRoute: snapshot.data,
            builder: (context, child) {
              return child ?? Container();
            },
          );
        },
      ),
    );
  }
}
