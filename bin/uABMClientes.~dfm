inherited frmABMClientes: TfrmABMClientes
  Left = 520
  Top = 180
  Caption = 'Alta Baja y Modificaci'#243'n de Clientes'
  OldCreateOrder = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited btnAlta: TSpeedButton
      OnClick = btnAltaClick
    end
    inherited btnBaja: TSpeedButton
      OnClick = btnBajaClick
    end
    inherited btnModi: TSpeedButton
      OnClick = btnModiClick
    end
  end
  inherited cxGrid: TcxGrid
    inherited cxGridDBTableView1: TcxGridDBTableView
      object cxGridDBTableView1id_cliente: TcxGridDBColumn
        DataBinding.FieldName = 'id_cliente'
      end
      object cxGridDBTableView1cliente: TcxGridDBColumn
        DataBinding.FieldName = 'cliente'
      end
      object cxGridDBTableView1telefono: TcxGridDBColumn
        DataBinding.FieldName = 'telefono'
      end
      object cxGridDBTableView1email: TcxGridDBColumn
        DataBinding.FieldName = 'email'
      end
      object cxGridDBTableView1direccion: TcxGridDBColumn
        DataBinding.FieldName = 'direccion'
      end
      object cxGridDBTableView1observaciones: TcxGridDBColumn
        DataBinding.FieldName = 'observaciones'
      end
      object cxGridDBTableView1fecha_alta: TcxGridDBColumn
        DataBinding.FieldName = 'fecha_alta'
      end
      object cxGridDBTableView1fecha_baja: TcxGridDBColumn
        DataBinding.FieldName = 'fecha_baja'
        Visible = False
      end
    end
  end
  inherited dsDatos: TDataSource
    DataSet = dmClientes.zqClientes
  end
end
