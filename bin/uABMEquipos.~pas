unit uABMEquipos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uABMbase, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, ExtCtrls, Buttons;

type
  TfrmABMEquipos = class(TfrmABMbase)
    cxGridDBTableView1id_equipo: TcxGridDBColumn;
    cxGridDBTableView1cliente_id: TcxGridDBColumn;
    cxGridDBTableView1cliente: TcxGridDBColumn;
    cxGridDBTableView1tipo_equipo_id: TcxGridDBColumn;
    cxGridDBTableView1equipo: TcxGridDBColumn;
    cxGridDBTableView1marca_id: TcxGridDBColumn;
    cxGridDBTableView1marca: TcxGridDBColumn;
    cxGridDBTableView1modelo: TcxGridDBColumn;
    cxGridDBTableView1numero_serie: TcxGridDBColumn;
    cxGridDBTableView1observaciones: TcxGridDBColumn;
    cxGridDBTableView1fecha_alta: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnBajaClick(Sender: TObject);
    procedure btnAltaClick(Sender: TObject);
    procedure btnModiClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmABMEquipos: TfrmABMEquipos;

implementation

uses uAMEquipo, udmEquipos;

var
  dm: TdmEquipos;

{$R *.dfm}

procedure TfrmABMEquipos.FormCreate(Sender: TObject);
begin
  inherited;
  dm:=TdmEquipos.Create(self);
end;

procedure TfrmABMEquipos.FormDestroy(Sender: TObject);
begin
  inherited;
  dm.Free();
end;

procedure TfrmABMEquipos.btnBajaClick(Sender: TObject);
begin
  inherited;
  application.MessageBox('Las bajas se deben solicitar al administrador',
    'Atención',MB_ICONWARNING);
end;

procedure TfrmABMEquipos.btnAltaClick(Sender: TObject);
var
  FInput:TfrmAMEquipo;
begin
  inherited;
  FInput:=TfrmAMEquipo.Create(self);
  try
    dsDatos.DataSet.Insert;
    if FInput.ShowModal = mrOK then
      dm.grabar;
    dsDatos.DataSet.Cancel;
  finally
    FInput.Free;
  end;
end;

procedure TfrmABMEquipos.btnModiClick(Sender: TObject);
var
  FInput:TfrmAMEquipo;
begin
  inherited;
  FInput:=TfrmAMEquipo.Create(self);
  try
    dsDatos.DataSet.Edit;
    if FInput.ShowModal = mrOK then
      dm.grabar;
    dsDatos.DataSet.Cancel;
  finally
    FInput.Free;
  end;
end;

end.
