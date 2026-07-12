unit udmEquipos;

interface

uses
  SysUtils, Classes, ZAbstractConnection, ZSequence, ZSqlUpdate, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TdmEquipos = class(TDataModule)
    zqEquipos: TZQuery;
    zusEquipos: TZUpdateSQL;
    zsEquipos: TZSequence;
    zqEquiposid_equipo: TIntegerField;
    zqEquiposcliente_id: TIntegerField;
    zqEquiposcliente: TStringField;
    zqEquipostipo_equipo_id: TIntegerField;
    zqEquiposequipo: TStringField;
    zqEquiposmarca_id: TIntegerField;
    zqEquiposmarca: TStringField;
    zqEquiposmodelo: TStringField;
    zqEquiposnumero_serie: TStringField;
    zqEquiposobservaciones: TStringField;
    zqEquiposfecha_alta: TDateTimeField;
    zroqClientes: TZReadOnlyQuery;
    zroqMarcas: TZReadOnlyQuery;
    zroqTiposEquipos: TZReadOnlyQuery;
    zroqMarcasid_marca: TIntegerField;
    zroqMarcasmarca: TStringField;
    zroqClientesid_cliente: TIntegerField;
    zroqClientescliente: TStringField;
    zroqClientestelefono: TStringField;
    zroqClientesemail: TStringField;
    zroqClientesdireccion: TStringField;
    zroqClientesobservaciones: TStringField;
    zroqClientesfecha_alta: TDateTimeField;
    zroqClientesfecha_baja: TDateTimeField;
    zroqTiposEquiposid_tipo_equipo: TIntegerField;
    zroqTiposEquiposequipo: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    procedure abrirDM();
    procedure refrescar();
  public
    { Public declarations }
    procedure grabar();
  end;

var
  dmEquipos: TdmEquipos;

implementation

uses udmConexion;

{$R *.dfm}

{ TdmEquipos }

procedure TdmEquipos.abrirDM;
begin
  zroqClientes.Close;
  zroqClientes.Open;
  zroqMarcas.Close;
  zroqMarcas.Open;
  zroqTiposEquipos.Close;
  zroqTiposEquipos.Open;
  zqEquipos.Close;
  zqEquipos.Open;
end;

procedure TdmEquipos.grabar;
begin
  try
    zqEquipos.ApplyUpdates;
    zqEquipos.Connection.Commit;
  except
    zqEquipos.Connection.Rollback;
  end;
  self.refrescar;
end;

procedure TdmEquipos.DataModuleCreate(Sender: TObject);
begin
  self.abrirDM;
end;

procedure TdmEquipos.refrescar;
begin
  zqEquipos.Refresh;
end;

end.
