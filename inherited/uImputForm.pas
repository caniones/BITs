unit uImputForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB;

type
  TfrmImput = class(TForm)
    PanelButton: TPanel;
    PanelHeader: TPanel;
    lInfo: TLabel;
    lRequeridos: TLabel;
    btnAceptar: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnSalir: TSpeedButton;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImput: TfrmImput;

implementation

{$R *.dfm}

procedure TfrmImput.btnCancelarClick(Sender: TObject);
begin
  Close();
end;

procedure TfrmImput.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = char(VK_ESCAPE) then
  begin
    key:= #0;
    btnCancelar.Click;
  end;
end;

procedure TfrmImput.FormResize(Sender: TObject);
begin
  // adapto automáticamente los tamños dependiendo del tamaño de la ventana
  PanelHeader.Top:=1;
  PanelHeader.Left:=0;
  PanelHeader.Width:=self.Width-7;
  PanelButton.Left:=0;
  PanelButton.Width:=self.Width-7;
  PanelButton.Top:=self.Height-87;
  if btnSalir.Visible then
  // si el boton salir está visible oculto los otros dos botones y alineo
    begin
    btnAceptar.Visible:=false;
    btnCancelar.Visible:=false;
    // al botón salir lo alineo según el ancho del PanelButton
    btnSalir.Left:=PanelButton.Width-57;
    end
  else
  // si no todo lo contrario
    begin
    btnCancelar.Visible:=true;
    btnCancelar.Left:=PanelButton.Width-57;
    btnAceptar.Visible:=true;
    btnAceptar.Left:=btnCancelar.Left-53;
    end;
end;

end.
