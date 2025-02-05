import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/app/widgets/occupation_card.dart';
import 'package:portfolio/app/widgets/skill_card.dart';

class Content extends StatefulWidget {
  const Content({
    super.key,
    required this.isMobile,
  });

  final bool isMobile;

  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            spacing: 40,
            children: [
              aboutMe(context),
              whatImDoing(context),
              skills(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget aboutMe(BuildContext context) {
    return Column(
      spacing: 15,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About Me',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
        Container(
          height: 5,
          width: 70,
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.all(Radius.circular(50))),
        ),
        Text(
          '''A passionate .NET developer with expertise in building robust web applications, RESTful APIs, and scalable backend solutions. Skilled in crafting efficient business logic and optimizing performance. Enthusiastic about front-end technologies and delivering seamless, intuitive user interfaces.

Experienced in troubleshooting and maintaining high-quality, responsive applications. Continuously exploring advancements in .NET technologies and best practices to develop efficient, innovative solutions for modern software needs.''',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary.withAlpha(225),
            fontWeight: FontWeight.w300,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget whatImDoing(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        spacing: 15,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Text(
              "What I'm Doing",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          OccupationCard(
            isMobile: widget.isMobile,
            asset: 'images/phone.svg',
            title: 'Mobile Apps',
            description:
                'Professional development of applications for Android and ios.',
            assetHeight: 40,
          ),
          OccupationCard(
            isMobile: widget.isMobile,
            asset: 'images/web_development.svg',
            title: 'Web development',
            description:
                'High-quality development of sites at the professional level.',
            assetHeight: 30,
          ),
          OccupationCard(
            isMobile: widget.isMobile,
            asset: 'images/backend_development.svg',
            title: 'Backend development',
            description:
                'High-performance backend services designed for scalability and seamless user experience. ',
            assetHeight: 35,
          ),
        ],
      ),
    );
  }
}

Widget skills(BuildContext context) {
  return SizedBox(
    width: double.infinity,
    child: Column(
      spacing: 15,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Text(
            "Skills",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            spacing: 20,
            children: [
              SkillCard(
                uri: Uri.parse('https://dotnet.microsoft.com/en-us/'),
                child: SvgPicture.asset('images/dotnet.svg'),
              ),
              SkillCard(
                uri: Uri.parse(
                    'https://dotnet.microsoft.com/en-us/languages/csharp'),
                color: Color.fromARGB(255, 52, 36, 56),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: SvgPicture.asset('images/c-sharp.svg'),
                ),
              ),
              SkillCard(
                uri: Uri.parse('https://dart.dev/'),
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: SvgPicture.asset('images/dart.svg'),
                ),
              ),
              SkillCard(
                uri: Uri.parse('https://flutter.dev/'),
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: SvgPicture.asset('images/flutter.svg'),
                ),
              ),
              SkillCard(
                uri: Uri.parse(
                    'https://learn.microsoft.com/en-us/dotnet/visual-basic/'),
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: SvgPicture.asset(
                    'images/vbnet.svg',
                    colorFilter: ColorFilter.mode(
                      const Color.fromARGB(255, 90, 156, 219),
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              SkillCard(
                uri: Uri.parse('https://figma.com/'),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: SvgPicture.asset('images/figma.svg'),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
