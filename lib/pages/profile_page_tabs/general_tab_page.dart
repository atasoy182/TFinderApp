import 'package:flutter/material.dart';
import 'package:tfinder_app/widgets/general_tab_widgets.dart';

class ProfileGeneralTab extends StatefulWidget {
  @override
  _ProfileGeneralTabState createState() => _ProfileGeneralTabState();
}

class _ProfileGeneralTabState extends State<ProfileGeneralTab> {
  String _hakkindaString =
      "When it comes to language, I use what is known in the applied linguistics field as the communicative approach, which simply means that communication is the end-goal of all language learning.My teaching philosophy is to help every student find their own motivation, needs and competencies in language learning. It is my job as a tutor to help students develop what is known as learner autonomy - taking ownership of one’s own learning - through goal-setting, self-assessment and self-reflection throughout the language learning process.For adults (age 16+), I offer lessons in general English that include work on all four language skills: speaking, listening, reading, writing. I use a digital coursebook as the basis of my general English curriculum to teach both lexis (vocabulary) and grammar within all four skills.For working professionals, I offer Business English lessons that begin with a detailed needs analysis of each learner's unique professional context to determine the language skills your job responsibilities require.For students taking the IELTS, TOEFL, TOEIC, Cambridge English exams, I offer exam prep lessons focusing on test-taking strategy and skills practice.Finally, I believe that language is a process of discovery, of your own skills and potential for connection with other people on this planet!Please do not hesitate to reach out with any questions or special requests :)";

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverToBoxAdapter(
        child: GeneralTabChips(
            assetIconPath: "assets/images/books.png",
            chipList: [
              "Python",
              "Postgresql",
              "Qt5",
              "React Native",
              "Firebase"
            ]),
      ),
      SliverToBoxAdapter(
        child: GeneralTabCard(
          baslikText: "Hakkında",
          longString: _hakkindaString,
          assetIconPath: "assets/images/about.png",
        ),
      ),
      SliverToBoxAdapter(
        child: GeneralEducationTabCard(
          baslikText: "Eğitim",
          assetIconPath: "assets/images/graduate.png",
          year: "2020",
          calisilanyerText: "İstanbul Arel Üniversitesi",
          calisilanbolumText: "Bilgisayar mühensiliği",
        ),
      ),
      SliverToBoxAdapter(
        child: GeneralEducationTabCard(
          baslikText: "İş Deneyimi",
          assetIconPath: "assets/images/work.png",
          year: "2021",
          calisilanyerText: "Dia Yazılım",
          calisilanbolumText: "Yazılım Geliştirici",
        ),
      ),
//      ,
    ]);
  }
}

//SliverGrid.count(
//        crossAxisCount: 1,
//        childAspectRatio: 4 / 1.4,
//        children: List.generate(100, (index) {
//          return Card(
//            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
//            elevation: 1,
//            shape: RoundedRectangleBorder(
//              borderRadius: BorderRadius.circular(20),
//            ),
//            child: Container(
//              height: 50,
//              child: Center(
//                child: Text("Some text here"),
//              ),
//            ),
//          );
//        }),
//      )

//      SliverToBoxAdapter(
//        child: Container(
//          //color: Colors.red,
//          height: 80,
//          width: 100,
//          child: Row(
//            children: [
//              Expanded(
//                flex: 2,
//                child: CircleAvatar(
//                    radius: 50,
//                    backgroundImage: CachedNetworkImageProvider(_imageUrl)),
//              ),
//              Expanded(flex: 8, child: Container()),
//            ],
//          ),
//        ),
//      ),
