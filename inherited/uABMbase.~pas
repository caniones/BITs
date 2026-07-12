unit uABMbase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, DB, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid;

type
  TfrmABMbase = class(TForm)
    dsDatos: TDataSource;
    Panel1: TPanel;
    btnAlta: TSpeedButton;
    btnBaja: TSpeedButton;
    btnModi: TSpeedButton;
    btnSalir: TSpeedButton;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGrid: TcxGrid;
    procedure btnSalirClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormResize(Sender: TObject);
    procedure cxGridDBTableView1DblClick(Sender: TObject);
    procedure cxGridDBTableView1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmABMbase: TfrmABMbase;

implementation

uses uImputForm;

{$R *.dfm}

procedure TfrmABMbase.btnSalirClick(Sender: TObject);
begin
  Close();
end;

procedure TfrmABMbase.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = char(VK_ESCAPE) then
    begin
    key:= #0;
    btnSalir.Click;
    end;
end;

procedure TfrmABMbase.FormResize(Sender: TObject);
begin
  if self.Height < 508 then
    self.Height:=508;
  if self.Width < 801 then
    self.Width:=801;
  Panel1.Width:=self.Width-8;
  btnModi.Left:=Panel1.Width-57;
  btnBaja.Left:=btnModi.Left-53;
  btnAlta.Left:=btnBaja.Left-53;
  cxGrid.Height:=self.Height-155;
  cxGrid.Width:=self.Width-16;
  btnSalir.Top:=self.Height-84;
  btnSalir.Left:=self.Width-65;
end;

procedure TfrmABMbase.cxGridDBTableView1DblClick(Sender: TObject);
begin
  btnModi.Click;
end;

procedure TfrmABMbase.cxGridDBTableView1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = char(VK_RETURN) then
    begin
    key:= #0;
    btnModi.Click;
    end;
end;

end.
