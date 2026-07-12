unit uAMMarca;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uImputForm, StdCtrls, Buttons, ExtCtrls, Mask, DBCtrls, DB;

type
  TfrmAMMarca = class(TfrmImput)
    dsDatos: TDataSource;
    dbeMarca: TDBEdit;
    Label1: TLabel;
    procedure btnAceptarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    function validarGuardar(): Boolean;
  public
    { Public declarations }
  end;

var
  frmAMMarca: TfrmAMMarca;

implementation

uses udmMarcas;

{$R *.dfm}

procedure TfrmAMMarca.btnAceptarClick(Sender: TObject);
begin
  inherited;
  if self.validarGuardar then
    self.ModalResult:=mrOK
  else
    application.MessageBox('Los campos en naranja son requeridos', 'Atención',
      MB_ICONWARNING);
end;

function TfrmAMMarca.validarGuardar: Boolean;
begin
  result:=false;
  if dbeMarca.Text<>'' then
    result:=true;
end;

procedure TfrmAMMarca.FormShow(Sender: TObject);
begin
  inherited;
  if dsDatos.DataSet.State = dsEdit then
    self.Caption:= self.Caption+' - Modificación de datos';
  if dsDatos.DataSet.State = dsInsert then
    self.Caption:= self.Caption+' - Alta de datos';
end;

end.
