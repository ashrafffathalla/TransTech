import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../shared/widgets/section.dart';
import '../../../../shared/widgets/app_nav.dart';
import '../../../theme/branding_colors.dart';
import '../widgets/hero_block.dart';
import '../widgets/about_block.dart';
import '../widgets/services_block.dart';
import '../widgets/projects_block.dart';
import '../widgets/contact_block.dart';
import '../widgets/footer.dart';
import '../widgets/techBlock.dart';

class PortfolioHome extends StatefulWidget {
  const PortfolioHome({super.key});
  @override
  State<PortfolioHome> createState() => _PortfolioHomeState();
}

class _PortfolioHomeState extends State<PortfolioHome> {
  final _scrollController = ScrollController();

  final homeKey = GlobalKey();
  final aboutKey = GlobalKey();
  final servicesKey = GlobalKey();
  final projectsKey = GlobalKey();
  final contactKey = GlobalKey();
  final techKey = GlobalKey();

  Future<void> _scrollTo(GlobalKey key) async {
    final ctx = key.currentContext;
    if (ctx == null) return;
    await Scrollable.ensureVisible(
      ctx,
      alignment: 0.0, // top-align section
      duration: const Duration(milliseconds: 450),
      curve: Curves.easeInOut,
      alignmentPolicy: ScrollPositionAlignmentPolicy.explicit,
    );
  }

  void _popAndScroll(GlobalKey key) {
    Navigator.of(context).maybePop();
    _scrollTo(key);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isWide = width >= 900;


    final navButtons = [
      NavButton('Home', () => _scrollTo(homeKey)),
      NavButton('About', () => _scrollTo(aboutKey)),
      NavButton('Services', () => _scrollTo(servicesKey)),
      NavButton('Technology', () => _scrollTo(techKey)),
      NavButton('Fleet & Clients', () => _scrollTo(projectsKey)),
      NavButton('Contact', () => _scrollTo(contactKey)),
    ];

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: TTColors.orangeDeep,
          size: 28,
        ),
        title: Container(decoration: BoxDecoration(
        ),
            child: Image.asset('assets/logo.png',height: MediaQuery.of(context).size.height*0.12,)),
        toolbarHeight: width < 480 ? 80 : 100,
        actions: isWide
            ? [...navButtons,
          const SizedBox(width: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: FilledButton(
              onPressed: () => launchUrl(Uri.parse('mailto:hello@masrpay.com')),
              child: const Text('Hire Us'),
            ),
          ),
        ]
            : null,
      ),
      drawer: isWide
          ? null
          : Drawer(
        backgroundColor: TTColors.onOrange,
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(8),
            children: [
              const ListTile(
                title: Text('TransTech',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              const Divider(),
              DrawerItem('Home', () => _popAndScroll(homeKey)),
              DrawerItem('About', () => _popAndScroll(aboutKey)),
              DrawerItem('Services', () => _popAndScroll(servicesKey)),
              DrawerItem('Projects', () => _popAndScroll(projectsKey)),
              DrawerItem('Contact', () => _popAndScroll(contactKey)),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.mail),
                title: const Text('Hire Us'),
                onTap: () => launchUrl(Uri.parse('mailto:hello@masrpay.com')),
              ),
            ],
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final w = constraints.maxWidth;
          final contentPadding = EdgeInsets.symmetric(
            horizontal: w < 360 ? 10
                : w < 600 ? 16
                : w < 900 ? 24
                : w < 1200 ? 48
                : w < 1600 ? 72
                : 96,
            vertical: w < 600 ? 16 : 24,
          );

          return SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                SizedBox(height:35,),
                Padding(padding: const EdgeInsets.only(left:35,top: 12), child: Row(children: [Text("Home",   style:TextStyle(fontWeight: FontWeight.w800, color: TTColors.blue,fontSize: 30) ),],),),
                Section(key: homeKey, padding: contentPadding, child: HeroBlock(isWide: isWide)),
                Padding(padding: const EdgeInsets.only(left:35,top: 12), child: Row(children: [Text("About",   style:TextStyle(fontWeight: FontWeight.w800, color: TTColors.blue,fontSize: 30) ),],),),
                Divider(thickness: 4,color:Color(0xFFE65F00)),
                Section(key: aboutKey, padding: contentPadding, child: const AboutBlock()),
                Padding(padding: const EdgeInsets.only(left:35,top: 12), child: Row(children: [Text("Services",   style:TextStyle(fontWeight: FontWeight.w800, color: TTColors.blue,fontSize: 30) ),],),),
                Divider(thickness: 4,color:Color(0xFFE65F00)),
                Section(key: servicesKey, padding: contentPadding, child: const ServicesBlock()),
                Padding(padding: const EdgeInsets.only(left:35,top: 12), child: Row(children: [Text("Technology",   style:TextStyle(fontWeight: FontWeight.w800, color: TTColors.blue,fontSize: 30) ),],),),
                Divider(thickness: 4,color:Color(0xFFE65F00)),
                Section(key: techKey, padding: contentPadding, child: const TechBlock(),),
                Padding(padding: const EdgeInsets.only(left:35,top: 12), child: Row(children: [Text("Fleet & Clients",   style:TextStyle(fontWeight: FontWeight.w800, color: TTColors.blue,fontSize: 30) ),],)),
                Divider(thickness: 4,color:Color(0xFFE65F00)),
                Section(key: projectsKey, padding: contentPadding, child: const ProjectsBlock()),
                Padding(padding: const EdgeInsets.only(left:35,top: 12),child: Row(children: [Text("Contact Us",   style:TextStyle(fontWeight: FontWeight.w800, color: TTColors.blue,fontSize: 30) ),],),),
                Divider(thickness: 4,color:Color(0xFFE65F00)),
                Section(key: contactKey, padding: contentPadding, child: const ContactBlock()),
                const SizedBox(height: 48),
                const PortfolioFooter(),
              ],
            ),
          );
        },
      ),
    );
  }
}
