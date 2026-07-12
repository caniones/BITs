object dmClientes: TdmClientes
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 541
  Top = 198
  Height = 313
  Width = 376
  object zqClientes: TZQuery
    SortedFields = 'cliente'
    Connection = dmConexion.zConnection
    Sequence = zsClientes
    SequenceField = 'id_cliente'
    SQL.Strings = (
      'SELECT *'#10
      'FROM clientes')
    Params = <>
    IndexFieldNames = 'cliente Asc'
    Left = 32
    Top = 16
    object zqClientesid_cliente: TIntegerField
      DisplayLabel = 'ID Cliente'
      FieldName = 'id_cliente'
    end
    object zqClientescliente: TStringField
      DisplayLabel = 'Cliente'
      DisplayWidth = 30
      FieldName = 'cliente'
      Required = True
      Size = 100
    end
    object zqClientestelefono: TStringField
      DisplayLabel = 'Telefono'
      FieldName = 'telefono'
    end
    object zqClientesemail: TStringField
      DisplayWidth = 50
      FieldName = 'email'
      Size = 100
    end
    object zqClientesdireccion: TStringField
      DisplayLabel = 'Direccion'
      DisplayWidth = 30
      FieldName = 'direccion'
      Size = 100
    end
    object zqClientesobservaciones: TStringField
      DisplayLabel = 'Observaciones'
      DisplayWidth = 70
      FieldName = 'observaciones'
      Size = 200
    end
    object zqClientesfecha_alta: TDateTimeField
      DisplayLabel = 'Fecha de alta'
      DisplayWidth = 20
      FieldName = 'fecha_alta'
    end
    object zqClientesfecha_baja: TDateTimeField
      DisplayWidth = 20
      FieldName = 'fecha_baja'
    end
  end
  object zsClientes: TZSequence
    Connection = dmConexion.zConnection
    SequenceName = 'public.clientes_id_cliente_seq'
    Left = 32
    Top = 64
  end
  object zusClientes: TZUpdateSQL
    DeleteSQL.Strings = (
      'UPDATE clientes'#10
      'SET fecha_baja= '#39'now'#39#10
      'WHERE id_cliente = :id_cliente')
    InsertSQL.Strings = (
      
        'INSERT INTO public.clientes(cliente, telefono, email, direccion,' +
        ' observaciones)'#10
      'VALUES (:cliente, :telefono, :email, :direccion, :observaciones)')
    ModifySQL.Strings = (
      'UPDATE clientes'#10
      
        'SET cliente= :cliente, telefono= :telefono, email= :email, direc' +
        'cion= :direccion, observaciones= :observaciones'#10
      'WHERE id_cliente = :id_cliente')
    UseSequenceFieldForRefreshSQL = False
    Left = 32
    Top = 112
    ParamData = <
      item
        Name = 'cliente'
      end
      item
        Name = 'telefono'
      end
      item
        Name = 'email'
      end
      item
        Name = 'direccion'
      end
      item
        Name = 'observaciones'
      end
      item
        Name = 'id_cliente'
      end>
  end
end
