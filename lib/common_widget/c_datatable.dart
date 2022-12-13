import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class Cdatatable extends StatelessWidget {
  const Cdatatable({Key? key, this.tableBorder, this.border, required this.row, required this.columns, this.headingRowColor}) : super(key: key);
  final List<DataRow> row;
  final List<DataColumn> columns;
  final Color? headingRowColor;
  final bool? tableBorder;
  final bool? border;

  @override
  Widget build(BuildContext context) {
    return DataTable2(
      empty: Center(
        child: Text(
          'Photography Manager',
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
      headingRowColor: MaterialStateProperty.all(headingRowColor),
      columns: columns,
      rows: row,
      headingRowHeight: 45,
      lmRatio: 2,
      dividerThickness: 0,
      horizontalMargin: 25,
      columnSpacing: 10,
      showBottomBorder: true,
      decoration: border == true
          ? BoxDecoration(
              border: Border.all(
                color: Colors.indigo.shade100,
                strokeAlign: StrokeAlign.inside,
              ),
              borderRadius: BorderRadius.circular(3),
            )
          : null,
      border: tableBorder == true
          ? TableBorder(
              borderRadius: BorderRadius.circular(15),
              verticalInside: BorderSide(color: Colors.indigo.shade100),
              top: BorderSide(color: Colors.indigo.shade100, strokeAlign: StrokeAlign.inside),
              bottom: BorderSide(color: Colors.indigo.shade100, strokeAlign: StrokeAlign.inside),
              left: BorderSide(color: Colors.indigo.shade100, strokeAlign: StrokeAlign.inside),
              right: BorderSide(color: Colors.indigo.shade100, strokeAlign: StrokeAlign.inside),
            )
          : TableBorder(
              // borderRadius: BorderRadius.circular(15),
              horizontalInside: BorderSide(color: Colors.indigo.shade50),
              // top: BorderSide(color: Colors.indigo.shade100, strokeAlign: StrokeAlign.inside),
              // bottom: BorderSide(color: Colors.indigo.shade100, strokeAlign: StrokeAlign.inside),
              // left: BorderSide(color: Colors.indigo.shade100, strokeAlign: StrokeAlign.inside),
              // right: BorderSide(color: Colors.indigo.shade100, strokeAlign: StrokeAlign.inside),
            ),
    );
  }
}
