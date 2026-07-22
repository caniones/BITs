unit uRepOrdenTrabajo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uRepBase, QRExport, QRCtrls, QuickRpt, ExtCtrls, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, jpeg;

type
  TfrmRepOrdenTrabajo = class(TfrmRepBase)
    zqOrden: TZQuery;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    zqOrdenDetalle: TZQuery;
    dsOrden: TDataSource;
    zqOrdenDetalleid_orden_detalle: TIntegerField;
    zqOrdenDetallefecha: TDateTimeField;
    zqOrdenDetalleorden_id: TIntegerField;
    zqOrdenDetalledetalle: TStringField;
    zqOrdenDetalletiempo: TTimeField;
    zqOrdenDetalleestado_id: TIntegerField;
    zqOrdenDetalleestado: TStringField;
    QRSubDetail1: TQRSubDetail;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRSubDetail2: TQRSubDetail;
    zqOrdenRepuesto: TZQuery;
    zqOrdenRepuestoid_orden_repuesto: TIntegerField;
    zqOrdenRepuestofecha: TDateTimeField;
    zqOrdenRepuestoorden_id: TIntegerField;
    zqOrdenRepuestodescripcion: TStringField;
    QRDBText6: TQRDBText;
    GroupHeaderBand1: TQRBand;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText10: TQRDBText;
    zqOrdenid_orden: TIntegerField;
    zqOrdenfecha: TDateTimeField;
    zqOrdencliente: TStringField;
    zqOrdentelefono: TStringField;
    zqOrdendireccion: TStringField;
    zqOrdenequipo_id: TIntegerField;
    zqOrdenequipo: TMemoField;
    zqOrdenobservaciones: TStringField;
    zqOrdenfalla: TStringField;
    zqOrdenestado_id: TIntegerField;
    zqOrdenestado: TStringField;
    QRLabel12: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel14: TQRLabel;
    QRDBText13: TQRDBText;
    zroqTiempoTotal: TZReadOnlyQuery;
    zroqTiempoTotaltiempo_total: TStringField;
    QRBand2: TQRBand;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    zroqCostoTotal: TZReadOnlyQuery;
    QRDBText15: TQRDBText;
    qrlTiempo: TQRLabel;
    zroqCostoTotalcosto_total: TFMTBCDField;
    zqOrdenRepuestocosto: TFMTBCDField;
    QRDBText7: TQRDBText;
    procedure qrBaseBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure imprimirOrden(laOrden :integer);
  end;

var
  frmRepOrdenTrabajo: TfrmRepOrdenTrabajo;

implementation

uses udmConexion;

{$R *.dfm}

{ TfrmRepOrdenTrabajo }

procedure TfrmRepOrdenTrabajo.imprimirOrden(laOrden: integer);
begin
  zqOrden.Close;
  zqOrden.ParamByName('id_orden').AsInteger:=laOrden;
  zqOrden.Open;
  zqOrdenDetalle.Close;
  zqOrdenDetalle.Open;
  zqOrdenRepuesto.Close;
  zqOrdenRepuesto.Open;
  zroqTiempoTotal.Close;
  zroqTiempoTotal.Open;
  zroqCostoTotal.Close;
  zroqCostoTotal.Open;
  // es la única forma que encontré para mostrar hh:mm
  qrlTiempo.Caption:=Copy(zroqTiempoTotaltiempo_total.AsString, 1, 5);
end;

procedure TfrmRepOrdenTrabajo.qrBaseBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  inherited;
  qrBase.ReportTitle:='OT'+'-N'+zqOrdenid_orden.AsString+'-'+zqOrdenfecha.AsString;
end;

end.
