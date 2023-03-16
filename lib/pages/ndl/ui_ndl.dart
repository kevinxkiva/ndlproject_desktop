import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ndlproject_desktop/pages/widgets/textview.dart';
import 'package:ndlproject_desktop/themes/colors.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class NdlPage extends StatefulWidget {
  const NdlPage({super.key});

  @override
  State<NdlPage> createState() => _NdlPageState();
}

class _NdlPageState extends State<NdlPage> {
  @override
  void initState() {
    super.initState();
  }

  _showFilter(dw, dh) {
    showDialog(
      barrierDismissible: false,
      useRootNavigator: true,
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ScrollConfiguration(
                behavior: ScrollConfiguration.of(context).copyWith(
                  dragDevices: {
                    PointerDeviceKind.touch,
                    PointerDeviceKind.mouse,
                  },
                ),
                child: SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  controller: ScrollController(),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Center(
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: TextView(
                              val: "Filter Tanggal",
                              color: darkText,
                              size: 25,
                              weight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const Divider(
                          thickness: 1,
                          height: 20,
                          color: darkText,
                        ),
                        Container(
                            padding: const EdgeInsets.fromLTRB(20, 20, 20, 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const TextView(
                                  val: "Masukkan Tanggal",
                                  color: darkText,
                                  size: 16,
                                  weight: FontWeight.w600,
                                ),
                                SizedBox(height: 13),
                                SizedBox(
                                  width: dw * 0.5,
                                  child: Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: darkText,
                                            width: 1,
                                            style: BorderStyle.solid),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: const Align(
                                        alignment: Alignment.centerRight,
                                        child: Padding(
                                          padding: EdgeInsets.all(9),
                                          child: Icon(Icons.calendar_month),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      style: TextButton.styleFrom(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 55, vertical: 22),
                                        primary: Colors.white,
                                        backgroundColor: navButtonThird,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const TextView(
                                        val: "Submit",
                                        color: lightText,
                                        size: 15,
                                        weight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      style: ElevatedButton.styleFrom(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 55, vertical: 22),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          side: const BorderSide(
                                              width: 2, // the thickness
                                              color:
                                                  ColorThird // the color of the border
                                              )),
                                      child: const TextView(
                                        val: "Batal",
                                        color: ColorThird,
                                        size: 15,
                                        weight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    ).whenComplete(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
            dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse}),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          controller: ScrollController(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 5, 0, 5),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        _showFilter(deviceWidth, deviceHeight);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Icon(
                              Icons.filter_alt_rounded,
                              size: 30,
                            ),
                            SizedBox(width: 5),
                            TextView(
                              val: "Filter",
                              color: darkText,
                              weight: FontWeight.w500,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              child: SingleChildScrollView(
                            physics: const ClampingScrollPhysics(),
                            controller: ScrollController(),
                            scrollDirection: Axis.horizontal,
                            child: DataTable(
                              border: TableBorder.all(
                                color: Colors.black.withOpacity(0.5),
                                style: BorderStyle.solid,
                              ),
                              headingRowHeight: 50,
                              dataRowHeight: 50,
                              columns: [
                                datCol("Tambahkan Data Tgl"),
                                datCol("Customer Delivery Date"),
                                datCol("Job Done"),
                                datCol("Durasi"),
                                datCol("Analyzer Version"),
                                datCol("Order Status (New/Repeat)"),
                                datCol("Cylinder Status"),
                                datCol("Gol"),
                                datCol("WS No"),
                                datCol("Customer"),
                                datCol("Item Nama"),
                                datCol("Model"),
                                datCol("Up"),
                                datCol("Repeat"),
                                datCol("Toleransi"),
                                datCol("Order"),
                                datCol("W/S Order (m)"),
                                datCol("Width"),
                                datCol("Length"),
                                datCol("Gusset"),
                                datCol("prod.size"),
                                datCol("W"),
                                datCol("C"),
                                datCol("Color"),
                                datCol("1st Layer"),
                                datCol("Width1"),
                                datCol("RM"),
                                datCol("Diff"),
                                datCol("2nd Layer"),
                                datCol("Width1"),
                                datCol("RM"),
                                datCol("Diff"),
                                datCol("3nd Layer"),
                                datCol("Width1"),
                                datCol("RM"),
                                datCol("Diff"),
                                datCol("4nd Layer"),
                                datCol("Width1"),
                                datCol("RM"),
                                datCol("Diff"),
                                datCol("5nd Layer"),
                                datCol("Width1"),
                                datCol("RM"),
                                datCol("Diff"),
                                datCol("6nd Layer"),
                                datCol("Width1"),
                                datCol("RM"),
                                datCol("Diff"),
                                datCol("1st Layer"),
                                datCol("Ink"),
                                datCol("adh1"),
                                datCol("2nd Layer"),
                                datCol("adh2"),
                                datCol("3nd Layer"),
                                datCol("adh3"),
                                datCol("4nd Layer"),
                                datCol("adh4"),
                                datCol("5nd Layer"),
                                datCol("adh5"),
                                datCol("6nd Layer"),
                                datCol("Total"),
                                //datCol("Aksi"),
                              ],
                              rows: List.generate(
                                1,
                                (index) {
                                  return DataRow(
                                    cells: [
                                      datRow1("02-Jan-23", 1, context),
                                      datRow1("17-Jan-23", 1, context),
                                      datRow1("16-Jan-23", 1, context),
                                      datRow1("14", 2, context),
                                      datRow1("V.161", 1, context),
                                      datRow1("Repeat", 1, context),
                                      datRow1("Tidak Ada", 1, context),
                                      datRow1("S", 1, context),
                                      datRow1("0001", 1, context),
                                      datRow1("Reyner", 1, context),
                                      datRow1(
                                          "Ikan Laut sALMON 70g", 1, context),
                                      datRow1("3SS + Sealed", 1, context),
                                      datRow1("1", 1, context),
                                      datRow1("", 1, context),
                                      datRow1("0", 1, context),
                                      datRow2("66.000", "60.000", context),
                                      datRow1("15.180", 2, context),
                                      datRow1("0.370", 1, context),
                                      datRow1("0.280", 1, context),
                                      datRow1("0.070", 1, context),
                                      datRow1("0.740", 2, context),
                                      datRow1("", 1, context),
                                      datRow1("", 1, context),
                                      datRow1("8", 1, context),
                                      datRow4(
                                          "PET", "15", "u", "1.16", context),
                                      datRow1("0.760", 1, context),
                                      datRow1("", 1, context),
                                      datRow1("-0.760", 2, context),
                                      datRow4(
                                          "PE1", "80", "u", "0.92", context),
                                      datRow1("0.760", 1, context),
                                      datRow1("", 1, context),
                                      datRow1("-0.760", 2, context),
                                      datRow4("", "", "u", "", context),
                                      datRow1("0.760", 1, context),
                                      datRow1("", 1, context),
                                      datRow1("-0.760", 2, context),
                                      datRow4("", "", "u", "", context),
                                      datRow1("0.760", 1, context),
                                      datRow1("", 1, context),
                                      datRow1("-0.760", 2, context),
                                      datRow4("", "", "u", "", context),
                                      datRow1("0.760", 1, context),
                                      datRow1("", 1, context),
                                      datRow1("-0.760", 2, context),
                                      datRow4("", "", "u", "", context),
                                      datRow1("0.760", 1, context),
                                      datRow1("", 1, context),
                                      datRow1("-0.760", 2, context),
                                      datRow1("200.074", 2, context),
                                      datRow1("46.16", 2, context),
                                      datRow1("46.16", 2, context),
                                      datRow1("849.11", 2, context),
                                      datRow1("-", 2, context),
                                      datRow1("-", 2, context),
                                      datRow1("-", 2, context),
                                      datRow1("849.11", 2, context),
                                      datRow1("-", 2, context),
                                      datRow1("849.11", 2, context),
                                      datRow1("-", 2, context),
                                      datRow1("-", 2, context),
                                      datRow1("-", 2, context),
                                      //datRow3(2, context)
                                    ],
                                  );
                                },
                              ),
                            ),
                          )),
                          DataTable(
                            border: TableBorder(
                                top: BorderSide(
                                    color: Colors.black.withOpacity(0.5)),
                                bottom: BorderSide(
                                    color: Colors.black.withOpacity(0.5)),
                                horizontalInside: BorderSide(
                                    color: Colors.black.withOpacity(0.5),
                                    style: BorderStyle.solid)),
                            headingRowHeight: 50,
                            dataRowHeight: 50,
                            columns: [
                              datCol("Aksi"),
                            ],
                            rows: List.generate(
                              1,
                              (index) {
                                return DataRow(
                                  cells: [
                                    datRow3(2, context)
                                    //datRow3(2, context)
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: customFAB(),
    );
  }

  customFAB() {
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: const IconThemeData(size: 22, color: primaryColor),
      backgroundColor: secondaryColor,
      visible: true,
      curve: Curves.bounceIn,
      children: [
        // FAB 1
        SpeedDialChild(
            child: const Icon(
              Icons.download,
              color: primaryColor,
            ),
            backgroundColor: secondaryColor,
            onTap: () {},
            label: 'Download',
            labelStyle: GoogleFonts.inter(
              fontSize: 16,
              color: lightText,
              fontWeight: FontWeight.w500,
            ),
            labelBackgroundColor: secondaryColor),
        // FAB 2
        SpeedDialChild(
            child: const Icon(
              Icons.upload,
              color: primaryColor,
            ),
            backgroundColor: secondaryColor,
            onTap: () {},
            label: 'Upload',
            labelStyle: GoogleFonts.inter(
              fontSize: 16,
              color: lightText,
              fontWeight: FontWeight.w500,
            ),
            labelBackgroundColor: secondaryColor)
      ],
    );
  }
}
