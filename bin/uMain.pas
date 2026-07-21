unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid;

type
  TfrmMain = class(TForm)
    MainMenu: TMainMenu;
    Archivo1: TMenuItem;
    ABMs1: TMenuItem;
    OrdenDeTrabajo1: TMenuItem;
    SALIR1: TMenuItem;
    Clientes1: TMenuItem;
    Equipos1: TMenuItem;
    Marcas1: TMenuItem;
    cxgDatosDBTableView1: TcxGridDBTableView;
    cxgDatosLevel1: TcxGridLevel;
    cxgDatos: TcxGrid;
    dsDatos: TDataSource;
    PopupMenu: TPopupMenu;
    popupNuevaOrdenTrabajo: TMenuItem;
    popupModificarOrdenTrabajo: TMenuItem;
    NuevaOrdenTrabajo: TMenuItem;
    ModificarOrdenTrabajo: TMenuItem;
    cxgDatosDBTableView1id_orden: TcxGridDBColumn;
    cxgDatosDBTableView1fecha: TcxGridDBColumn;
    cxgDatosDBTableView1cliente: TcxGridDBColumn;
    cxgDatosDBTableView1equipo_id: TcxGridDBColumn;
    cxgDatosDBTableView1equipo: TcxGridDBColumn;
    cxgDatosDBTableView1marca: TcxGridDBColumn;
    cxgDatosDBTableView1modelo: TcxGridDBColumn;
    cxgDatosDBTableView1numero_serie: TcxGridDBColumn;
    cxgDatosDBTableView1falla: TcxGridDBColumn;
    cxgDatosDBTableView1estado_id: TcxGridDBColumn;
    cxgDatosDBTableView1estado: TcxGridDBColumn;
    N1: TMenuItem;
    popupImprimirOrdenTrabajo: TMenuItem;
    N2: TMenuItem;
    ImprimirOrdenTrabajo: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure SALIR1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Marcas1Click(Sender: TObject);
    procedure Equipos1Click(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure NuevaOrdenTrabajoClick(Sender: TObject);
    procedure ModificarOrdenTrabajoClick(Sender: TObject);
    procedure popupNuevaOrdenTrabajoClick(Sender: TObject);
    procedure popupModificarOrdenTrabajoClick(Sender: TObject);
    procedure cxgDatosDBTableView1DblClick(Sender: TObject);
    procedure cxgDatosDBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure ImprimirOrdenTrabajoClick(Sender: TObject);
    procedure popupImprimirOrdenTrabajoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses uPublicos, udmConexion, udmOrdenesTrabajos, uAMOrdenTrabajo,
  uABMMarcas, uABMEquipos, uABMClientes, uRepOrdenTrabajo;

var
  dmConexion: TdmConexion;

{$R *.dfm}

procedure TfrmMain.FormCreate(Sender: TObject);
var
  sEntorno: string;
begin
  // configuracion inicial del sistema
  DecimalSeparator:='.';
  ThousandSeparator:=',';
  DateSeparator:='/';
  ShortDateFormat:='dd/mm/yy';
  LongDateFormat:='dd/mm/yyyy';
  ShortTimeFormat:='hh:mm am/pm';
  LongTimeFormat:='hh:mm am/pm';
  // titulo del sistema segun en que entorno estoy
  sEntorno:=uPublicos.LeerIni(ChangeFileExt(
    Application.ExeName,'.INI'), 'CONF','ENTORNO','DEV');
  if sEntorno = 'DEV' then
    self.Caption:=self.Caption+uPublicos.LeerIni(ChangeFileExt(
      Application.ExeName,'.INI'), 'CONF','CAPTION-DEV','');
  if sEntorno = 'PDR' then
    self.Caption:=self.Caption+uPublicos.LeerIni(ChangeFileExt(
      Application.ExeName,'.INI'), 'CONF','CAPTION-PDR','');
  dmConexion:=TdmConexion.Create(self);
end;

procedure TfrmMain.SALIR1Click(Sender: TObject);
begin
  dmConexion.Free;
  self.Close;
end;

procedure TfrmMain.FormResize(Sender: TObject);
begin
  // tamaño minimo
  if self.Height < 562 then
    self.Height:=562;
  if self.Width < 900 then
    self.Width:=900;
  cxgDatos.Height:=self.Height-65;
  cxgDatos.Width:=self.Width-18;
end;

procedure TfrmMain.Marcas1Click(Sender: TObject);
var
  FFormulario:TfrmABMMarcas;
begin
  FFormulario:=TfrmABMMarcas.Create(self);
  try
    // si el main está maximizada, la ventana que se crea también
    FFormulario.WindowState:=self.WindowState;
    FFormulario.ShowModal;
  finally
    FFormulario.Free;
  end;
  dmConexion.refrescar;
end;

procedure TfrmMain.Equipos1Click(Sender: TObject);
var
  FFormulario:TfrmABMEquipos;
begin
  FFormulario:=TfrmABMEquipos.Create(self);
  try
    // si el main está maximizada, la ventana que se crea también
    FFormulario.WindowState:=self.WindowState;
    FFormulario.ShowModal;
  finally
    FFormulario.Free;
  end;
  dmConexion.refrescar;
end;

procedure TfrmMain.Clientes1Click(Sender: TObject);
var
  FFormulario:TfrmABMClientes;
begin
  FFormulario:=TfrmABMClientes.Create(self);
  try
    // si el main está maximizada, la ventana que se crea también
    FFormulario.WindowState:=self.WindowState;
    FFormulario.ShowModal;
  finally
    FFormulario.Free;
  end;
  dmConexion.refrescar;
end;

procedure TfrmMain.NuevaOrdenTrabajoClick(Sender: TObject);
var
  FFormulario: TfrmAMOrdenTrabajo;
begin
  FFormulario:=TfrmAMOrdenTrabajo.Create(self);
  try
    // si el main está maximizada, la ventana que se crea también
    FFormulario.WindowState:=self.WindowState;
    FFormulario.insertarOrden;
    if FFormulario.ShowModal = mrOK then
      begin
      FFormulario.grabar;
      end
    else
      FFormulario.cancelarTodo;
  finally
    FFormulario.Free;
  end;
  dmConexion.refrescar;
end;

procedure TfrmMain.ModificarOrdenTrabajoClick(Sender: TObject);
var
  FFormulario: TfrmAMOrdenTrabajo;
begin
  FFormulario:=TfrmAMOrdenTrabajo.Create(self);
  try
    // si el main está maximizada, la ventana que se crea también
    FFormulario.WindowState:=self.WindowState;
    FFormulario.modificarOrden(dsDatos.DataSet.FieldByName('id_orden').Value);
    if FFormulario.ShowModal = mrOK then
      begin
      FFormulario.grabar;
      end
    else
      FFormulario.cancelarTodo
  finally
    FFormulario.Free;
  end;
  dmConexion.refrescar;
end;

procedure TfrmMain.popupNuevaOrdenTrabajoClick(Sender: TObject);
begin
  self.NuevaOrdenTrabajo.Click;
end;

procedure TfrmMain.popupModificarOrdenTrabajoClick(Sender: TObject);
begin
  self.ModificarOrdenTrabajo.Click;
end;

procedure TfrmMain.cxgDatosDBTableView1DblClick(Sender: TObject);
begin
  self.ModificarOrdenTrabajo.Click;
end;

procedure TfrmMain.cxgDatosDBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if(AViewInfo.GridRecord.Values[cxgDatosDBTableView1estado_id.Index]=100) then
      begin
      ACanvas.Brush.Color:=StringToColor(uPublicos.LeerIni(ChangeFileExt(
        Application.ExeName,'.INI'), 'GRILLAS','100',''));
      ACanvas.Font.Color:=clBlack;
      end;
  if(AViewInfo.GridRecord.Values[cxgDatosDBTableView1estado_id.Index]=200) then
      begin
      ACanvas.Brush.Color:=StringToColor(uPublicos.LeerIni(ChangeFileExt(
        Application.ExeName,'.INI'), 'GRILLAS','200',''));
      ACanvas.Font.Color:=clBlack;
      end;
  if(AViewInfo.GridRecord.Values[cxgDatosDBTableView1estado_id.Index]=300) then
      begin
      ACanvas.Brush.Color:=StringToColor(uPublicos.LeerIni(ChangeFileExt(
        Application.ExeName,'.INI'), 'GRILLAS','300',''));
      ACanvas.Font.Color:=clBlack;
      end;
  if(AViewInfo.GridRecord.Values[cxgDatosDBTableView1estado_id.Index]=400) then
      begin
      ACanvas.Brush.Color:=StringToColor(uPublicos.LeerIni(ChangeFileExt(
        Application.ExeName,'.INI'), 'GRILLAS','400',''));
      ACanvas.Font.Color:=clBlack;
      end;
  if(AViewInfo.GridRecord.Values[cxgDatosDBTableView1estado_id.Index]=500) then
      begin
      ACanvas.Brush.Color:=StringToColor(uPublicos.LeerIni(ChangeFileExt(
        Application.ExeName,'.INI'), 'GRILLAS','500',''));
      ACanvas.Font.Color:=clBlack;
      end;
  if(AViewInfo.GridRecord.Values[cxgDatosDBTableView1estado_id.Index]=600) then
      begin
      ACanvas.Brush.Color:=StringToColor(uPublicos.LeerIni(ChangeFileExt(
        Application.ExeName,'.INI'), 'GRILLAS','600',''));
      ACanvas.Font.Color:=clBlack;
      end;
  if(AViewInfo.GridRecord.Values[cxgDatosDBTableView1estado_id.Index]=700) then
      begin
      ACanvas.Brush.Color:=StringToColor(uPublicos.LeerIni(ChangeFileExt(
        Application.ExeName,'.INI'), 'GRILLAS','700',''));
      ACanvas.Font.Color:=clBlack;
      end;
  if(AViewInfo.GridRecord.Values[cxgDatosDBTableView1estado_id.Index]=800) then
      begin
      ACanvas.Brush.Color:=StringToColor(uPublicos.LeerIni(ChangeFileExt(
        Application.ExeName,'.INI'), 'GRILLAS','800',''));
      ACanvas.Font.Color:=clBlack;
      end;
  if(AViewInfo.GridRecord.Values[cxgDatosDBTableView1estado_id.Index]=900) then
      begin
      ACanvas.Brush.Color:=StringToColor(uPublicos.LeerIni(ChangeFileExt(
        Application.ExeName,'.INI'), 'GRILLAS','900',''));
      ACanvas.Font.Color:=clBlack;
      end;
end;

procedure TfrmMain.ImprimirOrdenTrabajoClick(Sender: TObject);
var
  FRep:TfrmRepOrdenTrabajo;
begin
  if not dsDatos.DataSet.IsEmpty then
    begin
    FRep:=TfrmRepOrdenTrabajo.Create(self);
    FRep.imprimirOrden(dsDatos.DataSet.FieldByName('id_orden').Value);
    FRep.qrBase.PreviewModal;
    FRep.Free;
    end;
end;

procedure TfrmMain.popupImprimirOrdenTrabajoClick(Sender: TObject);
begin
  self.ImprimirOrdenTrabajo.Click;
end;

end.
