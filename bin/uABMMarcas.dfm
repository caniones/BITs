inherited frmABMMarcas: TfrmABMMarcas
  Left = 501
  Top = 176
  Caption = 'Alta Baja y Modificaci'#243'n de Marcas'
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
      object cxGridDBTableView1id_marca: TcxGridDBColumn
        DataBinding.FieldName = 'id_marca'
      end
      object cxGridDBTableView1marca: TcxGridDBColumn
        DataBinding.FieldName = 'marca'
      end
    end
  end
  inherited dsDatos: TDataSource
    DataSet = dmMarcas.zqMarcas
  end
end
