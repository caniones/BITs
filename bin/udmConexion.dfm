object dmConexion: TdmConexion
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 543
  Top = 207
  Height = 306
  Width = 400
  object zConnection: TZConnection
    ControlsCodePage = cGET_ACP
    Catalog = 'public'
    Properties.Strings = (
      'RawStringEncoding=DB_CP')
    AutoCommit = False
    TransactIsolationLevel = tiReadCommitted
    Connected = True
    BeforeConnect = zConnectionBeforeConnect
    DisableSavepoints = False
    HostName = 'localhost'
    Port = 5432
    Database = 'bits'
    User = 'postgres'
    Password = 'isidoro'
    Protocol = 'postgresql'
    LibraryLocation = 'C:\Program Files (x86)\psqlODBC\1800\bin\libpq.dll'
    Left = 48
    Top = 16
  end
  object zroqOrdenes: TZReadOnlyQuery
    SortedFields = 'fecha'
    Connection = zConnection
    SQL.Strings = (
      
        'SELECT o.id_orden, o.fecha, c.cliente, o.equipo_id, te.equipo, m' +
        '.marca, eq.modelo, eq.numero_serie, o.falla, od.estado_id, e.est' +
        'ado'#10
      'FROM ordenes o'#10
      'INNER JOIN ('#10
      '    SELECT DISTINCT ON (orden_id) '#10
      '        orden_id, '#10
      '        estado_id'#10
      '    FROM ordenes_detalles'#10
      
        '    ORDER BY orden_id, fecha DESC, id_orden_detalle DESC) od ON ' +
        'o.id_orden = od.orden_id'#10
      'INNER JOIN estados e ON e.id_estado = od.estado_id'#10
      'INNER JOIN equipos eq ON eq.id_equipo = o.equipo_id'#10
      
        'INNER JOIN tipos_equipos te ON te.id_tipo_equipo = eq.tipo_equip' +
        'o_id'#10
      'INNER JOIN marcas m ON m.id_marca = eq.marca_id'#10
      'INNER JOIN clientes c ON c.id_cliente = eq.cliente_id')
    Params = <>
    IndexFieldNames = 'fecha Asc'
    Left = 48
    Top = 72
    object zroqOrdenesid_orden: TIntegerField
      DisplayLabel = 'id orden'
      FieldName = 'id_orden'
      ReadOnly = True
    end
    object zroqOrdenesfecha: TDateTimeField
      DisplayLabel = 'Fecha'
      DisplayWidth = 20
      FieldName = 'fecha'
      ReadOnly = True
    end
    object zroqOrdenescliente: TStringField
      DisplayLabel = 'Cliente'
      DisplayWidth = 30
      FieldName = 'cliente'
      ReadOnly = True
      Size = 100
    end
    object zroqOrdenesequipo_id: TIntegerField
      FieldName = 'equipo_id'
      ReadOnly = True
    end
    object zroqOrdenesequipo: TStringField
      DisplayLabel = 'Equipo'
      DisplayWidth = 20
      FieldName = 'equipo'
      ReadOnly = True
      Size = 100
    end
    object zroqOrdenesmarca: TStringField
      DisplayLabel = 'Marca'
      DisplayWidth = 20
      FieldName = 'marca'
      ReadOnly = True
      Size = 50
    end
    object zroqOrdenesmodelo: TStringField
      DisplayLabel = 'Modelo'
      DisplayWidth = 20
      FieldName = 'modelo'
      ReadOnly = True
      Size = 100
    end
    object zroqOrdenesnumero_serie: TStringField
      DisplayLabel = 'Numero de serie'
      DisplayWidth = 20
      FieldName = 'numero_serie'
      ReadOnly = True
      Size = 50
    end
    object zroqOrdenesfalla: TStringField
      DisplayLabel = 'Falla'
      DisplayWidth = 50
      FieldName = 'falla'
      ReadOnly = True
      Size = 200
    end
    object zroqOrdenesestado_id: TIntegerField
      FieldName = 'estado_id'
      ReadOnly = True
    end
    object zroqOrdenesestado: TStringField
      DisplayLabel = 'Estado'
      DisplayWidth = 20
      FieldName = 'estado'
      ReadOnly = True
      Size = 50
    end
  end
end
