unit uRepBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, QRExport;

type
  TfrmRepBase = class(TForm)
    qrBase: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRSysData1: TQRSysData;
    qrlRenglon1: TQRLabel;
    QRCSVFilter1: TQRCSVFilter;
    qrlRenglon2: TQRLabel;
    qrlRenglon3: TQRLabel;
    QRImage1: TQRImage;
    procedure qrBaseBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRepBase: TfrmRepBase;

implementation

uses uPublicos;

{$R *.dfm}

procedure TfrmRepBase.qrBaseBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  // cargo los datos del negocio desde el .ini
  qrlRenglon1.Caption:=uPublicos.LeerIni(ChangeFileExt(Application.ExeName,
    '.INI'), 'IMPRESION', 'RENGLON1', 'NEGOCIO');
  qrlRenglon2.Caption:=uPublicos.LeerIni(ChangeFileExt(Application.ExeName,
    '.INI'), 'IMPRESION', 'RENGLON2', 'TEL');
  qrlRenglon3.Caption:=uPublicos.LeerIni(ChangeFileExt(Application.ExeName,
    '.INI'), 'IMPRESION', 'RENGLON3', 'DIRECCION');
  // le agrega fecha y hora de impresion al titulo del reporte
  qrBase.ReportTitle:=qrBase.ReportTitle+'-'+DateToStr(Date);
end;

end.
