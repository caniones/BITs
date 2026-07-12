unit uAMOrdenTrabajoRepuesto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uImputForm, StdCtrls, Buttons, ExtCtrls, Mask, DBCtrls, DB;

type
  TfrmAMOrdenTrabajoRepuesto = class(TfrmImput)
    dsDatos: TDataSource;
    dbeDescripcion: TDBEdit;
    Label1: TLabel;
    dbeCosto: TDBEdit;
    Label2: TLabel;
    procedure btnAceptarClick(Sender: TObject);
  private
    { Private declarations }
    function validarGuardar(): Boolean;
  public
    { Public declarations }
  end;

var
  frmAMOrdenTrabajoRepuesto: TfrmAMOrdenTrabajoRepuesto;

implementation

uses udmOrdenesTrabajos;

{$R *.dfm}

{ TfrmAMOrdenTrabajoRepuesto }

function TfrmAMOrdenTrabajoRepuesto.validarGuardar: Boolean;
begin
  result:=false;
  if (dbeDescripcion.Text <> '') and (dbeCosto.Text <> '') then
    result:=true;
end;

procedure TfrmAMOrdenTrabajoRepuesto.btnAceptarClick(Sender: TObject);
begin
  inherited;
  if self.validarGuardar then
    self.ModalResult:=mrOK
  else
    application.MessageBox('Los campos en naranja son requeridos', 'Atención',
      MB_ICONERROR);
end;

end.
