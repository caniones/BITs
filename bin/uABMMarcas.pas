unit uABMMarcas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uABMbase, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, ExtCtrls, Buttons;

type
  TfrmABMMarcas = class(TfrmABMbase)
    cxGridDBTableView1id_marca: TcxGridDBColumn;
    cxGridDBTableView1marca: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnAltaClick(Sender: TObject);
    procedure btnModiClick(Sender: TObject);
    procedure btnBajaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmABMMarcas: TfrmABMMarcas;

implementation

uses udmMarcas, uAMMarca;

var
  dm: TdmMarcas;

{$R *.dfm}

procedure TfrmABMMarcas.FormCreate(Sender: TObject);
begin
  inherited;
  dm:=TdmMarcas.Create(self);
end;

procedure TfrmABMMarcas.FormDestroy(Sender: TObject);
begin
  inherited;
  dm.Free;
end;

procedure TfrmABMMarcas.btnAltaClick(Sender: TObject);
var
  FInput:TfrmAMMarca;
begin
  inherited;
  FInput:=TfrmAMMarca.Create(self);
  try
    dsDatos.DataSet.Insert;
    if FInput.ShowModal = mrOK then
      dm.grabar;
    dsDatos.DataSet.Cancel;
  finally
    FInput.Free;
  end;
end;

procedure TfrmABMMarcas.btnModiClick(Sender: TObject);
var
  FInput:TfrmAMMarca;
begin
  inherited;
  FInput:=TfrmAMMarca.Create(self);
  try
    dsDatos.DataSet.Edit;
    if FInput.ShowModal = mrOK then
      dm.grabar;
    dsDatos.DataSet.Cancel;
  finally
    FInput.Free;
  end;
end;

procedure TfrmABMMarcas.btnBajaClick(Sender: TObject);
begin
  inherited;
  application.MessageBox('Las bajas se deben solicitar al administrador',
    'Atención',MB_ICONWARNING);
end;

end.
