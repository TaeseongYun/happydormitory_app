import 'package:flutter/material.dart';
import 'package:happydormapp/restaurant/providers/dormitory_providers.dart';
import 'package:happydormapp/root/root_page.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: DormitoryProviders(),
        )
      ],
      child: RootPage(),
    ),
  );
}
