import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_checkbox_group.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({Key? key}) : super(key: key);

  @override
  _CategoryWidgetState createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  List<String>? checkboxGroupValues;

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 60, 0, 0),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: SingleChildScrollView(
          primary: false,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/9hsjc_2.png',
                width: 190,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 2),
                child: SelectionArea(
                    child: Text(
                  'حدد تصنيف النشاط ',
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Poppins',
                        color: Color(0xFF0184BD),
                        fontSize: 20,
                      ),
                )),
              ),
              StreamBuilder<List<CategoryRecord>>(
                stream: queryCategoryRecord(
                  singleRecord: true,
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator(
                          color: Color(0xFF0184BD),
                        ),
                      ),
                    );
                  }
                  List<CategoryRecord> columnCategoryRecordList =
                      snapshot.data!;
                  // Return an empty Container when the item does not exist.
                  if (snapshot.data!.isEmpty) {
                    return Container();
                  }
                  final columnCategoryRecord =
                      columnCategoryRecordList.isNotEmpty
                          ? columnCategoryRecordList.first
                          : null;
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(7, 7, 55, 7),
                        child: FlutterFlowCheckboxGroup(
                          options: columnCategoryRecord!.name!.toList(),
                          onChanged: (val) =>
                              setState(() => checkboxGroupValues = val),
                          activeColor: Color(0x00000000),
                          checkColor: FlutterFlowTheme.of(context).alternate,
                          checkboxBorderColor: Color(0xFF95A1AC),
                          textStyle:
                              FlutterFlowTheme.of(context).title3.override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF565656),
                                    fontWeight: FontWeight.w600,
                                  ),
                          itemPadding:
                              EdgeInsetsDirectional.fromSTEB(10, 0, 30, 18),
                          initialized: checkboxGroupValues != null,
                        ),
                      ),
                    ],
                  );
                },
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: FFButtonWidget(
                  onPressed: () async {
                    FFAppState().ActCategory = checkboxGroupValues!.toList();
                    Navigator.pop(context);
                  },
                  text: 'إرسال التصنيف\n',
                  options: FFButtonOptions(
                    width: 300,
                    height: 50,
                    color: Color(0xFF1C8EC1),
                    textStyle: GoogleFonts.getFont(
                      'Open Sans',
                      color: Color(0xFFFFFAF1),
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                    ),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 0,
                    ),
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
