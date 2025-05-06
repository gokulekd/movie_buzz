import 'package:carousel_slider/carousel_slider.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List of network image URLs
  final List<String> imageUrls = [
    "https://calndr-admin-test.s3.ap-south-1.amazonaws.com/media/images/1745432398331_Banner-01.jpg",
    "https://calndr-admin-test.s3.ap-south-1.amazonaws.com/media/images/1745482059583_Banner-)1.jpg",
    "https://calndr-admin-test.s3.ap-south-1.amazonaws.com/media/images/1745842111877_pexels-nathan-engel-50858-436413.jpg",
    "https://calndr-admin-test.s3.ap-south-1.amazonaws.com/media/images/1746448679548_cropped-krivan-peak-slovakia-picjumbo-com.jpg",
  ];

  int currentIndex = 0;

  final List<String> requirement = [
    "Actor",
    "Model",
    "Influencer",
    "Music Composer",
    "Camera Person",
    "Model",
    "Editor",
    "Scrpitwriiter",
  ];

  // Sample data
  final List<GridCard> gridCardData = [
    GridCard(
      imagePath:
          'https://calndr-admin-test.s3.ap-south-1.amazonaws.com/media/images/1745442020745_Captain_Miller__Dhanush.jpg',
      title: 'Film Updates',
    ),
    GridCard(
      imagePath:
          'https://calndr-admin-test.s3.ap-south-1.amazonaws.com/media/images/1745441573329_Hiring_01.jpg',
      title: 'Hiring',
    ),
    GridCard(
      imagePath:
          'https://calndr-admin-test.s3.ap-south-1.amazonaws.com/media/images/1745442074313_Music_01.jpg',
      title: 'Music Updates',
    ),
  ];

  final List<HappeningThisWeekModel> happeningThisWeekData = [
    HappeningThisWeekModel(
      imagePath:
          'https://calndr-admin-test.s3.ap-south-1.amazonaws.com/media/images/1736201298354_SaveClip.App_468818911_2033544580427839_1018293354988687627_n.jpg',
      title: 'Jumbo Circus',
      rating: 3.5,
    ),
    HappeningThisWeekModel(
      imagePath:
          'https://calndr-admin-test.s3.ap-south-1.amazonaws.com/media/images/1736201398221_SaveClip.App_468693820_1560578001254236_5095532355904366869_n.jpg',
      title: 'Skimboarding Workshop"',
      rating: 4.3,
    ),
    HappeningThisWeekModel(
      imagePath:
          'https://calndr-admin-test.s3.ap-south-1.amazonaws.com/media/images/1736200553774_SaveClip.App_468401394_1000378038787441_436499449827039482_n.jpg',
      title: 'Wonderla',
      rating: 4.1,
    ),
  ];

  // In your build method:
  final List<TrendingNewsModel> trendingNewsData = [
    TrendingNewsModel(
      imagePath:
          'https://calndr-admin-test.s3.ap-south-1.amazonaws.com/media/images/1745442286214_Mohanlal_Jyotika_1745399229180_1745399292471.jpg',
      title:
          """ Thudaram director Tharun Moorthy revealed why Jyotika couldn't be a part of Mohanlal's film """,
      description:
          "ോഹൻലാലിനെ നായകനാക്കി പൃഥ്വിരാജ് സംവിധാനം ചെയ്യുന്ന ബിഗ് ബജറ്റ് ചിത്രം ‘എമ്പുരാൻ’ ടീസർ ഞായറാഴ്ച എത്തും. ജനുവരി 26 വൈകിട്ട് ഏഴ് ഏഴിന് ടീസർ എത്തും. മലയാളം, തമിഴ്, ഹിന്ദി, തെലുങ്ക്, കന്നഡ ഭാഷകളിലാകും ടീസർ റിലീസ്.അബ്റാം ഖുറേഷിയായുള്ള മോഹൻലാലിന്റെ രണ്ടാം വരവിനു വേണ്ടി ആകാംക്ഷയോെടയാണ് ആരാധാകർ കാത്തിരിക്കുന്നത്. ലൂസിഫറിന്‍റെ വന്‍ വിജയത്തിന് പിന്നാലെ 2019 ല്‍ പ്രഖ്യാപിച്ച സിനിമയുടെ ചിത്രീകരണം ആരംഭിച്ചത് 2023 ഒക്ടോബറിലായിരുന്നു. ഇരുപതോളം വിദേശ രാജ്യങ്ങളിലാണ് സിനിമ ചിത്രീകരിച്ചിരിക്കുന്നതെന്നാണ് വിവരം. യുകെ, യുഎസ് എന്നിവിടങ്ങള്‍ക്കൊപ്പം റഷ്യയും ചിത്രത്തിന്‍റെ ഒരു പ്രധാന ലൊക്കേഷനാണ്. ലൂസിഫറിലെ അഭിനേതാക്കളായ പൃഥ്വിരാജ്, ടൊവിനോ തോമസ്, മഞ്ജു വാരിയർ, ശശി കപൂർ, ഇന്ദ്രജിത്ത്, ബൈജു സന്തോഷ്, സാനിയ ഇയ്യപ്പൻ, തുടങ്ങിയവരും ഈ ചിത്രത്തിൽ ശക്തമായ സാന്നിധ്യങ്ങളാണ്.പൃഥ്വിരാജ് സംവിധാനം ചെയ്യുന്ന എമ്പുരാൻ നിർമിക്കുന്നത് ആന്റണി പെരുമ്പാവൂരിന്റെ ആശീർവാദ് സിനിമാസും ലൈകാ പ്രൊഡക്‌ഷനും ചേർന്നാണ്. മാർച്ച് 27ന് ചിത്രം തിയറ്ററുകളിലെത്തും.",
    ),
    TrendingNewsModel(
      imagePath:
          'https://calndr-admin-test.s3.ap-south-1.amazonaws.com/media/images/1737868382242_bg-daveed.jpg',
      title:
          'ടൊവീനോ തോമസിന്റെ ‘ഐഡന്റിറ്റി’ക്കു തിരക്കേറുന്നു; ഇതുവരെ 23 കോടി കലക്‌ഷൻ1',
      description:
          """ ടൊവീനോ തോമസ് ചിത്രം‘ ഐഡന്റിറ്റി’ ബോക്സ്ഓഫിസിൽ മികച്ച പ്രതികരണം നേടി മുന്നേറുന്നു. അഖിൽ പോളും അനസ് ഖാനും ചേർന്ന് സംവിധാനം ചെയ്ത ഇൻവെസ്റ്റി​ഗേഷൻ ക്രൈം ത്രില്ലർ ചിത്രം 'ഐഡന്റിറ്റി' മികച്ച അഭിപ്രായങ്ങൾ ഏറ്റുവാങ്ങി തിയറ്ററുകളിൽ പ്രദർശനം തുടരുമ്പോൾ ബോക്സ്ഓഫിസിൽ ഗംഭീര ഇനീഷ്യലാണ് ചിത്രം നേടുന്നത്. നാലു ദിവസം കൊണ്ട് 23.20 കോടി രൂപയാണ് വേൾഡ് വൈഡ് കലക്‌ഷൻ. ട്വിസ്റ്റ്, സസ്പെൻസ്, സർപ്രൈസ് എന്നിവയാൽ സമ്പന്നമായ ചിത്രം ആദ്യാവസാനം വരെ ത്രില്ലടിപ്പിക്കുന്നുണ്ടെന്നും ഒട്ടും തന്നെ ബോറടിപ്പിക്കുന്നില്ലെന്നുമാണ് സിനിമ കണ്ടിറങ്ങുന്നവർ അഭിപ്രായപ്പെടുന്നത്. കൂടാതെ സിനിമയുടെ മേക്കിങ്ങിനെയും പ്രൊഡക്ഷൻ ക്വാളിറ്റിയെ കുറിച്ചും പ്രേക്ഷകരും നിരൂപകരും ഏറെ പ്രശംസിക്കുന്നുണ്ട്. മലയാളത്തിൽ ഇന്നേ വരെ കാണാത്ത ടെക്നിക്കൽ ക്വാളിറ്റിയാണ് ചിത്രത്തിലുള്ളതെന്നും അഭിപ്രായങ്ങളുണ്ട്. രാഗം മൂവിസിന്റെ ബാനറിൽ രാജു മല്യത്തും കോൺഫിഡന്റ് ഗ്രൂപ്പിന്റെ ബാനറിൽ ഡോ. റോയി സി ജെയും ചേർന്ന് നിർമ്മിച്ച ചിത്രം ശ്രീ ഗോകുലം മൂവിസിന് വേണ്ടി ഡ്രീം ബിഗ് ഫിലിംസാണ് തിയറ്ററുകളിലെത്തിച്ചത്. ചിത്രത്തിന് തമിഴ്നാട്ടിലും മികച്ച പ്രതികരണമാണ് ലഭിക്കുന്നത്. ഓരോ ദിവസം കഴിയുംതോറും തമിഴ്നാട്ടിൽ കലക്ഷൻ കൂടുന്നുണ്ട്. ചിത്രത്തിന്റെ ക്ലൈമാക്സ് രംഗങ്ങൾക്ക് ഗംഭീര കയ്യടിയാണ് ലഭിക്കുന്നത്. പൊലീസ് സ്‍കെച്ച് ആർട്ടിസ്റ്റായ അമ്മയുടെയും പൊലീസ് ഓഫീസറായ അച്ഛന്റെയും വേർപിരിയൽ മൂലം കർക്കശക്കാരനായ അച്ഛന്റെ ശിക്ഷണത്തിലാണ് ഹരൺ വളർന്നു വന്നത്. ഹരണിലൂടെ ആരംഭിക്കുന്ന ചിത്രം ദുരൂഹമായൊരു കൊലപാതകത്തിന് സാക്ഷിയാവുന്ന തൃഷയുടെ അലീഷ എന്ന കഥാപാത്രത്തിലൂടെയാണ് സഞ്ചരിക്കുന്നത്. കേസ് അന്വേക്ഷിക്കാനെത്തിയ അലൻ ജേക്കബും സ്കെച്ച് ആർട്ടിസ്റ്റ് ഹരൺ ശങ്കറുമാണ് ചിത്രത്തെ മുന്നോട്ട് നയിക്കുന്നത്. ആരാണ് കുറ്റവാളി? എന്തായിരുന്നു കൊലയാളിയുടെ ലക്ഷ്യം? എന്നീ ചോദ്യങ്ങൾക്കുള്ള ഉത്തരമാണ് പ്രേക്ഷകർക്കറിയേണ്ടത്. ഹരണായി ടൊവിനോ തോമസ് നിറഞ്ഞാടിയപ്പോൾ അലൻ ജേക്കബായി വിനയ് റായ് തകർത്തഭിനയിച്ചു. ചിത്രത്തിലെ മറ്റൊരു സുപ്രധാന വേഷം ബോളിവുഡ് നടിയായ മന്ദിര ബേദിയാണ് അവതരിപ്പിച്ചത്. കെട്ടുറപ്പുള്ള തിരക്കഥയും കഥ പറച്ചിലിൽ തിരക്കഥാകൃത്തുകൾ പിൻതുടർന്ന സമീപനവുമാണ് ചിത്രത്തിന്റെ മാറ്റ് കൂട്ടുന്നത്. സംവിധായകരായ അഖിൽ പോളും അനസ് ഖാനും തന്നെയാണ് തിരക്കഥ രചിച്ചത്. സാങ്കേതികതയിലെ മികവും ചിത്രത്തെ മികച്ചതാക്കുന്നു. അഖിൽ ജോർജിന്റെ ഛായാഗ്രാഹണവും ജേക്സ് ബിജോയിയുടെ പശ്ചാത്തല സംഗീതമാണ് എടുത്ത് പറയേണ്ട മറ്റൊരു പ്രധാനം ഘടകം. അജു വർഗീസ്, ഷമ്മി തിലകൻ, അർജുൻ രാധാകൃഷ്ണൻ, വിശാഖ് നായർ, അർച്ചന കവി തുടങ്ങിയവരാണ് മറ്റ് താരങ്ങൾ. ബി​ഗ് ബജറ്റിൽ ഒരുങ്ങിയ ചിത്രം യു/എ സർട്ടിഫിക്കറ്റോടെ ജനുവരി 2നാണ് റിലീസ് ചെയ്തത്. ചിത്രത്തിന്റെ ഇന്ത്യയിലെ വിതരണാവകാശം റെക്കോർഡ് തുകയ്ക്ക് ശ്രീ ഗോകുലം മൂവിസ് സ്വന്തമാക്കിയപ്പോൾ ജിസിസി വിതരണാവകാശം ഫാഴ്സ് ഫിലിംസാണ് കരസ്ഥമാക്കിയത്. എക്സിക്യൂട്ടീവ് പ്രൊഡ്യൂസേഴ്സ്: നിതിൻ കുമാർ, പ്രദീപ്‌ മൂലേത്തറ, ചിത്രസംയോജനം: ചമൻ ചാക്കോ, സൗണ്ട് മിക്സിങ്: എം ആർ രാജാകൃഷ്ണൻ, സൗണ്ട് ഡിസൈൻ: സിങ്ക് സിനിമ, പ്രൊഡക്ഷൻ ഡിസൈൻ: അനീഷ് നാടോടി, ആർട് ഡയറക്ടർ: സാബി മിശ്ര, വസ്ത്രാലങ്കാരം: ഗായത്രി കിഷോർ, മാലിനി, മേക്കപ്പ്: റോണക്സ് സേവ്യർ, കോ പ്രൊഡ്യൂസേഴ്സ്: ജി ബിന്ദു റാണി മല്യത്ത്, കാർത്തിക് മല്യത്ത്, കൃഷ്ണ മല്യത്ത്, ആക്ഷൻ കൊറിയോഗ്രാഫി: യാനിക്ക് ബെൻ, ഫീനിക്സ് പ്രഭു, പ്രൊഡക്ഷൻ കൺട്രോളർ: ജോബ് ജോർജ്, ചീഫ് അസോസിയേറ്റ് ഡയറക്ടർ: ബോബി സത്യശീലൻ, സുനിൽ കാര്യാട്ടുകര, ഫസ്റ്റ് അസോസിയേറ്റ് ഡയറക്ടർ: അഭിൽ ആനന്ദ്, ലൈൻ പ്രൊഡ്യൂസർ: പ്രധ്വി രാജൻ, വിഎഫ്എക്സ്: മൈൻഡ്സ്റ്റീൻ സ്റ്റുഡിയോസ്, ലിറിക്സ്: അനസ് ഖാൻ, ഡിഐ: ഹ്യൂസ് ആൻഡ് ടോൺസ്, കളറിസ്റ്റ്: ഷണ്മുഖ പാണ്ഡ്യൻ എം, സ്റ്റിൽസ്: ജാൻ ജോസഫ് ജോർജ്, ഷാഫി ഷക്കീർ, ഡിസൈൻ: യെല്ലോ ടൂത്ത്, ഡിജിറ്റൽ പ്രൊമോഷൻസ്: അഭിൽ വിഷ്ണു, അക്ഷയ് പ്രകാശ്, പി ആർ ഒ & മാർക്കറ്റിങ്: വൈശാഖ് വടക്കേവീട്, ജിനു അനിൽകുമാർ """,
    ),
    TrendingNewsModel(
      imagePath:
          'https://calndr-admin-test.s3.ap-south-1.amazonaws.com/media/images/1741668832639_1000_F_514951224_2dxMLbIw5qNRdPGD003chpbVcxWtcp7K.jpg',
      title: 'try',
      description: 'try',
    ),
    // Add more cards as needed
  ];

  final List<Trailer> trailers = [
    Trailer(
      name: 'Thudarum',
      mediaUrl:
          'https://calndr-admin-test.s3.ap-south-1.amazonaws.com/media/videos/1745439343973_Video-257.mp4',
      mediaType: "mp4",
    ),
    Trailer(
      name: 'Gymkhana clarity check',
      mediaUrl:
          'https://calndr-admin-test.s3.ap-south-1.amazonaws.com/media/videos/1745439872912_AQM8px2o-rCmktFl135Sxnpdbv7HhjhL1uUmVDP_BF9_8ZiJhlTN1heNOi2-wNesua1eEIECSPq4goJr8tU0qZCvBjvmoVimHQUmxHI.mp4',
      mediaType: "mp4",
    ),
    Trailer(
      name: 'Empuraan',
      mediaUrl:
          'https://calndr-admin-test.s3.ap-south-1.amazonaws.com/media/videos/1745930481084_IMG_8701.MP4',
      mediaType: "mp4",
    ),
    // Add more trailers...
    Trailer(
      name: 'Sumathi valav promo',
      mediaUrl:
          'https://calndr-admin-test.s3.ap-south-1.amazonaws.com/media/videos/1745440105698_AQNBgvZ5YrIOtzaWcW3-HKV02i0L7YjxS8IewlA7exqRa23j9a3sm-bOillvYMWNMno4-DtKrgyAfKt8mmwU14MwJdlPY-8YKzoHPoQ.mp4',
      mediaType: "mp4",
    ),
  ];
  final List<NewMusicEventModel> newMusicEventData = [
    NewMusicEventModel(
      imagePath:
          'https://calndr-admin-test.s3.ap-south-1.amazonaws.com/media/images/1736203368489_df.jpg',
      title: 'Golden Love',
    ),
    NewMusicEventModel(
      imagePath:
          'https://calndr-admin-test.s3.ap-south-1.amazonaws.com/media/images/1736203615643_hg.jpg',
      title: 'Mahir',
    ),
    NewMusicEventModel(
      imagePath:
          'https://calndr-admin-test.s3.ap-south-1.amazonaws.com/media/images/1736203386683_SaveClip.App_454798543_18454191643030032_5880511291663929016_n.jpg',
      title: 'Thekk Vadakk1',
    ),
  ];
  final List<RecommendedMovies> recommendedMoviesData = [
    RecommendedMovies(
      imagePath:
          'https://calndr-admin-test.s3.ap-south-1.amazonaws.com/media/images/1736201701934_SaveClip.App_472403769_503950445467318_8158345040130949285_n.jpg',
      title: 'aa',
    ),
    RecommendedMovies(
      imagePath:
          'https://calndr-admin-test.s3.ap-south-1.amazonaws.com/media/images/1736202367477_SaveClip.App_470901768_18475089268029876_5919861208515804523_n.jpg',
      title: 'jhkln',
    ),
    RecommendedMovies(
      imagePath:
          'https://calndr-admin-test.s3.ap-south-1.amazonaws.com/media/images/1736202819632_SaveClip.App_470174890_1129595065188279_3500133395377082243_n.jpg',
      title: 'dfxcb',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Carousel Slider
          CarouselSlider(
            options: CarouselOptions(
              height: 200, // Adjust height as needed for landscape ratio
              aspectRatio: 16 / 9, // Standard landscape aspect ratio
              viewportFraction: 1.0, // Takes full width
              autoPlay: true, // Optional: auto-play the carousel
              enlargeCenterPage: false,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
            items:
                imageUrls.map((url) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 0),
                        child: ExtendedImage.network(
                          url,
                          fit: BoxFit.cover,
                          cache: true, // Enable caching
                          loadStateChanged: (state) {
                            switch (state.extendedImageLoadState) {
                              case LoadState.loading:
                                return Container(
                                  color: Colors.grey[100],
                                  child: const Center(),
                                );
                              case LoadState.completed:
                                return null; // Return null to display the image
                              case LoadState.failed:
                                return Container(
                                  color: Colors.grey[200],
                                  child: const Center(
                                    child: Icon(Icons.error, color: Colors.red),
                                  ),
                                );
                            }
                          },
                        ),
                      );
                    },
                  );
                }).toList(),
          ),
          SizedBox(height: 20),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Colors.grey[100]),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 15),
                  child: Row(
                    children: [
                      Text(
                        "Find your requirement here",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Wrap(
                    spacing: 8.0, // horizontal spacing between cards
                    runSpacing: 8.0, // vertical spacing between cards
                    children: [
                      ...requirement.map(
                        (item) => Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12.0,
                              vertical: 8.0,
                            ),
                            child: Text(
                              item,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Card(
                          color: Colors.green,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12.0,
                              vertical: 5.0,
                            ),
                            child: Wrap(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 2.0,
                                    right: 15,
                                  ),
                                  child: Text(
                                    "View all",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_rounded,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),

          ThreeCardGridView(cards: gridCardData),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 15),
            child: Row(
              children: [
                Text(
                  "Trending News",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          HorizontalCardCarousel(cards: trendingNewsData),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 15),
            child: Row(
              children: [
                Text(
                  "Trending Trailers",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          VideoCarousel(trailers: trailers),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Row(
              children: [
                Text(
                  "Happening this week",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          HappeningThisWeek(cards: happeningThisWeekData),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Row(
              children: [
                Text(
                  "Recommended Movies 2025",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          RecommendedMoviesWidget(cards: recommendedMoviesData),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Row(
              children: [
                Text(
                  "New Music Releases",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          NewMusicEventModelWidget(cards: newMusicEventData),
        ],
      ),
    );
  }
}

class GridCard {
  final String imagePath;
  final String title;

  GridCard({required this.imagePath, required this.title});
}

class ThreeCardGridView extends StatelessWidget {
  final List<GridCard> cards;

  const ThreeCardGridView({super.key, required this.cards});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 0.8,
      ),
      itemCount: 3,
      itemBuilder: (context, index) {
        return Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Stack(
            children: [
              // Image
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  cards[index].imagePath,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
              // Gradient overlay for better text visibility
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Color.fromRGBO(0, 0, 0, 0.7), Colors.transparent],
                  ),
                ),
              ),
              // Centered title
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    maxLines: 2,
                    cards[index].title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      shadows: [
                        Shadow(
                          blurRadius: 6.0,
                          color: Colors.black,
                          offset: Offset(2.0, 2.0),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class TrendingNewsModel {
  final String imagePath;
  final String title;
  final String description;

  TrendingNewsModel({
    required this.imagePath,
    required this.title,
    required this.description,
  });
}

class HorizontalCardCarousel extends StatelessWidget {
  final List<TrendingNewsModel> cards;

  const HorizontalCardCarousel({super.key, required this.cards});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250, // Adjust height as needed
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: cards.length,
        itemBuilder: (context, index) {
          return Container(
            width: 280, // Card width
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image Card
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      cards[index].imagePath,
                      width: double.infinity,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                // Title
                Text(
                  cards[index].title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                // Description
                Text(
                  cards[index].description,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class Trailer {
  final String name;
  final String mediaUrl;
  final String mediaType;

  Trailer({
    required this.name,
    required this.mediaUrl,
    required this.mediaType,
  });
}

class VideoCarousel extends StatefulWidget {
  final List<Trailer> trailers;

  const VideoCarousel({super.key, required this.trailers});

  @override
  State<VideoCarousel> createState() => _VideoCarouselState();
}

class _VideoCarouselState extends State<VideoCarousel> {
  late List<VideoPlayerController> _controllers;
  int _currentPlayingIndex = -1;

  @override
  void initState() {
    super.initState();

    _controllers =
        widget.trailers.map((trailer) {
          final controller = VideoPlayerController.networkUrl(
            Uri.parse(trailer.mediaUrl),
          );
          controller.initialize(); // No autoplay
          return controller;
        }).toList();
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _playVideoAtIndex(int index) {
    if (_currentPlayingIndex != index) {
      if (_currentPlayingIndex >= 0 &&
          _currentPlayingIndex < _controllers.length) {
        _controllers[_currentPlayingIndex].pause();
      }

      _controllers[index].play();
      setState(() {
        _currentPlayingIndex = index;
      });
    }
  }

  void _togglePlayPause(int index) {
    final controller = _controllers[index];

    if (controller.value.isPlaying) {
      controller.pause();
    } else {
      _playVideoAtIndex(index); // Also pauses previous one
    }

    setState(() {}); // Refresh UI
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: widget.trailers.length,
      itemBuilder: (context, index, realIndex) {
        final controller = _controllers[index];

        return VisibilityDetector(
          key: Key("video_$index"),
          onVisibilityChanged: (info) {
            if (info.visibleFraction > 0.5) {
              _playVideoAtIndex(index);
            } else if (_currentPlayingIndex == index) {
              controller.pause();
            }
          },
          child: Column(
            children: [
              AspectRatio(
                aspectRatio:
                    controller.value.isInitialized
                        ? controller.value.aspectRatio
                        : 16 / 9,
                child:
                    controller.value.isInitialized
                        ? GestureDetector(
                          onTap: () => _togglePlayPause(index),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              VideoPlayer(controller),
                              if (!controller.value.isPlaying)
                                const Icon(
                                  Icons.play_circle_fill,
                                  color: Colors.white70,
                                  size: 64,
                                ),
                            ],
                          ),
                        )
                        : const Center(child: CircularProgressIndicator()),
              ),
              const SizedBox(height: 8),
            ],
          ),
        );
      },
      options: CarouselOptions(
        height: 710,
        enlargeCenterPage: true,
        viewportFraction: 0.85,
        enableInfiniteScroll: false,
      ),
    );
  }
}

class HappeningThisWeekModel {
  final String imagePath;
  final String title;
  final double rating;

  HappeningThisWeekModel({
    required this.imagePath,
    required this.title,
    required this.rating,
  });
}

class HappeningThisWeek extends StatelessWidget {
  final List<HappeningThisWeekModel> cards;

  const HappeningThisWeek({super.key, required this.cards});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150, // Adjust height as needed
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 20),
        itemCount: cards.length,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              // Image Card
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    cards[index].imagePath,
                    width: 150,
                    height: 150,

                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50.0, bottom: 30),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(80, 20, 20, 20),
                      borderRadius: BorderRadius.circular(8),
                    ),

                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 10.0,
                        right: 16,
                        top: 8,
                      ),
                      child: Wrap(
                        children: [
                          Icon(Icons.star, size: 16, color: Colors.amber),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 3.0,
                              bottom: 4,
                            ),
                            child: Text(
                              cards[index].rating.toString(),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.white,

                                fontSize: 18,
                                shadows: [
                                  Shadow(
                                    blurRadius: 6.0,
                                    color: Colors.black,
                                    offset: Offset(2.0, 2.0),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              // Title
            ],
          );
        },
      ),
    );
  }
}

class NewMusicEventModel {
  final String imagePath;
  final String title;

  NewMusicEventModel({required this.imagePath, required this.title});
}

class NewMusicEventModelWidget extends StatelessWidget {
  final List<NewMusicEventModel> cards;

  const NewMusicEventModelWidget({super.key, required this.cards});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200, // Adjust height as needed
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 20),
        itemCount: cards.length,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              // Image Card
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    cards[index].imagePath,
                    width: 300,
                    height: 200,

                    fit: BoxFit.cover,
                  ),
                ),
              ),

              Positioned(
                bottom: 12,
                right: 12,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color.fromARGB(95, 137, 137, 137),
                    minimumSize: const Size(80, 40), // width, height

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text("View"),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class RecommendedMovies {
  final String imagePath;
  final String title;

  RecommendedMovies({required this.imagePath, required this.title});
}

class RecommendedMoviesWidget extends StatelessWidget {
  final List<RecommendedMovies> cards;

  const RecommendedMoviesWidget({super.key, required this.cards});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400, // Adjust height as needed
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 20),
        itemCount: cards.length,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              // Image Card
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    cards[index].imagePath,
                    width: 300,
                    height: 400,

                    fit: BoxFit.cover,
                  ),
                ),
              ),

              Positioned(
                bottom: 12,
                right: 12,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color.fromARGB(95, 137, 137, 137),
                    minimumSize: const Size(100, 40), // width, height

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text("View"),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
