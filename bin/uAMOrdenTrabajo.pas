unit uAMOrdenTrabajo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uImputForm, StdCtrls, Buttons, ExtCtrls, DB, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, DBCtrls, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, Menus,
  ComCtrls;

type
  TfrmAMOrdenTrabajo = class(TfrmImput)
    cxgEquiposDBTableView1: TcxGridDBTableView;
    cxgEquiposLevel1: TcxGridLevel;
    cxgEquipos: TcxGrid;
    dsDatos: TDataSource;
    dbmFalla: TDBMemo;
    dsEquipos: TDataSource;
    cxgDetallesDBTableView1: TcxGridDBTableView;
    cxgDetallesLevel1: TcxGridLevel;
    cxgDetalles: TcxGrid;
    dsOrdenesDetalles: TDataSource;
    cxgRepuestosDBTableView1: TcxGridDBTableView;
    cxgRepuestosLevel1: TcxGridLevel;
    cxgRepuestos: TcxGrid;
    dsOrdenesRepuestos: TDataSource;
    gbOrdenDetalle: TGroupBox;
    DBLookupComboBox1: TDBLookupComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    PopupMenuDetalle: TPopupMenu;
    AgregarDetalle1: TMenuItem;
    ModificarDetalle1: TMenuItem;
    N1: TMenuItem;
    BorrarDetalle1: TMenuItem;
    PopupMenuRespuesto: TPopupMenu;
    AgregarRepuesto1: TMenuItem;
    ModificarRepuesto1: TMenuItem;
    N2: TMenuItem;
    EliminarRepuesto1: TMenuItem;
    Label6: TLabel;
    btnDetalleEquipo: TSpeedButton;
    dsTiempo: TDataSource;
    dbtCostoTotal: TDBText;
    dsCosto: TDataSource;
    cxgDetallesDBTableView1id_orden_detalle: TcxGridDBColumn;
    cxgDetallesDBTableView1fecha: TcxGridDBColumn;
    cxgDetallesDBTableView1orden_id: TcxGridDBColumn;
    cxgDetallesDBTableView1detalle: TcxGridDBColumn;
    cxgDetallesDBTableView1tiempo: TcxGridDBColumn;
    cxgDetallesDBTableView1estado_id: TcxGridDBColumn;
    cxgDetallesDBTableView1estado: TcxGridDBColumn;
    cxgEquiposDBTableView1id_equipo: TcxGridDBColumn;
    cxgEquiposDBTableView1cliente_id: TcxGridDBColumn;
    cxgEquiposDBTableView1cliente: TcxGridDBColumn;
    cxgEquiposDBTableView1tipo_equipo_id: TcxGridDBColumn;
    cxgEquiposDBTableView1equipo: TcxGridDBColumn;
    cxgEquiposDBTableView1marca_id: TcxGridDBColumn;
    cxgEquiposDBTableView1marca: TcxGridDBColumn;
    cxgEquiposDBTableView1modelo: TcxGridDBColumn;
    cxgEquiposDBTableView1numero_serie: TcxGridDBColumn;
    cxgEquiposDBTableView1observaciones: TcxGridDBColumn;
    cxgEquiposDBTableView1fecha_alta: TcxGridDBColumn;
    cxgRepuestosDBTableView1id_orden_repuesto: TcxGridDBColumn;
    cxgRepuestosDBTableView1fecha: TcxGridDBColumn;
    cxgRepuestosDBTableView1orden_id: TcxGridDBColumn;
    cxgRepuestosDBTableView1descripcion: TcxGridDBColumn;
    cxgRepuestosDBTableView1costo: TcxGridDBColumn;
    dbtIdOrden: TDBText;
    dbtFecha: TDBText;
    dbtEstado: TDBText;
    lTiempoTotal: TLabel;
    procedure btnAceptarClick(Sender: TObject);
    procedure AgregarDetalle1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ModificarDetalle1Click(Sender: TObject);
    procedure BorrarDetalle1Click(Sender: TObject);
    procedure AgregarRepuesto1Click(Sender: TObject);
    procedure btnDetalleEquipoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure cxgDetallesDBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure EliminarRepuesto1Click(Sender: TObject);
    procedure ModificarRepuesto1Click(Sender: TObject);
    procedure cxgDetallesDBTableView1DblClick(Sender: TObject);
    procedure cxgRepuestosDBTableView1DblClick(Sender: TObject);
  private
    { Private declarations }
    procedure actualizarLabelTiempo();
  public
    { Public declarations }
    procedure insertarOrden();
    procedure modificarOrden(idOrden: integer);
    procedure grabar();
    procedure cancelarTodo();
  end;

var
  frmAMOrdenTrabajo: TfrmAMOrdenTrabajo;

implementation

uses udmOrdenesTrabajos, udmOrdenesTrabajosDetalles,
  uAMOrdenTrabajoDetalle, uAMOrdenTrabajoRepuesto, uAMEquipoDetalle,
  uPublicos;

var
  dmOrdenes: TdmOrdenesTrabajos;

{$R *.dfm}

procedure TfrmAMOrdenTrabajo.btnAceptarClick(Sender: TObject);
begin
  inherited;
  ModalResult:=mrOk;
end;

procedure TfrmAMOrdenTrabajo.AgregarDetalle1Click(Sender: TObject);
var
  FFormulario: TfrmAMOrdenTrabajoDetalle;
begin
  inherited;
  FFormulario:=TfrmAMOrdenTrabajoDetalle.Create(self);
  try
    dmOrdenes.insertarOrdenDetalle;
    if FFormulario.ShowModal = mrOK then
      dmOrdenes.grabarDetalle;
    self.actualizarLabelTiempo;
    dsOrdenesDetalles.DataSet.Cancel;
  finally
    FFormulario.Free;
  end;
end;

procedure TfrmAMOrdenTrabajo.ModificarDetalle1Click(Sender: TObject);
var
  FFormulario: TfrmAMOrdenTrabajoDetalle;
begin
  inherited;
  FFormulario:=TfrmAMOrdenTrabajoDetalle.Create(self);
  try
    dmOrdenes.modificarOrdenDetalle;
    if FFormulario.ShowModal = mrOK then
      dmOrdenes.grabarDetalle;
    self.actualizarLabelTiempo;
    dsOrdenesDetalles.DataSet.Cancel;
  finally
    FFormulario.Free;
  end;
end;

procedure TfrmAMOrdenTrabajo.BorrarDetalle1Click(Sender: TObject);
begin
  inherited;
  if not dsOrdenesDetalles.DataSet.IsEmpty then
    if application.MessageBox('¿Desea eliminar el registro seleccionado?  '+#13+#13,
      'Atención',MB_YESNO + MB_ICONWARNING) = 6 Then
      try
        dsOrdenesDetalles.DataSet.Delete;
        dmOrdenes.grabarDetalle;
        dmOrdenes.refrescarDetalle;
      finally
        dsOrdenesDetalles.DataSet.Cancel;
      end;
end;

procedure TfrmAMOrdenTrabajo.FormCreate(Sender: TObject);
begin
  inherited;
  dmOrdenes:=TdmOrdenesTrabajos.Create(self);
end;

procedure TfrmAMOrdenTrabajo.insertarOrden;
begin
  dmOrdenes.insertarOrden;
end;

procedure TfrmAMOrdenTrabajo.grabar;
begin
  dmOrdenes.grabar;
end;

procedure TfrmAMOrdenTrabajo.cancelarTodo;
begin
  dmOrdenes.cancelarTodo;
end;

procedure TfrmAMOrdenTrabajo.FormDestroy(Sender: TObject);
begin
  inherited;
  dmOrdenes.Free;
end;

procedure TfrmAMOrdenTrabajo.modificarOrden(idOrden: integer);
begin
  dmOrdenes.modificarOrden(idOrden);
end;

procedure TfrmAMOrdenTrabajo.AgregarRepuesto1Click(Sender: TObject);
var
  FFormulario: TfrmAMOrdenTrabajoRepuesto;
begin
  inherited;
  FFormulario:=TfrmAMOrdenTrabajoRepuesto.Create(self);
  try
    dmOrdenes.insertarOrdenRepuesto;
    if FFormulario.ShowModal = mrOK then
      dmOrdenes.grabarRepuesto;
    dsOrdenesRepuestos.DataSet.Cancel;
  finally
    FFormulario.Free;
  end;
end;

procedure TfrmAMOrdenTrabajo.btnDetalleEquipoClick(Sender: TObject);
var
  FFormulario: TfrmAMEquipoDetalle;
  iTipo: integer;
begin
  inherited;
  FFormulario:=TfrmAMEquipoDetalle.Create(self);
  try
    iTipo:=dsEquipos.DataSet.FieldByName('tipo_equipo_id').AsInteger;
    if iTipo = 1 then // es notebook
      begin
      dmOrdenes.agregarDetalleEquipoNotebook;
      FFormulario.verComoNB;
      if FFormulario.ShowModal = mrOK then
        dmOrdenes.grabarDetalleEquipoNotebook;
      end;
    if iTipo = 2 then // es PC
      begin
      dmOrdenes.agregarDetalleEquipoPC;
      FFormulario.verComoPC;
      if FFormulario.ShowModal = mrOK then
        dmOrdenes.grabarDetalleEquipoPC;
      end;
    if iTipo > 2 then
      application.MessageBox('No se programó ésta función del equipo aún',
        'Atención', MB_ICONINFORMATION);
  finally
    FFormulario.Free;
  end;
end;

procedure TfrmAMOrdenTrabajo.FormShow(Sender: TObject);
begin
  inherited;
  if dsDatos.State = dsInsert then
    begin
    gbOrdenDetalle.Visible:=false;
    end;
  self.actualizarLabelTiempo;
end;

procedure TfrmAMOrdenTrabajo.FormResize(Sender: TObject);
begin
  //inherited;
  // anulo la herencia porque al ser de borde sazeable no funciona bien
  // adapto automáticamente los tamños dependiendo del tamaño de la ventana
  PanelHeader.Top:=1;
  PanelHeader.Left:=0;
  PanelHeader.Width:=self.Width-9;
  PanelButton.Left:=0;
  PanelButton.Width:=self.Width-9;
  PanelButton.Top:=self.Height-89;
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
  //
  if dsDatos.State = dsInsert then
    begin
    cxgEquipos.Width:=self.Width-27;
    end;
  if dsDatos.State = dsEdit then
    begin
    gbOrdenDetalle.Left:=self.Width-gbOrdenDetalle.Width-18;
    cxgEquipos.Width:=self.Width-gbOrdenDetalle.Width-32;
    cxgEquipos.Enabled:=false;
    dbmFalla.Width:=cxgEquipos.Width;
    end;
  // tamaño minimo del formulario
  if self.Height < 600 then
    self.Height:=600;
  if self.Width < 960 then
    self.Width:=960;
  cxgDetalles.Width:=self.Width-27;
  cxgDetalles.Height:=self.Height-513;
  cxgRepuestos.Width:=cxgDetalles.Width;
  cxgRepuestos.Top:=self.Height-193;
end;

procedure TfrmAMOrdenTrabajo.cxgDetallesDBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;
  if(AViewInfo.GridRecord.Values[cxgDetallesDBTableView1estado_id.Index]=100) then
      begin
      ACanvas.Brush.Color:=StringToColor(uPublicos.LeerIni(ChangeFileExt(
        Application.ExeName,'.INI'), 'GRILLAS','100',''));
      ACanvas.Font.Color:=clBlack;
      end;
  if(AViewInfo.GridRecord.Values[cxgDetallesDBTableView1estado_id.Index]=200) then
      begin
      ACanvas.Brush.Color:=StringToColor(uPublicos.LeerIni(ChangeFileExt(
        Application.ExeName,'.INI'), 'GRILLAS','200',''));
      ACanvas.Font.Color:=clBlack;
      end;
  if(AViewInfo.GridRecord.Values[cxgDetallesDBTableView1estado_id.Index]=300) then
      begin
      ACanvas.Brush.Color:=StringToColor(uPublicos.LeerIni(ChangeFileExt(
        Application.ExeName,'.INI'), 'GRILLAS','300',''));
      ACanvas.Font.Color:=clBlack;
      end;
  if(AViewInfo.GridRecord.Values[cxgDetallesDBTableView1estado_id.Index]=400) then
      begin
      ACanvas.Brush.Color:=StringToColor(uPublicos.LeerIni(ChangeFileExt(
        Application.ExeName,'.INI'), 'GRILLAS','400',''));
      ACanvas.Font.Color:=clBlack;
      end;
  if(AViewInfo.GridRecord.Values[cxgDetallesDBTableView1estado_id.Index]=500) then
      begin
      ACanvas.Brush.Color:=StringToColor(uPublicos.LeerIni(ChangeFileExt(
        Application.ExeName,'.INI'), 'GRILLAS','500',''));
      ACanvas.Font.Color:=clBlack;
      end;
  if(AViewInfo.GridRecord.Values[cxgDetallesDBTableView1estado_id.Index]=600) then
      begin
      ACanvas.Brush.Color:=StringToColor(uPublicos.LeerIni(ChangeFileExt(
        Application.ExeName,'.INI'), 'GRILLAS','600',''));
      ACanvas.Font.Color:=clBlack;
      end;
  if(AViewInfo.GridRecord.Values[cxgDetallesDBTableView1estado_id.Index]=700) then
      begin
      ACanvas.Brush.Color:=StringToColor(uPublicos.LeerIni(ChangeFileExt(
        Application.ExeName,'.INI'), 'GRILLAS','700',''));
      ACanvas.Font.Color:=clBlack;
      end;
  if(AViewInfo.GridRecord.Values[cxgDetallesDBTableView1estado_id.Index]=800) then
      begin
      ACanvas.Brush.Color:=StringToColor(uPublicos.LeerIni(ChangeFileExt(
        Application.ExeName,'.INI'), 'GRILLAS','800',''));
      ACanvas.Font.Color:=clBlack;
      end;
end;

procedure TfrmAMOrdenTrabajo.EliminarRepuesto1Click(Sender: TObject);
begin
  inherited;
  if not dsOrdenesRepuestos.DataSet.IsEmpty then
    if application.MessageBox('¿Desea eliminar el registro seleccionado?  '+#13+#13,
      'Atención',MB_YESNO + MB_ICONWARNING) = 6 Then
      try
        dsOrdenesRepuestos.DataSet.Delete;
        dmOrdenes.grabarRepuesto;;
      finally
        dsOrdenesRepuestos.DataSet.Cancel;
      end;
end;

procedure TfrmAMOrdenTrabajo.ModificarRepuesto1Click(Sender: TObject);
var
  FFormulario: TfrmAMOrdenTrabajoRepuesto;
begin
  inherited;
  FFormulario:=TfrmAMOrdenTrabajoRepuesto.Create(self);
  try
    dmOrdenes.modificarOrdenRepuesto;
    if FFormulario.ShowModal = mrOK then
      dmOrdenes.grabarRepuesto;
    dsOrdenesRepuestos.DataSet.Cancel;
  finally
    FFormulario.Free;
  end;
end;

procedure TfrmAMOrdenTrabajo.cxgDetallesDBTableView1DblClick(
  Sender: TObject);
begin
  inherited;
  ModificarDetalle1.Click;
end;

procedure TfrmAMOrdenTrabajo.cxgRepuestosDBTableView1DblClick(
  Sender: TObject);
begin
  inherited;
  ModificarRepuesto1.Click;
end;

procedure TfrmAMOrdenTrabajo.actualizarLabelTiempo;
begin
  lTiempoTotal.Caption:=
    Copy(dsTiempo.DataSet.FieldByName('tiempo_total').AsString, 1, 5);
  //Copy(zroqTiempoTotaltiempo_total.AsString, 1, 5);
end;

end.
