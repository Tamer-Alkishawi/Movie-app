import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/api/controllers/action_api_controller.dart';
import 'package:movies_app/api/controllers/thriller_api_controller.dart';
import 'package:movies_app/api/controllers/top_rated_api_controller.dart';
import 'package:movies_app/api/controllers/trending_api_controller.dart';
import 'package:movies_app/widgets/movies_screen_list.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'MOVIES',
                  style: GoogleFonts.cairo(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     Text(
                  //       'Trending',
                  //       style: GoogleFonts.cairo(
                  //         color: const Color(0xff666666),
                  //         fontWeight: FontWeight.w600,
                  //         fontSize: 18,
                  //       ),
                  //     ),
                  //     const SizedBox(
                  //       height: 17,
                  //     ),
                  //     Container(
                  //       height: 300,
                  //       child: SingleChildScrollView(
                  //         scrollDirection: Axis.horizontal,
                  //         child: Row(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: [
                  //             FutureBuilder(
                  //                 future: TrendingApiController().getTrending(),
                  //                 builder: (context, snapshot) {
                  //                   if (snapshot.connectionState ==
                  //                       ConnectionState.waiting) {
                  //                     return const Center(
                  //                       child: CircularProgressIndicator(),
                  //                     );
                  //                   } else if (snapshot.hasData &&
                  //                       snapshot.data!.isNotEmpty) {
                  //                     return ListView.builder(
                  //                       scrollDirection: Axis.horizontal,
                  //                       physics: const NeverScrollableScrollPhysics(),
                  //                       shrinkWrap: true,
                  //                       itemCount: 8,
                  //                       itemBuilder: (context, index) {
                  //                         return Row(
                  //                           children: [
                  //                             Column(
                  //                               children: [
                  //                                 Container(
                  //                                   height: 210,
                  //                                   width: 140,
                  //                                   clipBehavior: Clip.antiAlias,
                  //                                   decoration: BoxDecoration(
                  //                                       borderRadius:
                  //                                           BorderRadius.circular(6),
                  //                                       boxShadow: const [
                  //                                         BoxShadow(
                  //                                           color: Color(0xff000000),
                  //                                           spreadRadius: 0,
                  //                                           blurRadius: 10,
                  //                                           offset: Offset(0, 10),
                  //                                         )
                  //                                       ]),
                  //                                   child: Image.network(
                  //                                       ApiSettings.imagePath +
                  //                                           snapshot.data![index]
                  //                                               .posterPath),
                  //                                 ),
                  //                                 const SizedBox(
                  //                                   height: 20,
                  //                                 ),
                  //                                 Container(
                  //                                   width: 140,
                  //                                   child: Text(
                  //                                     snapshot.data![index].title,
                  //                                     textAlign: TextAlign.center,
                  //                                     overflow: TextOverflow.fade,
                  //                                     style: GoogleFonts.cairo(
                  //                                       height: 1,
                  //                                       color:
                  //                                           const Color(0xff222222),
                  //                                       fontSize: 15,
                  //                                     ),
                  //                                   ),
                  //                                 ),
                  //                               ],
                  //                             ),
                  //                             const SizedBox(
                  //                               width: 20,
                  //                             ),
                  //                           ],
                  //                         );
                  //                       },
                  //                     );
                  //                   } else {
                  //                     return const Center(
                  //                       child: Text('No Data'),
                  //                     );
                  //                   }
                  //                 }),
                  //             GestureDetector(
                  //               onTap: () {},
                  //               child: Container(
                  //                 decoration: BoxDecoration(
                  //                   color: const Color(0xffFECB2F),
                  //                   borderRadius: BorderRadius.circular(6),
                  //                 ),
                  //                 height: 210,
                  //                 width: 140,
                  //                 child: Center(
                  //                   child: Text(
                  //                     'MORE',
                  //                     style: GoogleFonts.cairo(
                  //                       color: Colors.white,
                  //                       fontWeight: FontWeight.w600,
                  //                       fontSize: 20,
                  //                     ),
                  //                   ),
                  //                 ),
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  MoviesScreenList(
                    title: 'Trending',
                    future: TrendingApiController().getTrending(),
                    onTap: () {},
                  ),
                  MoviesScreenList(
                    title: 'TopRated',
                    future: TopRatedApiController().getTopRated(),
                    onTap: () {},
                  ),
                  MoviesScreenList(
                    title: 'Action',
                    future: ActionApiController().getAction(),
                    onTap: () {},
                  ),
                  MoviesScreenList(
                    title: 'Thriller',
                    future: ThrillerApiController().getThriller(),
                    onTap: () {},
                  ),
                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     Text(
                  //       'Top Rated',
                  //       style: GoogleFonts.cairo(
                  //         color: const Color(0xff666666),
                  //         fontWeight: FontWeight.w600,
                  //         fontSize: 18,
                  //       ),
                  //     ),
                  //     const SizedBox(
                  //       height: 17,
                  //     ),
                  //     Container(
                  //       height: 250,
                  //       child: SingleChildScrollView(
                  //         scrollDirection: Axis.horizontal,
                  //         child: Row(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: [
                  //             FutureBuilder<List<TopRatedApi>>(
                  //                 future: TopRatedApiController().getTopRated(),
                  //                 builder: (context, snapshot) {
                  //                   if (snapshot.connectionState ==
                  //                       ConnectionState.waiting) {
                  //                     return const Center(
                  //                       child: CircularProgressIndicator(),
                  //                     );
                  //                   } else if (snapshot.hasData &&
                  //                       snapshot.data!.isNotEmpty) {
                  //                     return ListView.builder(
                  //                       scrollDirection: Axis.horizontal,
                  //                       physics: const NeverScrollableScrollPhysics(),
                  //                       shrinkWrap: true,
                  //                       itemCount: 8,
                  //                       itemBuilder: (context, index) {
                  //                         return Row(
                  //                           children: [
                  //                             Column(
                  //                               children: [
                  //                                 Container(
                  //                                   height: 210,
                  //                                   width: 140,
                  //                                   clipBehavior: Clip.antiAlias,
                  //                                   decoration: BoxDecoration(
                  //                                       borderRadius:
                  //                                           BorderRadius.circular(6),
                  //                                       boxShadow: const [
                  //                                         BoxShadow(
                  //                                           color: Color(0xff000000),
                  //                                           spreadRadius: 0,
                  //                                           blurRadius: 10,
                  //                                           offset: Offset(0, 10),
                  //                                         )
                  //                                       ]),
                  //                                   child: Image.network(
                  //                                       ApiSettings.imagePath +
                  //                                           snapshot.data![index]
                  //                                               .posterPath),
                  //                                 ),
                  //                                 const SizedBox(
                  //                                   height: 10,
                  //                                 ),
                  //                               ],
                  //                             ),
                  //                             const SizedBox(
                  //                               width: 20,
                  //                             ),
                  //                           ],
                  //                         );
                  //                       },
                  //                     );
                  //                   } else {
                  //                     return const Center(
                  //                       child: Text('No Data'),
                  //                     );
                  //                   }
                  //                 }),
                  //             GestureDetector(
                  //               onTap: () {},
                  //               child: Container(
                  //                 decoration: BoxDecoration(
                  //                   color: const Color(0xffFECB2F),
                  //                   borderRadius: BorderRadius.circular(6),
                  //                 ),
                  //                 height: 210,
                  //                 width: 140,
                  //                 child: Center(
                  //                   child: Text(
                  //                     'MORE',
                  //                     style: GoogleFonts.cairo(
                  //                       color: Colors.white,
                  //                       fontWeight: FontWeight.w600,
                  //                       fontSize: 20,
                  //                     ),
                  //                   ),
                  //                 ),
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     Text(
                  //       'Action',
                  //       style: GoogleFonts.cairo(
                  //         color: const Color(0xff666666),
                  //         fontWeight: FontWeight.w600,
                  //         fontSize: 18,
                  //       ),
                  //     ),
                  //     const SizedBox(
                  //       height: 17,
                  //     ),
                  //     Container(
                  //       height: 250,
                  //       child: SingleChildScrollView(
                  //         scrollDirection: Axis.horizontal,
                  //         child: Row(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: [
                  //             FutureBuilder<List<ActionApi>>(
                  //                 future: ActionApiController().getAction(),
                  //                 builder: (context, snapshot) {
                  //                   if (snapshot.connectionState ==
                  //                       ConnectionState.waiting) {
                  //                     return const Center(
                  //                       child: CircularProgressIndicator(),
                  //                     );
                  //                   } else if (snapshot.hasData &&
                  //                       snapshot.data!.isNotEmpty) {
                  //                     return ListView.builder(
                  //                       scrollDirection: Axis.horizontal,
                  //                       physics: const NeverScrollableScrollPhysics(),
                  //                       shrinkWrap: true,
                  //                       itemCount: 8,
                  //                       itemBuilder: (context, index) {
                  //                         return Row(
                  //                           children: [
                  //                             Column(
                  //                               children: [
                  //                                 Container(
                  //                                   height: 210,
                  //                                   width: 140,
                  //                                   clipBehavior: Clip.antiAlias,
                  //                                   decoration: BoxDecoration(
                  //                                       borderRadius:
                  //                                           BorderRadius.circular(6),
                  //                                       boxShadow: const [
                  //                                         BoxShadow(
                  //                                           color: Color(0xff000000),
                  //                                           spreadRadius: 0,
                  //                                           blurRadius: 10,
                  //                                           offset: Offset(0, 10),
                  //                                         )
                  //                                       ]),
                  //                                   child: Image.network(
                  //                                       ApiSettings.imagePath +
                  //                                           snapshot.data![index]
                  //                                               .posterPath),
                  //                                 ),
                  //                                 const SizedBox(
                  //                                   height: 10,
                  //                                 ),
                  //                               ],
                  //                             ),
                  //                             const SizedBox(
                  //                               width: 20,
                  //                             ),
                  //                           ],
                  //                         );
                  //                       },
                  //                     );
                  //                   } else {
                  //                     return const Center(
                  //                       child: Text('No Data'),
                  //                     );
                  //                   }
                  //                 }),
                  //             GestureDetector(
                  //               onTap: () {
                  //                 Navigator.pushNamed(
                  //                     context, '/action_movies_screen');
                  //               },
                  //               child: Container(
                  //                 decoration: BoxDecoration(
                  //                   color: const Color(0xffFECB2F),
                  //                   borderRadius: BorderRadius.circular(6),
                  //                 ),
                  //                 height: 210,
                  //                 width: 140,
                  //                 child: Center(
                  //                   child: Text(
                  //                     'MORE',
                  //                     style: GoogleFonts.cairo(
                  //                       color: Colors.white,
                  //                       fontWeight: FontWeight.w600,
                  //                       fontSize: 20,
                  //                     ),
                  //                   ),
                  //                 ),
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     Text(
                  //       'Thriller',
                  //       style: GoogleFonts.cairo(
                  //         color: const Color(0xff666666),
                  //         fontWeight: FontWeight.w600,
                  //         fontSize: 18,
                  //       ),
                  //     ),
                  //     const SizedBox(
                  //       height: 17,
                  //     ),
                  //     Container(
                  //       height: 300,
                  //       child: SingleChildScrollView(
                  //         scrollDirection: Axis.horizontal,
                  //         child: Row(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: [
                  //             FutureBuilder<List<ThrillerApi>>(
                  //                 future: ThrillerApiController().getThriller(),
                  //                 builder: (context, snapshot) {
                  //                   if (snapshot.connectionState ==
                  //                       ConnectionState.waiting) {
                  //                     return const Center(
                  //                       child: CircularProgressIndicator(),
                  //                     );
                  //                   } else if (snapshot.hasData &&
                  //                       snapshot.data!.isNotEmpty) {
                  //                     return ListView.builder(
                  //                       scrollDirection: Axis.horizontal,
                  //                       physics: const NeverScrollableScrollPhysics(),
                  //                       shrinkWrap: true,
                  //                       itemCount: 8,
                  //                       itemBuilder: (context, index) {
                  //                         return Row(
                  //                           children: [
                  //                             Column(
                  //                               children: [
                  //                                 Container(
                  //                                   height: 210,
                  //                                   width: 140,
                  //                                   clipBehavior: Clip.antiAlias,
                  //                                   decoration: BoxDecoration(
                  //                                       borderRadius:
                  //                                           BorderRadius.circular(6),
                  //                                       boxShadow: const [
                  //                                         BoxShadow(
                  //                                           color: Color(0xff000000),
                  //                                           spreadRadius: 0,
                  //                                           blurRadius: 10,
                  //                                           offset: Offset(0, 10),
                  //                                         )
                  //                                       ]),
                  //                                   child: Image.network(
                  //                                       ApiSettings.imagePath +
                  //                                           snapshot.data![index]
                  //                                               .posterPath),
                  //                                 ),
                  //                                 const SizedBox(
                  //                                   height: 20,
                  //                                 ),
                  //                                 Container(
                  //                                   width: 140,
                  //                                   child: Text(
                  //                                     snapshot.data![index].title,
                  //                                     textAlign: TextAlign.center,
                  //                                     overflow: TextOverflow.fade,
                  //                                     style: GoogleFonts.cairo(
                  //                                       height: 1,
                  //                                       color:
                  //                                           const Color(0xff222222),
                  //                                       fontSize: 15,
                  //                                     ),
                  //                                   ),
                  //                                 ),
                  //                               ],
                  //                             ),
                  //                             const SizedBox(
                  //                               width: 20,
                  //                             ),
                  //                           ],
                  //                         );
                  //                       },
                  //                     );
                  //                   } else {
                  //                     return const Center(
                  //                       child: Text('No Data'),
                  //                     );
                  //                   }
                  //                 }),
                  //             GestureDetector(
                  //               onTap: () {},
                  //               child: Container(
                  //                 decoration: BoxDecoration(
                  //                   color: const Color(0xffFECB2F),
                  //                   borderRadius: BorderRadius.circular(6),
                  //                 ),
                  //                 height: 210,
                  //                 width: 140,
                  //                 child: Center(
                  //                   child: Text(
                  //                     'MORE',
                  //                     style: GoogleFonts.cairo(
                  //                       color: Colors.white,
                  //                       fontWeight: FontWeight.w600,
                  //                       fontSize: 20,
                  //                     ),
                  //                   ),
                  //                 ),
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
