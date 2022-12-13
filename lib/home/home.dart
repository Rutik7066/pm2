import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:pm/Authentication/user.dart';
import 'package:routemaster/routemaster.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final indexedPage = IndexedPage.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(right: 6),
              child: Drawer(
                backgroundColor: Colors.white,
                elevation: 5,
                child: Column(
                  children: [
                    CustomeNavigation(
                      index: 0,
                      indexedPage: indexedPage,
                      icon: const Icon(Ionicons.receipt_outline, size: 20),
                      label: 'Bill',
                    ),
                    CustomeNavigation(
                      index: 1,
                      indexedPage: indexedPage,
                      icon: const Icon(Ionicons.md_camera_outline, size: 20),
                      label: 'Event',
                    ),
                    CustomeNavigation(
                      index: 2,
                      indexedPage: indexedPage,
                      icon: const Icon(SimpleLineIcons.notebook, size: 20),
                      label: 'Credit Book',
                    ),
                    CustomeNavigation(
                      index: 3,
                      indexedPage: indexedPage,
                      icon: const Icon(Octicons.quote, size: 20),
                      label: 'Quotation',
                    ),
                    CustomeNavigation(
                      index: 4,
                      indexedPage: indexedPage,
                      icon: const Icon(Ionicons.person_circle_outline, size: 20),
                      label: 'Customer',
                    ),
                    CustomeNavigation(
                      index: 5,
                      indexedPage: indexedPage,
                      icon: const Icon(Ionicons.cloud_upload_outline, size: 20),
                      label: 'Photo Gallery',
                    ),
                    CustomeNavigation(
                      index: 6,
                      indexedPage: indexedPage,
                      icon: const Icon(Ionicons.image_outline, size: 20),
                      label: 'Product',
                    ),
                    CustomeNavigation(
                      index: 7,
                      indexedPage: indexedPage,
                      icon: const Icon(MaterialCommunityIcons.finance, size: 20),
                      label: 'Expense',
                    ),
                    CustomeNavigation(
                      index: 8,
                      indexedPage: indexedPage,
                      icon: const Icon(Ionicons.md_logo_whatsapp, size: 20),
                      label: 'Whatsapp',
                    ),
                    CustomeNavigation(
                      index: 9,
                      indexedPage: indexedPage,
                      icon: const Icon(MaterialCommunityIcons.monitor_dashboard, size: 20),
                      label: 'Dashboard',
                    ),
                    Spacer(),
                    CustomeNavigation(
                      index: 10,
                      indexedPage: indexedPage,
                      icon: const Icon(Ionicons.person, size: 20),
                      label: 'Profile',
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: PageStackNavigator(
                stack: indexedPage.currentStack,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomeNavigation extends StatelessWidget {
  const CustomeNavigation({
    Key? key,
    required this.indexedPage,
    required this.icon,
    required this.label,
    required this.index,
  }) : super(key: key);

  final IndexedPageState indexedPage;
  final Widget icon;
  final String label;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 1),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        elevation: indexedPage.index == index ? 5 : 0,
        color: indexedPage.index == index ? Colors.indigo.shade50 : null,
        child: ListTile(
          horizontalTitleGap: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          selectedColor: Colors.indigo.shade400,
          selectedTileColor: Colors.indigo.shade50,
          leading: icon,
          style: ListTileStyle.drawer,
          textColor: Colors.black45,
          iconColor: Colors.black45,
          title: Text(label),
          selected: indexedPage.index == index,
          onTap: () => indexedPage.index = index,
        ),
      ),
    );
  }
}
