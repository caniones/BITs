object dmMarcas: TdmMarcas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 640
  Top = 343
  Height = 271
  Width = 364
  object zqMarcas: TZQuery
    SortedFields = 'marca'
    Connection = dmConexion.zConnection
    Sequence = zsMarcas
    SequenceField = 'id_marca'
    UpdateObject = zusMarcas
    SQL.Strings = (
      'SELECT * FROM marcas')
    Params = <>
    IndexFieldNames = 'marca Asc'
    Left = 32
    Top = 16
    object zqMarcasid_marca: TIntegerField
      DisplayLabel = 'ID Marca'
      FieldName = 'id_marca'
    end
    object zqMarcasmarca: TStringField
      DisplayLabel = 'Marca'
      DisplayWidth = 20
      FieldName = 'marca'
      Size = 50
    end
  end
  object zusMarcas: TZUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO marcas'
      '  (id_marca, marca)'
      'VALUES'
      '  (:id_marca, :marca)')
    UseSequenceFieldForRefreshSQL = False
    Left = 32
    Top = 112
    ParamData = <
      item
        Name = 'id_marca'
      end
      item
        Name = 'marca'
      end>
  end
  object zsMarcas: TZSequence
    Connection = dmConexion.zConnection
    SequenceName = 'public.marcas_id_marca_seq'
    Left = 32
    Top = 64
  end
end
