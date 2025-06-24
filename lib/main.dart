import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:animate_do/animate_do.dart';

void main() {
  runApp(const MyPortfolioApp());
}

class MyPortfolioApp extends StatelessWidget {
  const MyPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Neeraj Sharma | Flutter Developer',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const PortfolioHome(),
    );
  }
}

class PortfolioHome extends StatelessWidget {
  const PortfolioHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          const Positioned.fill(
            child: Opacity(
              opacity: 0.05,
              child: Image(
                image: AssetImage('assets/images/background_img.png'),
                color: Colors.white,
              ),
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FadeInDown(
                  duration: const Duration(milliseconds: 600),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage("assets/images/profile.png"),
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Neeraj Sharma',
                            style: GoogleFonts.poppins(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                                color: Colors.white
                            ),
                          ),
                          Text(
                            'Flutter Developer',
                            style: GoogleFonts.poppins(fontSize: 18, color: Colors.white.withOpacity(0.7)),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                FadeInUp(
                  duration: const Duration(milliseconds: 700),
                  child: Text(
                    'Hi, I’m Neeraj Sharma, a passionate and results-oriented Flutter Developer with over'
                        ' 5 years of experience in crafting high-performance, cross-platform mobile applications.'
                        ' I specialize in building elegant and scalable solutions using Flutter, Dart, Firebase, and GetX,'
                        ' with a strong focus on clean architecture and user-centric design. I take pride in translating'
                        ' complex requirements into seamless user experiences.',
                    style: GoogleFonts.poppins(fontSize: 16,color: Colors.white),
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton.icon(
                  onPressed: () {
                    launchUrl(Uri.parse("mailto:neerajsharma74824@gmail.com"));
                  },
                  icon: const Icon(Icons.email),
                  label: const Text("Contact Me",style: TextStyle(
                      color: Colors.black,
                  ),),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                ),
                const SizedBox(height: 48),

                FadeInUp(
                  duration: const Duration(milliseconds: 800),
                  child: Text(
                    'Skills & Tools',
                    style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.white),
                  ),
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    skillChip('Flutter'),
                    skillChip('Dart'),
                    skillChip('GetX'),
                    skillChip('Firebase'),
                    skillChip('REST APIs'),
                    skillChip('Clean Architecture'),
                    skillChip('Figma to Flutter'),
                    skillChip('Provider'),
                    skillChip('Git & GitHub'),
                    skillChip('Play Store / App Store Publishing'),
                  ],
                ),
                const SizedBox(height: 48),

                FadeInUp(
                  duration: const Duration(milliseconds: 900),
                  child: Text(
                    'Projects',
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: [
                    projectCard(
                      title: "Texfo",
                      description: "All-in-one platform for textile calculations and cash management.",
                      url: "https://apps.apple.com/in/app/texfo/id6478456851",
                    ),
                    projectCard(
                      title: "REGITIQ",
                      description: "All-in-one platform to streamline organizational operations — from leadership to leave and communication management.",
                      url: "https://apps.apple.com/in/app/regitiq/id6469681292",
                    ),
                    projectCard(
                      title: "JEWEL-LINES",
                      description: "Jeweline is a cutting-edge mobile application designed to revolutionize the way people engage with the world of jewelry",
                      url: "https://apps.apple.com/in/app/jewel-lines/id6450709524",
                    ),
                    projectCard(
                      title: "RegCRM",
                      description: "This app is specifically designed for sales team to help them manage their clients and properties on the go.",
                      url: "https://apps.apple.com/in/app/regcrm/id6449463983",
                    ),
                    projectCard(
                      title: "RideNest App",
                      description: "E-commerce app for bike gear with cart, audio, and map features.",
                      url: "https://github.com/Nikks98/plugin_app_v1",
                    ),
                    projectCard(
                      title: "Calendar App",
                      description: "Calendar with event CRUD using Provider and modern UI.",
                      url: "https://github.com/Nikks98/Calendar-App",
                    ),
                  ],
                ),
                const SizedBox(height: 48),

                FadeInUp(
                  duration: const Duration(milliseconds: 1000),
                  child: Text(
                    'Connect With Me',
                    style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w500,color: Colors.white),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    iconLink('LinkedIn', 'https://www.linkedin.com/in/neeraj-sharma-6aa10b1b6/'),
                    const SizedBox(width: 16),
                    iconLink('GitHub', 'https://github.com/Nikks98'),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget skillChip(String label) {
    return Chip(
      label: Text(label),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      backgroundColor: Colors.indigo.shade50,
      labelStyle: GoogleFonts.poppins(fontSize: 14,color: Colors.black),
    );
  }

  Widget projectCard({required String title, required String description, required String url}) {
    return InkWell(
      onTap: () => launchUrl(Uri.parse(url)),
      child: Container(
        width: 320,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(color: Colors.white.withOpacity(0.5), blurRadius: 10, offset: Offset(0, 6))
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.black)),
            const SizedBox(height: 8),
            Text(description, style: GoogleFonts.poppins(fontSize: 14,color: Colors.black))
          ],
        ),
      ),
    );
  }

  Widget iconLink(String title, String url) {
    return InkWell(
      onTap: () => launchUrl(Uri.parse(url)),
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 5),
              child: Icon(Icons.link, color: Colors.black),
            ),
            const SizedBox(width: 4),
            Padding(
              padding: const EdgeInsets.only(left: 3, right: 10),
              child: Text(
                title,
                style: GoogleFonts.poppins(fontSize: 14, color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}
