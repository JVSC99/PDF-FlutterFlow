// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:flutter/services.dart' show rootBundle;

Future pdfInvoiceDownload(
  BuildContext context,
  String? title,
  String? equipamento,
  String? implemento,
  String? setor,
  String? local,
  String? responsavel,
  String? status,
  List<String>? servicos,
  List<String>? agente,
  List<String>? epis,
) async {
  // null safety
  title = title ?? '';
  equipamento = equipamento ?? '';
  implemento = implemento ?? '';
  setor = setor ?? '';
  local = local ?? '';
  responsavel = responsavel ?? '';
  status = status ?? '';
  servicos = servicos ?? [''];
  agente = agente ?? [''];
  epis = epis ?? [''];

  final pdf = pw.Document();

  // add network image
  final netImage = await networkImage('https://www.nfet.net/nfet.jpg');

  // add asset image, IMPORTANT! Using assets will not work in Test/Run mode you can only test it using Web Publishing mode or using an actual device!
  /*final bytes =
      (await rootBundle.load('assets/images/demo.png')).buffer.asUint8List();
  final image = pw.MemoryImage(bytes);*/

  pdf.addPage(pw.Page(
      theme: pw.ThemeData.withFont(
        base: await PdfGoogleFonts.varelaRoundRegular(),
        bold: await PdfGoogleFonts.varelaRoundRegular(),
        icons: await PdfGoogleFonts.materialIcons(),
      ),
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Column(children: [
          pw.Text(title ?? '',
              style: const pw.TextStyle(
                color: PdfColors.cyan,
                fontSize: 40,
              )),
          pw.Divider(thickness: 4),
          pw.SizedBox(height: 10),

          //equipamento
          pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Icon(pw.IconData(0xea79), size: 10),
              pw.SizedBox(width: 10),
              pw.Text('Equipamento: ' + (equipamento ?? ''))
            ],
          ),

          //implemento
          pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Icon(pw.IconData(0xef3d), size: 10),
              pw.SizedBox(width: 10),
              pw.Text('Implemento: ' + (implemento ?? ''))
            ],
          ),

          //setor
          pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Icon(pw.IconData(0xe0b8), size: 10),
              pw.SizedBox(width: 10),
              pw.Text('Setor: ' + (setor ?? ''))
            ],
          ),

          //local

          pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Icon(pw.IconData(0xe55e), size: 10),
              pw.SizedBox(width: 10),
              pw.Text('Local: ' + (local ?? ''))
            ],
          ),

          //responsável
          pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Icon(pw.IconData(0xe7fd), size: 10),
              pw.SizedBox(width: 10),
              pw.Text('Responsável: ' + (responsavel ?? ''))
            ],
          ),
          pw.Container(height: 10),
          //status
          pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.SizedBox(width: 10),
              pw.Text('Status: ' + (status ?? ''))
            ],
          ),
          pw.Divider(thickness: 2),
          //servicos
          pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.SizedBox(width: 10),
              pw.Container(
                  child: pw.Text(
                    'Serviços: ' + (servicos.toString() ?? ''),
                    softWrap: true,
                  ),
                  width: 450)
            ],
          ),
          pw.Container(height: 20),
          //agente
          pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.SizedBox(width: 10),
              pw.Container(
                  child: pw.Text(
                    'Agentes Associados: ' + (agente.toString() ?? ''),
                    softWrap: true,
                  ),
                  width: 450)
            ],
          ),
          pw.Container(height: 20),
          //EPIs

          pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.SizedBox(width: 10),
              pw.Container(
                  child: pw.Text(
                    'EPIs: ' + (epis.toString() ?? ''),
                    softWrap: true,
                  ),
                  width: 450)
            ],
          ),
        ]);
      }));

  final pdfSaved = await pdf.save();

  await Printing.layoutPdf(onLayout: (PdfPageFormat format) async => pdfSaved);
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
