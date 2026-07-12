unit uAMCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uImputForm, StdCtrls, Buttons, ExtCtrls, DBCtrls, Mask, DB;

type
  TfrmAMCliente = class(TfrmImput)
    dsDatos: TDataSource;
    dbeCliente: TDBEdit;
    Label1: TLabel;
    dbeTelefono: TDBEdit;
    Label2: TLabel;
    dbeMail: TDBEdit;
    Label3: TLabel;
    dbeDireccion: TDBEdit;
    Label4: TLabel;
    dbmObservaciones: TDBMemo;
    Label5: TLabel;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    dbtFechaAlta: TDBText;
    dbtFechaBaja: TDBText;
    btnRecuperar: TSpeedButton;
    procedure btnAceptarClick(Sender: TObject);
    procedure btnRecuperarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    function validarGuardar(): Boolean;
  public
    { Public declarations }
  end;

var
  frmAMCliente: TfrmAMCliente;

implementation

uses udmClientes;

{$R *.dfm}

procedure TfrmAMCliente.btnAceptarClick(Sender: TObject);
begin
  inherited;
  if self.validarGuardar then
    self.ModalResult:=mrOK
  else
    application.MessageBox('Los campos en naranja son requeridos', 'Atención',
      MB_ICONWARNING);
end;

function TfrmAMCliente.validarGuardar: Boolean;
begin
  result:=false;
  if dbeCliente.Text<>'' then
    result:=true;
end;

procedure TfrmAMCliente.btnRecuperarClick(Sender: TObject);
begin
  inherited;
  dsDatos.DataSet.FieldByName('fecha_baja').Clear;
end;

procedure TfrmAMCliente.FormShow(Sender: TObject);
begin
  inherited;
  if dsDatos.DataSet.State = dsEdit then
    self.Caption:= self.Caption+' - Modificación de datos';
  if dsDatos.DataSet.State = dsInsert then
    self.Caption:= self.Caption+' - Alta de datos';
end;

end.
