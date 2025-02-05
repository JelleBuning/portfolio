import 'package:flutter/material.dart';
import 'package:flutter_flip_card/controllers/flip_card_controllers.dart';
import 'package:flutter_flip_card/flipcard/flip_card.dart';
import 'package:flutter_flip_card/modal/flip_side.dart';
import 'package:portfolio/app/widgets/avatar_card.dart';
import 'package:portfolio/app/widgets/icon_url.dart';
import 'package:portfolio/app/widgets/url_information.dart';

class ContactCard extends StatefulWidget {
  const ContactCard({
    super.key,
    required this.isMobile,
  });

  final bool isMobile;

  @override
  State<ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<ContactCard> {
  final controller = FlipCardController();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: widget.isMobile ? double.infinity : 400,
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              info(context),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: SizedBox(
                  child: Divider(
                    height: 1,
                    color:
                        Theme.of(context).colorScheme.onPrimary.withAlpha(25),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  crossAxisAlignment: WrapCrossAlignment.end,
                  runAlignment: WrapAlignment.spaceBetween,
                  runSpacing: 10,
                  children: [
                    UrlInformation(
                      asset: 'images/mail.svg',
                      title: 'Email',
                      description: 'jellebuning@outlook.com',
                      uri: Uri.parse('mailto:jellebuning@outlook.com'),
                    ),
                    UrlInformation(
                      asset: 'images/location.svg',
                      title: 'Location',
                      description: 'Netherlands, Winerswijk',
                      uri: Uri.parse(
                          'https://www.google.com/maps/place/Winterswijk/@51.9710562,6.6776237,13z/data=!3m1!4b1!4m6!3m5!1s0x47b865333798aecf:0x8e58628fb931e166!8m2!3d51.9713139!4d6.720509!16s%2Fg%2F1yh7_r_wc?entry=ttu&g_ep=EgoyMDI1MDIwMi4wIKXMDSoASAFQAw%3D%3D'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: SizedBox(
                  child: Divider(
                    height: 1,
                    color:
                        Theme.of(context).colorScheme.onPrimary.withAlpha(25),
                  ),
                ),
              ),
              Row(
                spacing: 7.5,
                children: [
                  IconUrl(
                    asset: 'images/linkedin.svg',
                    uri: Uri.parse('https://www.linkedin.com/in/jellebuning/'),
                  ),
                  IconUrl(
                    asset: 'images/github.svg',
                    uri: Uri.parse('https://www.github.com/jellebuning/'),
                    size: 25,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row info(BuildContext context) {
    return Row(
      spacing: 25,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        FlipCard(
          rotateSide: RotateSide.left,
          onTapFlipping: true,
          axis: FlipAxis.vertical,
          controller: controller,
          frontWidget: AvatarCard(
            child: Image.asset('images/memoji.png'),
          ),
          backWidget: AvatarCard(
            child: ShaderMask(
              shaderCallback: (rect) {
                return LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black,
                    Colors.black,
                    Colors.black,
                    Colors.black,
                    Colors.transparent,
                  ],
                ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
              },
              blendMode: BlendMode.dstIn,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(5, 10, 5, 5),
                child: Image.asset('images/me.png'),
              ),
            ),
          ),
        ),
        Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Jelle Buning',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimary.withAlpha(15),
                borderRadius: BorderRadius.all(Radius.circular(7.5)),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Text(
                  'Software engineer',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
