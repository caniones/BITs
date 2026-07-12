unit udmConexion;

interface

uses
  SysUtils, Classes, ZAbstractConnection, ZConnection, IniFiles, Forms, DB,
  ZAbstractRODataset, ZDataset;

type
  TdmConexion = class(TDataModule)
    zConnection: TZConnection;
    zroqOrdenes: TZReadOnlyQuery;
    zroqOrdenesid_orden: TIntegerField;
    zroqOrdenesfecha: TDateTimeField;
    zroqOrdenescliente: TStringField;
    zroqOrdenesequipo_id: TIntegerField;
    zroqOrdenesmarca: TStringField;
    zroqOrdenesmodelo: TStringField;
    zroqOrdenesnumero_serie: TStringField;
    zroqOrdenesfalla: TStringField;
    zroqOrdenesestado_id: TIntegerField;
    zroqOrdenesestado: TStringField;
    zroqOrdenesequipo: TStringField;
    procedure zConnectionBeforeConnect(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    procedure abrirTodo();
  public
    { Public declarations }
    procedure refrescar();
  end;

var
  dmConexion: TdmConexion;

implementation

uses uPublicos;

{$R *.dfm}

procedure TdmConexion.zConnectionBeforeConnect(Sender: TObject);
var
  ini:TIniFile;
  sEntorno: string;
begin
  // configuracion de la conexion con la base de datos segun el entorno
  sEntorno:=uPublicos.LeerIni(ChangeFileExt(
    Application.ExeName,'.INI'), 'CONF','ENTORNO','DEV');
  ini:=TIniFile.Create(ChangeFileExt(Application.ExeName,'.INI'));
  zConnection.LibraryLocation:=ini.ReadString('CONF',
    'LIBRARYLOCATION','');
  if sEntorno = 'DEV' then
    try
      zConnection.HostName:=ini.ReadString('CONF', 'HOSTNAME-DEV','');
      zConnection.Database:=ini.ReadString('CONF', 'DATABASE-DEV','');
      zConnection.Catalog:=ini.ReadString('CONF', 'CATALOG-DEV','');
      zConnection.Port:=ini.ReadInteger('CONF', 'PORT-DEV',5432);
      zConnection.User:=ini.ReadString('CONF', 'USER-DEV','');
      zConnection.Password:=ini.ReadString('CONF', 'PASSWORDS-DEV','');
    finally
      ini.Free;
    end;
  if sEntorno = 'PDR' then
    try
      zConnection.HostName:=ini.ReadString('CONF', 'HOSTNAME-PDR','');
      zConnection.Database:=ini.ReadString('CONF', 'DATABASE-PDR','');
      zConnection.Catalog:=ini.ReadString('CONF', 'CATALOG-PDR','');
      zConnection.Port:=ini.ReadInteger('CONF', 'PORT-PDR',5432);
      zConnection.User:=ini.ReadString('CONF', 'USER-PDR','');
      zConnection.Password:=ini.ReadString('CONF', 'PASSWORDS-PDR','');
    finally
      ini.Free;
    end;
end;

procedure TdmConexion.abrirTodo;
begin
  zroqOrdenes.Close;
  zroqOrdenes.Open;
end;

procedure TdmConexion.refrescar;
begin
  zroqOrdenes.Refresh;
end;

procedure TdmConexion.DataModuleCreate(Sender: TObject);
begin
  self.abrirTodo;
end;

end.
