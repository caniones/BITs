object dmOrdenesTrabajos: TdmOrdenesTrabajos
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 464
  Top = 212
  Height = 418
  Width = 769
  object zusOrdenes: TZUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO public.ordenes(id_orden, equipo_id, falla)'#10
      ''
      'VALUES (:id_orden, :equipo_id, :falla);')
    ModifySQL.Strings = (
      'UPDATE public.ordenes'#10
      'SET equipo_id= :equipo_id, falla= :falla'#10
      'WHERE id_orden= :id_orden')
    UseSequenceFieldForRefreshSQL = False
    Left = 40
    Top = 112
    ParamData = <
      item
        Name = 'equipo_id'
      end
      item
        Name = 'falla'
      end
      item
        Name = 'id_orden'
      end>
  end
  object zusOrdenesDetalles: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM ordenes_detalles'#10
      'WHERE id_orden_detalle = :id_orden_detalle')
    InsertSQL.Strings = (
      
        'INSERT INTO public.ordenes_detalles(id_orden_detalle, fecha, ord' +
        'en_id, detalle, tiempo, estado_id)'#10
      
        #9'VALUES (:id_orden_detalle, :fecha, :orden_id, :detalle, :tiempo' +
        ', :estado_id)')
    ModifySQL.Strings = (
      'UPDATE public.ordenes_detalles'#10
      'SET detalle= :detalle, tiempo= :tiempo, estado_id= :estado_id'#10
      'WHERE id_orden_detalle = :id_orden_detalle')
    UseSequenceFieldForRefreshSQL = False
    Left = 40
    Top = 304
    ParamData = <
      item
        Name = 'detalle'
      end
      item
        Name = 'tiempo'
      end
      item
        Name = 'estado_id'
      end
      item
        Name = 'id_orden_detalle'
      end
      item
        Name = 'fecha'
      end
      item
        Name = 'orden_id'
      end>
  end
  object zusOrdenesRepuestos: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM public.ordenes_repuestos'#10
      #9'WHERE ordenes_repuestos = :ordenes_repuestos')
    InsertSQL.Strings = (
      
        'INSERT INTO public.ordenes_repuestos(id_orden_repuesto, orden_id' +
        ', descripcion, costo)'#10
      'VALUES (:id_orden_repuesto, :orden_id, :descripcion, :costo);')
    ModifySQL.Strings = (
      'UPDATE public.ordenes_repuestos'#10
      'SET descripcion= :descripcion, costo=:costo'#10
      'WHERE id_orden_repuesto = :id_orden_repuesto')
    UseSequenceFieldForRefreshSQL = False
    Left = 168
    Top = 304
    ParamData = <
      item
        Name = 'descripcion'
      end
      item
        Name = 'costo'
      end
      item
        Name = 'id_orden_repuesto'
      end
      item
        Name = 'orden_id'
      end
      item
        Name = 'ordenes_repuestos'
      end>
  end
  object dsOrdenes: TDataSource
    DataSet = zqOrdenes
    Left = 40
    Top = 160
  end
  object zqOrdenes: TZQuery
    Connection = dmConexion.zConnection
    Sequence = zsOrdenes
    SequenceField = 'id_orden'
    UpdateObject = zusOrdenes
    SQL.Strings = (
      'SELECT o.*, od.estado_id, e.estado, e.descripcion'#10
      ''
      ''
      'FROM ordenes o'#10
      ''
      ''
      'INNER JOIN ('#10
      ''
      ''
      '    SELECT DISTINCT ON (orden_id) '#10
      ''
      ''
      '        orden_id, '#10
      ''
      ''
      '        estado_id'#10
      ''
      ''
      '    FROM ordenes_detalles'#10
      ''
      ''
      
        '    ORDER BY orden_id, fecha DESC, id_orden_detalle DESC) od ON ' +
        'o.id_orden = od.orden_id'#10
      ''
      ''
      'INNER JOIN estados e ON e.id_estado = od.estado_id'
      'WHERE o.id_orden = :id_orden')
    Params = <
      item
        Name = 'id_orden'
      end>
    Left = 40
    Top = 16
    ParamData = <
      item
        Name = 'id_orden'
      end>
    object zqOrdenesid_orden: TIntegerField
      FieldName = 'id_orden'
    end
    object zqOrdenesfecha: TDateTimeField
      FieldName = 'fecha'
    end
    object zqOrdenesequipo_id: TIntegerField
      FieldName = 'equipo_id'
      Required = True
    end
    object zqOrdenesfalla: TStringField
      FieldName = 'falla'
      Required = True
      Size = 200
    end
    object zqOrdenesestado_id: TIntegerField
      FieldName = 'estado_id'
    end
    object zqOrdenesestado: TStringField
      FieldName = 'estado'
      Size = 50
    end
    object zqOrdenesdescripcion: TStringField
      FieldName = 'descripcion'
      Size = 100
    end
  end
  object zqOrdenesDetalles: TZQuery
    SortedFields = 'id_orden_detalle'
    Connection = dmConexion.zConnection
    Sequence = zsOrdenesDetalles
    SequenceField = 'id_orden_detalle'
    UpdateObject = zusOrdenesDetalles
    SQL.Strings = (
      
        'SELECT id_orden_detalle, fecha, orden_id, detalle, tiempo, estad' +
        'o_id, e.estado'#10
      'FROM public.ordenes_detalles od'#10
      'INNER JOIN public.estados e ON e.id_estado = od.estado_id'#10)
    Params = <>
    MasterFields = 'id_orden'
    MasterSource = dsOrdenes
    LinkedFields = 'orden_id'
    IndexFieldNames = 'id_orden_detalle Asc'
    Left = 40
    Top = 208
    object zqOrdenesDetallesid_orden_detalle: TIntegerField
      FieldName = 'id_orden_detalle'
    end
    object zqOrdenesDetallesfecha: TDateTimeField
      DisplayLabel = 'Fecha'
      DisplayWidth = 20
      FieldName = 'fecha'
    end
    object zqOrdenesDetallesorden_id: TIntegerField
      FieldName = 'orden_id'
      Required = True
    end
    object zqOrdenesDetallesdetalle: TStringField
      DisplayLabel = 'Detalle'
      FieldName = 'detalle'
      Size = 100
    end
    object zqOrdenesDetallestiempo: TTimeField
      DisplayLabel = 'Tiempo'
      DisplayWidth = 20
      FieldName = 'tiempo'
    end
    object zqOrdenesDetallesestado_id: TIntegerField
      FieldName = 'estado_id'
      Required = True
    end
    object zqOrdenesDetallesestado: TStringField
      DisplayLabel = 'Estado'
      DisplayWidth = 20
      FieldName = 'estado'
      Size = 50
    end
  end
  object zqOrdenesRepuestos: TZQuery
    SortedFields = 'id_orden_repuesto'
    Connection = dmConexion.zConnection
    Sequence = zsOrdenesRepuestos
    SequenceField = 'id_orden_repuesto'
    UpdateObject = zusOrdenesRepuestos
    SQL.Strings = (
      'SELECT id_orden_repuesto, fecha, orden_id, descripcion, costo'#10
      'FROM public.ordenes_repuestos'#10)
    Params = <>
    MasterFields = 'id_orden'
    MasterSource = dsOrdenes
    LinkedFields = 'orden_id'
    IndexFieldNames = 'id_orden_repuesto Asc'
    Left = 168
    Top = 208
    object zqOrdenesRepuestosid_orden_repuesto: TIntegerField
      FieldName = 'id_orden_repuesto'
    end
    object zqOrdenesRepuestosfecha: TDateTimeField
      DisplayLabel = 'Fecha'
      DisplayWidth = 20
      FieldName = 'fecha'
    end
    object zqOrdenesRepuestosorden_id: TIntegerField
      FieldName = 'orden_id'
      Required = True
    end
    object zqOrdenesRepuestosdescripcion: TStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'descripcion'
      Size = 100
    end
    object zqOrdenesRepuestoscosto: TBCDField
      DisplayLabel = 'Costo'
      DisplayWidth = 20
      FieldName = 'costo'
      DisplayFormat = '$#,##0.00'
      Precision = 22
      Size = 2
    end
  end
  object zroqEquipos: TZReadOnlyQuery
    SortedFields = 'cliente'
    Connection = dmConexion.zConnection
    SQL.Strings = (
      
        'select e.id_equipo, e.cliente_id, c.cliente, e.tipo_equipo_id, t' +
        'e.equipo, e.marca_id, m.marca, modelo, e.numero_serie, e.observa' +
        'ciones, e.fecha_alta'
      'from equipos e'#10
      'inner join clientes c on c.id_cliente = e.cliente_id'#10
      
        'inner join tipos_equipos te on te.id_tipo_equipo = e.tipo_equipo' +
        '_id'#10
      'inner join marcas m on m.id_marca = e.marca_id'#10
      'left join equipos_notebook enb on e.id_equipo = enb.id_equipo'#10
      'left join equipos_pc epc on e.id_equipo = epc.id_equipo')
    Params = <>
    IndexFieldNames = 'cliente Asc'
    Left = 400
    Top = 16
    object zroqEquiposid_equipo: TIntegerField
      FieldName = 'id_equipo'
      ReadOnly = True
    end
    object zroqEquiposcliente_id: TIntegerField
      FieldName = 'cliente_id'
      ReadOnly = True
    end
    object zroqEquiposcliente: TStringField
      DisplayLabel = 'Cliente'
      DisplayWidth = 30
      FieldName = 'cliente'
      ReadOnly = True
      Size = 100
    end
    object zroqEquipostipo_equipo_id: TIntegerField
      FieldName = 'tipo_equipo_id'
      ReadOnly = True
    end
    object zroqEquiposequipo: TStringField
      DisplayLabel = 'Equipo'
      DisplayWidth = 20
      FieldName = 'equipo'
      ReadOnly = True
      Size = 100
    end
    object zroqEquiposmarca_id: TIntegerField
      FieldName = 'marca_id'
      ReadOnly = True
    end
    object zroqEquiposmarca: TStringField
      DisplayLabel = 'Marca'
      DisplayWidth = 20
      FieldName = 'marca'
      ReadOnly = True
      Size = 50
    end
    object zroqEquiposmodelo: TStringField
      DisplayLabel = 'Modelo'
      DisplayWidth = 20
      FieldName = 'modelo'
      ReadOnly = True
      Size = 100
    end
    object zroqEquiposnumero_serie: TStringField
      DisplayLabel = 'Numero de serie'
      DisplayWidth = 20
      FieldName = 'numero_serie'
      ReadOnly = True
      Size = 50
    end
    object zroqEquiposobservaciones: TStringField
      DisplayLabel = 'Observaciones'
      DisplayWidth = 70
      FieldName = 'observaciones'
      ReadOnly = True
      Size = 200
    end
    object zroqEquiposfecha_alta: TDateTimeField
      DisplayLabel = 'Fecha de alta'
      DisplayWidth = 20
      FieldName = 'fecha_alta'
      ReadOnly = True
    end
  end
  object zsOrdenes: TZSequence
    Connection = dmConexion.zConnection
    SequenceName = 'public.ordenes_id_orden_seq'
    Left = 40
    Top = 64
  end
  object zsOrdenesDetalles: TZSequence
    Connection = dmConexion.zConnection
    SequenceName = 'public.ordenes_detalles_id_orden_detalle_seq'
    Left = 40
    Top = 256
  end
  object zsOrdenesRepuestos: TZSequence
    Connection = dmConexion.zConnection
    SequenceName = 'public.ordenes_repuestos_id_orden_repuesto_seq'
    Left = 168
    Top = 256
  end
  object zroqEstados: TZReadOnlyQuery
    Connection = dmConexion.zConnection
    SQL.Strings = (
      'SELECT *'#10
      'FROM estados')
    Params = <>
    Left = 576
    Top = 16
    object zroqEstadosid_estado: TIntegerField
      FieldName = 'id_estado'
      ReadOnly = True
    end
    object zroqEstadosestado: TStringField
      FieldName = 'estado'
      ReadOnly = True
      Size = 50
    end
    object zroqEstadosdescripcion: TStringField
      FieldName = 'descripcion'
      ReadOnly = True
      Size = 100
    end
  end
  object zqEquiposNotebook: TZQuery
    Connection = dmConexion.zConnection
    UpdateObject = zusEquiposNoteboook
    SQL.Strings = (
      'SELECT id_equipo, pantalla, procesador, memoria, disco'#10
      'FROM public.equipos_notebook'#10
      'WHERE id_equipo = :id_equipo')
    Params = <
      item
        Name = 'id_equipo'
      end>
    DataSource = dsEquipos
    MasterFields = 'id_equipo'
    MasterSource = dsEquipos
    LinkedFields = 'id_equipo'
    Left = 400
    Top = 112
    ParamData = <
      item
        Name = 'id_equipo'
      end>
  end
  object dsEquipos: TDataSource
    AutoEdit = False
    DataSet = zroqEquipos
    Left = 400
    Top = 64
  end
  object zqEquiposPC: TZQuery
    Connection = dmConexion.zConnection
    UpdateObject = zusEquiposPC
    SQL.Strings = (
      'SELECT id_equipo, procesador, memoria, disco'#10
      'FROM public.equipos_pc'#10
      'WHERE id_equipo = :id_equipo')
    Params = <
      item
        Name = 'id_equipo'
      end>
    DataSource = dsEquipos
    MasterFields = 'id_equipo'
    MasterSource = dsEquipos
    LinkedFields = 'id_equipo'
    Left = 504
    Top = 112
    ParamData = <
      item
        Name = 'id_equipo'
      end>
  end
  object zusEquiposNoteboook: TZUpdateSQL
    InsertSQL.Strings = (
      
        'INSERT INTO equipos_notebook (id_equipo, pantalla, procesador, m' +
        'emoria, disco)'#10
      'VALUES (:id_equipo, :pantalla, :procesador, :memoria, :disco)'#10
      'ON CONFLICT (id_equipo)'#10
      'DO UPDATE SET '#10
      '    pantalla = EXCLUDED.pantalla,'#10
      '    procesador = EXCLUDED.procesador,'#10
      '    memoria = EXCLUDED.memoria,'#10
      '    disco = EXCLUDED.disco'#10
      '')
    ModifySQL.Strings = (
      
        'INSERT INTO equipos_notebook (id_equipo, pantalla, procesador, m' +
        'emoria, disco)'
      ''
      'VALUES (:id_equipo, :pantalla, :procesador, :memoria, :disco)'
      ''
      'ON CONFLICT (id_equipo)'
      ''
      'DO UPDATE SET '
      ''
      '    pantalla = EXCLUDED.pantalla,'
      ''
      '    procesador = EXCLUDED.procesador,'
      ''
      '    memoria = EXCLUDED.memoria,'
      ''
      '    disco = EXCLUDED.disco'
      ''
      '')
    UseSequenceFieldForRefreshSQL = False
    Left = 400
    Top = 160
    ParamData = <
      item
        Name = 'id_equipo'
      end
      item
        Name = 'pantalla'
      end
      item
        Name = 'procesador'
      end
      item
        Name = 'memoria'
      end
      item
        Name = 'disco'
      end>
  end
  object zusEquiposPC: TZUpdateSQL
    UseSequenceFieldForRefreshSQL = False
    Left = 504
    Top = 160
  end
  object zroqTiempoTotal: TZReadOnlyQuery
    Connection = dmConexion.zConnection
    SQL.Strings = (
      'SELECT SUM(od.tiempo) as tiempo_total'#10
      ''
      'FROM ordenes_detalles od'#10
      ''
      'WHERE od.orden_id = :id_orden')
    Params = <
      item
        Name = 'id_orden'
      end>
    DataSource = dsOrdenes
    Left = 296
    Top = 208
    ParamData = <
      item
        Name = 'id_orden'
      end>
    object zroqTiempoTotaltiempo_total: TStringField
      FieldName = 'tiempo_total'
      ReadOnly = True
      Size = 32
    end
  end
  object zroqCostoTotal: TZReadOnlyQuery
    Connection = dmConexion.zConnection
    SQL.Strings = (
      'SELECT COALESCE('
      '    (SELECT SUM(odr.costo) '
      '     FROM ordenes_repuestos odr '
      '     WHERE odr.orden_id = :id_orden), '
      '    CAST(0 AS money)'
      ') as costo_total;')
    Params = <
      item
        Name = 'id_orden'
      end>
    DataSource = dsOrdenes
    Left = 296
    Top = 256
    ParamData = <
      item
        Name = 'id_orden'
      end>
    object zroqCostoTotalcosto_total: TBCDField
      FieldName = 'costo_total'
      ReadOnly = True
      DisplayFormat = '$#,##0.00'
      Precision = 22
      Size = 2
    end
  end
end
