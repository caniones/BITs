unit uAMOrdenTrabajoDetalle;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uImputForm, StdCtrls, Buttons, ExtCtrls, DB, DBCtrls, ComCtrls;

type
  TfrmAMOrdenTrabajoDetalle = class(TfrmImput)
    dsDatos: TDataSource;
    dtpFecha: TDateTimePicker;
    dtpTiempo: TDateTimePicker;
    dbmDetalle: TDBMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    dsEstados: TDataSource;
    dblcEstado: TDBLookupComboBox;
    procedure btnAceptarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    function validarGuardar(): Boolean;
  public
    { Public declarations }
  end;

var
  frmAMOrdenTrabajoDetalle: TfrmAMOrdenTrabajoDetalle;

implementation

uses udmOrdenesTrabajos;

{$R *.dfm}

procedure TfrmAMOrdenTrabajoDetalle.btnAceptarClick(Sender: TObject);
begin
  inherited;
  if self.validarGuardar then
    begin
    dblcEstado.SetFocus;
    dbmDetalle.SetFocus;
    dtpFecha.Time:=time;
    dsDatos.DataSet.FieldByName('fecha').AsDateTime:=dtpFecha.Date;
    dsDatos.DataSet.FieldByName('tiempo').AsDateTime:=dtpTiempo.Time;
    self.ModalResult:=mrOK;
    end
  else
    application.MessageBox('Los campos en naranja son requeridos', 'Atención',
      MB_ICONERROR);
end;

function TfrmAMOrdenTrabajoDetalle.validarGuardar: Boolean;
begin
  result:=false;
  if (dblcEstado.KeyValue <> null) then
    result:=true;
end;

procedure TfrmAMOrdenTrabajoDetalle.FormShow(Sender: TObject);
begin
  inherited;
  if dsDatos.DataSet.State = dsInsert then
    begin
    dtpFecha.Date:=date;
    dtpTiempo.Time:=date;
    dblcEstado.SetFocus;
    end;
  if dsDatos.DataSet.State = dsEdit then
    begin
    dtpFecha.Date:=dsDatos.DataSet.FieldByName('fecha').AsDateTime;
    dtpTiempo.Time:=dsDatos.DataSet.FieldByName('tiempo').AsDateTime;
    dbmDetalle.SetFocus;
    end;
end;

end.
