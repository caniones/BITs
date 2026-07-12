unit udmOrdenesTrabajos;

interface

uses
  SysUtils, Classes, DB, ZSqlUpdate, ZAbstractRODataset, ZAbstractDataset,
  ZAbstractTable, ZDataset, ZAbstractConnection, ZSequence;

type
  TdmOrdenesTrabajos = class(TDataModule)
    zusOrdenes: TZUpdateSQL;
    zusOrdenesDetalles: TZUpdateSQL;
    zusOrdenesRepuestos: TZUpdateSQL;
    dsOrdenes: TDataSource;
    zqOrdenes: TZQuery;
    zqOrdenesDetalles: TZQuery;
    zqOrdenesRepuestos: TZQuery;
    zqOrdenesDetallesid_orden_detalle: TIntegerField;
    zqOrdenesDetallesfecha: TDateTimeField;
    zqOrdenesDetallesorden_id: TIntegerField;
    zqOrdenesDetallesdetalle: TStringField;
    zqOrdenesDetallestiempo: TTimeField;
    zqOrdenesDetallesestado_id: TIntegerField;
    zqOrdenesid_orden: TIntegerField;
    zqOrdenesfecha: TDateTimeField;
    zqOrdenesequipo_id: TIntegerField;
    zqOrdenesfalla: TStringField;
    zroqEquipos: TZReadOnlyQuery;
    zroqEquiposid_equipo: TIntegerField;
    zroqEquiposcliente_id: TIntegerField;
    zroqEquiposcliente: TStringField;
    zroqEquipostipo_equipo_id: TIntegerField;
    zroqEquiposequipo: TStringField;
    zroqEquiposmarca_id: TIntegerField;
    zroqEquiposmarca: TStringField;
    zroqEquiposmodelo: TStringField;
    zroqEquiposnumero_serie: TStringField;
    zroqEquiposobservaciones: TStringField;
    zroqEquiposfecha_alta: TDateTimeField;
    zsOrdenes: TZSequence;
    zsOrdenesDetalles: TZSequence;
    zsOrdenesRepuestos: TZSequence;
    zqOrdenesRepuestosid_orden_repuesto: TIntegerField;
    zqOrdenesRepuestosfecha: TDateTimeField;
    zqOrdenesRepuestosorden_id: TIntegerField;
    zqOrdenesRepuestosdescripcion: TStringField;
    zqOrdenesRepuestoscosto: TBCDField;
    zqOrdenesestado_id: TIntegerField;
    zqOrdenesdescripcion: TStringField;
    zroqEstados: TZReadOnlyQuery;
    zroqEstadosid_estado: TIntegerField;
    zroqEstadosestado: TStringField;
    zroqEstadosdescripcion: TStringField;
    zqEquiposNotebook: TZQuery;
    dsEquipos: TDataSource;
    zqEquiposPC: TZQuery;
    zusEquiposNoteboook: TZUpdateSQL;
    zusEquiposPC: TZUpdateSQL;
    zqOrdenesestado: TStringField;
    zroqTiempoTotal: TZReadOnlyQuery;
    zroqCostoTotal: TZReadOnlyQuery;
    zroqCostoTotalcosto_total: TBCDField;
    zqOrdenesDetallesestado: TStringField;
    zroqTiempoTotaltiempo_total: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    procedure abrirTodo();
    procedure insertarIngreso();
  public
    { Public declarations }
    procedure insertarOrden();
    procedure modificarOrden(idOrden: integer);
    procedure insertarOrdenDetalle();
    procedure modificarOrdenDetalle();
    procedure insertarOrdenRepuesto();
    procedure modificarOrdenRepuesto();
    procedure agregarDetalleEquipoPC();
    procedure agregarDetalleEquipoNotebook();
    procedure grabar();
    procedure grabarDetalle();
    procedure grabarRepuesto();
    procedure grabarDetalleEquipoPC();
    procedure grabarDetalleEquipoNotebook();
    procedure refrescarOrden();
    procedure refrescarEquipo();
    procedure refrescarDetalle();
    procedure refrescarRepuesto();
    procedure cancelarTodo();
  end;

var
  dmOrdenesTrabajos: TdmOrdenesTrabajos;

implementation

uses udmConexion;

{$R *.dfm}

procedure TdmOrdenesTrabajos.abrirTodo;
begin
  zqOrdenes.Close;
  zqOrdenes.Open;
  zqOrdenesDetalles.Close;
  zqOrdenesDetalles.Open;
  zqOrdenesRepuestos.Close;
  zqOrdenesRepuestos.Open;
  zroqEquipos.Close;
  zroqEquipos.Open;
  zroqEstados.Close;
  zroqEstados.Open;
  zroqTiempoTotal.Close;
  zroqTiempoTotal.Open;
  zroqCostoTotal.Close;
  zroqCostoTotal.Open;
end;

procedure TdmOrdenesTrabajos.agregarDetalleEquipoNotebook;
begin
  zqEquiposNotebook.Close;
  zqEquiposNotebook.Open;
  if zqEquiposNotebook.IsEmpty then
    zqEquiposNotebook.Insert
  else
    zqEquiposNotebook.Edit;
end;

procedure TdmOrdenesTrabajos.agregarDetalleEquipoPC;
begin
  zqEquiposPC.Close;
  zqEquiposPC.Open;
  if zqEquiposPC.IsEmpty then
    zqEquiposPC.Insert
  else
    zqEquiposPC.Edit;
end;

procedure TdmOrdenesTrabajos.cancelarTodo;
begin
  zqOrdenes.Cancel;
  zqOrdenesDetalles.Cancel;
end;

procedure TdmOrdenesTrabajos.DataModuleCreate(Sender: TObject);
begin
  self.abrirTodo;
end;

procedure TdmOrdenesTrabajos.grabar;
var
  insert: boolean;
begin
  //
  insert:=false;
  if (zqOrdenes.State = dsInsert) then
    begin
    zqOrdenesequipo_id.Value:=zroqEquiposid_equipo.Value;
    insert:=true;
    end;
  zqOrdenes.CheckBrowseMode;
  zqOrdenes.ApplyUpdates;
  zqOrdenes.Connection.Commit;
  zqOrdenesid_orden.AsInteger;
  if insert then
    self.insertarIngreso;
  self.refrescarOrden;
end;

procedure TdmOrdenesTrabajos.grabarDetalle;
begin
  zqOrdenesDetalles.CheckBrowseMode;
  zqOrdenesDetalles.ApplyUpdates;
  zqOrdenesDetalles.Connection.Commit;
  self.refrescarDetalle
end;

procedure TdmOrdenesTrabajos.grabarDetalleEquipoNotebook;
begin
  zqEquiposNotebook.CheckBrowseMode;
  zqEquiposNotebook.ApplyUpdates;
  zqEquiposNotebook.Connection.Commit;
end;

procedure TdmOrdenesTrabajos.grabarDetalleEquipoPC;
begin
  zqEquiposPC.CheckBrowseMode;
  zqEquiposPC.ApplyUpdates;
  zqEquiposPC.Connection.Commit;
end;

procedure TdmOrdenesTrabajos.grabarRepuesto;
begin
  zqOrdenesRepuestos.CheckBrowseMode;
  zqOrdenesRepuestos.ApplyUpdates;
  zqOrdenesRepuestos.Connection.Commit;
  self.refrescarRepuesto
end;

procedure TdmOrdenesTrabajos.insertarIngreso;
begin
  // cuando se crea una OT hago un insert en detalle con el ingreso del equipo
  zqOrdenesDetalles.Insert;
  zqOrdenesDetallesorden_id.Value:=zqOrdenesid_orden.Value;
  zqOrdenesDetallesdetalle.AsString:='Equipo ingresado';
  zqOrdenesDetallestiempo.AsDateTime:=StrToTime('00:00:00');
  zqOrdenesDetallesestado_id.AsInteger:=100;
  self.grabarDetalle;
end;

procedure TdmOrdenesTrabajos.insertarOrden;
begin
  self.refrescarOrden;
  zqOrdenes.Insert;
  zqOrdenesfalla.AsString:='La falla?';
end;

procedure TdmOrdenesTrabajos.insertarOrdenDetalle;
begin
  zqOrdenesDetalles.Insert;
  zqOrdenesDetallesorden_id.Value:=zqOrdenesid_orden.Value;
end;

procedure TdmOrdenesTrabajos.insertarOrdenRepuesto;
begin
  zqOrdenesRepuestos.Insert;
  zqOrdenesRepuestosorden_id.Value:=zqOrdenesid_orden.Value;
end;

procedure TdmOrdenesTrabajos.modificarOrden(idOrden: integer);
begin
  zqOrdenes.Close;
  zqOrdenes.ParamByName('id_orden').AsInteger:=idOrden;
  zqOrdenes.Open;
  self.refrescarOrden;
  zroqEquipos.Lookup('id_equipo', zqOrdenesequipo_id.AsInteger, 'id_equipo');
  zqOrdenes.Edit;
end;

procedure TdmOrdenesTrabajos.modificarOrdenDetalle;
begin
  zqOrdenesDetalles.Edit;
end;

procedure TdmOrdenesTrabajos.modificarOrdenRepuesto;
begin
  zqOrdenesRepuestos.Edit;
end;

procedure TdmOrdenesTrabajos.refrescarDetalle;
begin
  zqOrdenesDetalles.Refresh;
  zroqTiempoTotal.Refresh;
end;

procedure TdmOrdenesTrabajos.refrescarEquipo;
begin
  zroqEquipos.Refresh;
  zqEquiposNotebook.Refresh;
  zqEquiposPC.Refresh;
end;

procedure TdmOrdenesTrabajos.refrescarOrden;
begin
  zqOrdenes.Refresh;
  zqOrdenesDetalles.Refresh;
  zqOrdenesRepuestos.Refresh;
  zroqTiempoTotal.Close;
  zroqTiempoTotal.Open;
  zroqCostoTotal.Refresh;
  zroqEstados.Refresh;
end;

procedure TdmOrdenesTrabajos.refrescarRepuesto;
begin
  zqOrdenesRepuestos.Refresh;
  zroqCostoTotal.Refresh;
end;

end.
