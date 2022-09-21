import 'package:doxbox/components/documentCard.dart';
import 'package:doxbox/services/database.dart';
import 'package:doxbox/utilities/assets.dart';
import 'package:doxbox/utilities/theme.dart';
import 'package:doxbox/views/details/details_screen.dart';
import 'package:doxbox/views/home/empty_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:page_transition/page_transition.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final documentsBox = Hive.box('documents');
  TextEditingController search = TextEditingController();
  @override
  void initState() {
    super.initState();
    search.addListener(() {
      // This ensures the widget is rebuild for new search text coz it is bound to controller
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Converts.c24),
      child: SafeArea(
        child: (AppDatabase.getDocuments().isEmpty)
            ? const EmptyScreen()
            : Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: Converts.c24),
                    child: TextField(
                      style: TextStyles.t16.apply(color: Colors.white),
                      controller: search,
                      decoration: InputDecoration(
                        suffixIcon: AppAssets.search,
                        label: Text(
                          'Search for Documents',
                          style: TextStyles.t16,
                        ),
                        filled: true,
                        fillColor: Nord.nord2,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(Converts.c8),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ValueListenableBuilder(
                      valueListenable: Hive.box('documents').listenable(),
                      builder: ((context, value, child) => ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount:
                                AppDatabase.getDocuments(search.text).length,
                            shrinkWrap: false,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    PageTransition(
                                      curve: Curves.easeInOutSine,
                                      type: PageTransitionType.fade,
                                      child: DetailsScreen(
                                        document: AppDatabase.getDocuments(
                                            search.text)[index],
                                        index: index,
                                      ),
                                    ),
                                  );
                                },
                                child: DocumentCard(
                                  document: AppDatabase.getDocuments(
                                      search.text)[index],
                                  index: index,
                                ),
                              );
                            },
                          )),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
