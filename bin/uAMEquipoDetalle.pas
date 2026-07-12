unit uAMEquipoDetalle;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uImputForm, StdCtrls, Buttons, ExtCtrls, DB, Mask, DBCtrls;

type
  TfrmAMEquipoDetalle = class(TfrmImput)
    gbNotebook: TGroupBox;
    gbPC: TGroupBox;
    dsEquiposNotebook: TDataSource;
    dsEquiposPC: TDataSource;
    dbePantallaNB: TDBEdit;
    dbeProcesadorNB: TDBEdit;
    dbeMemoriaNB: TDBEdit;
    dbeDiscoNB: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    dbeProcesadorPC: TDBEdit;
    dbeMemoriaPC: TDBEdit;
    dbeDiscoPC: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    procedure btnAceptarClick(Sender: TObject);
  private
    { Private declarations }
    function validarGuardar(): Boolean;
  public
    { Public declarations }
    procedure verComoPC();
    procedure verComoNB();
  end;

var
  frmAMEquipoDetalle: TfrmAMEquipoDetalle;

implementation

uses udmOrdenesTrabajos;


{$R *.dfm}

{ TfrmAMEquipoDetalle }

function TfrmAMEquipoDetalle.validarGuardar: Boolean;
begin
  result:=false;
  if gbPC.Visible then
    if (dbeProcesadorPC.Text <> '') and (dbeMemoriaPC.Text <> '')
      and (dbeDiscoPC.Text <> '') then
      result:=true;
  if gbNotebook.Visible then
    if (dbePantallaNB.Text <> '') and (dbeProcesadorNB.Text <> '') and
      (dbeMemoriaNB.Text <> '') and (dbeDiscoNB.Text <> '') then
      result:=true;
end;

procedure TfrmAMEquipoDetalle.verComoNB;
begin
  gbPC.Visible:=false;
end;

procedure TfrmAMEquipoDetalle.verComoPC;
begin
  gbNotebook.Visible:=false;
  // pogo el mismo left al momento de ejecutar y en diseño queda como esta
  gbPC.Left:=gbNotebook.Left;
end;

procedure TfrmAMEquipoDetalle.btnAceptarClick(Sender: TObject);
begin
  inherited;
  if self.validarGuardar then
    self.ModalResult:=mrOK
  else
    application.MessageBox('Los campos en naranja son requeridos', 'Atención',
      MB_ICONWARNING);
end;

end.
