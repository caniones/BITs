unit uABMClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uABMbase, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, ExtCtrls, Buttons;

type
  TfrmABMClientes = class(TfrmABMbase)
    cxGridDBTableView1id_cliente: TcxGridDBColumn;
    cxGridDBTableView1cliente: TcxGridDBColumn;
    cxGridDBTableView1telefono: TcxGridDBColumn;
    cxGridDBTableView1email: TcxGridDBColumn;
    cxGridDBTableView1direccion: TcxGridDBColumn;
    cxGridDBTableView1observaciones: TcxGridDBColumn;
    cxGridDBTableView1fecha_alta: TcxGridDBColumn;
    cxGridDBTableView1fecha_baja: TcxGridDBColumn;
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
  frmABMClientes: TfrmABMClientes;

implementation

uses udmClientes, uAMCliente;

var
  dm: TdmClientes;

{$R *.dfm}

procedure TfrmABMClientes.FormCreate(Sender: TObject);
begin
  inherited;
  dm:= TdmClientes.Create(self);
end;

procedure TfrmABMClientes.FormDestroy(Sender: TObject);
begin
  inherited;
  dm.FreeOnRelease;
end;

procedure TfrmABMClientes.btnAltaClick(Sender: TObject);
var
  FInput:TfrmAMCliente;
begin
  inherited;
  FInput:=TfrmAMCliente.Create(self);
  try
    dsDatos.DataSet.Insert;
    if FInput.ShowModal = mrOK then
      dm.grabar;
    dsDatos.DataSet.Cancel;
  finally
    FInput.Free;
  end;
end;

procedure TfrmABMClientes.btnModiClick(Sender: TObject);
var
  FInput:TfrmAMCliente;
begin
  inherited;
  FInput:=TfrmAMCliente.Create(self);
  try
    dsDatos.DataSet.Edit;
    if FInput.ShowModal = mrOK then
      dm.grabar;
    dsDatos.DataSet.Cancel;
  finally
    FInput.Free;
  end;
end;

procedure TfrmABMClientes.btnBajaClick(Sender: TObject);
begin
  inherited;
  if not dsDatos.DataSet.IsEmpty then
    if application.MessageBox('¿Desea dar de baja el cliente seleccionado?  '
      +#13+#13, 'Atención',MB_YESNO + MB_ICONWARNING) = 6 Then
      try
        dsDatos.DataSet.Delete;
        dm.grabar;
      finally
        dsDatos.DataSet.Cancel;
      end;
end;

end.
