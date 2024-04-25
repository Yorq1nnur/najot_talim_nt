import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najot_talim_nt/screens/contact/widgets/contact_button.dart';
import 'package:najot_talim_nt/utils/size_utils.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              AppImages.menu,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(AppImages.pdf),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Contact",
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              36.getH(),
              Text(
                "Hello there! I live in Uzbekistan, Kokand (Fergana), and there are many ways to contact me:",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 24.sp,
                ),
              ),
              20.getH(),
              ContactButton(
                iconsPath: AppImages.callSvg,
                title: "+998 91 011 03 53",
                onTab: () {
                  final Uri phoneUrl = Uri(
                    scheme: 'tel',
                    path: '+998330391117',
                  );
                  UrlLauncher.launchUrl(phoneUrl);
                },
              ),
              10.getH(),
              ContactButton(
                iconsPath: AppImages.messegSvg,
                title: "abduraimovyorqinjon4@gmail.com",
                onTab: () {},
              ),
              10.getH(),
              ContactButton(
                iconsPath: AppImages.globusSvg,
                title: "abduraimovyorqinjon4@gmail.com",
                onTab: () {},
              ),
              30.getH(),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Uri linkedinUrl =
                          Uri.parse("www.linkedin.com/in/yorqinnur-abduraimov-b439862b3");
                      UrlLauncher.launchUrl(linkedinUrl);
                    },
                    child: SvgPicture.asset(
                      AppImages.linkSvg,
                      width: 32.w,
                    ),
                  ),
                  32.getW(),
                  InkWell(
                    onTap: () {
                      Uri instagramUrl = Uri.parse(
                          "https://www.instagram.com/not_legal_187?igsh=MTdxaWZjcjloOHI5cQ==");
                      UrlLauncher.launchUrl(instagramUrl);
                    },
                    child: SvgPicture.asset(
                      AppImages.instagramSvg,
                      width: 32.w,
                    ),
                  ),
                  32.getW(),
                  InkWell(
                    onTap: () {},
                    child: SvgPicture.asset(
                      AppImages.watsapSvg,
                      width: 32.w,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
