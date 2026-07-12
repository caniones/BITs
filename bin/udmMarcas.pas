unit udmMarcas;

interface

uses
  SysUtils, Classes, DB, ZSqlUpdate, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, ZAbstractConnection, ZSequence;

type
  TdmMarcas = class(TDataModule)
    zqMarcas: TZQuery;
    zusMarcas: TZUpdateSQL;
    zqMarcasid_marca: TIntegerField;
    zqMarcasmarca: TStringField;
    zsMarcas: TZSequence;
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
  dmMarcas: TdmMarcas;

implementation

uses udmConexion;

{$R *.dfm}

procedure TdmMarcas.abrirDM;
begin
  zqMarcas.Close;
  zqMarcas.Open;
end;

procedure TdmMarcas.DataModuleCreate(Sender: TObject);
begin
  self.abrirDM;
end;

procedure TdmMarcas.grabar;
begin
  try
    zqMarcas.ApplyUpdates;
    zqMarcas.Connection.Commit;
  except
    zqMarcas.Connection.Rollback;
  end;
  self.refrescar;
end;

procedure TdmMarcas.refrescar;
begin
  zqMarcas.Refresh;
end;

end.
