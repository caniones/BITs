inherited frmAMEquipo: TfrmAMEquipo
  Left = 500
  Top = 256
  Caption = 'Equipo'
  ClientHeight = 369
  ClientWidth = 632
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 48
    Top = 28
    Width = 182
    Height = 13
    Caption = 'Los campos en naranja son requeridos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 1738751
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel [1]
    Left = 16
    Top = 64
    Width = 32
    Height = 13
    Caption = 'Cliente'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 1738751
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel [2]
    Left = 256
    Top = 64
    Width = 71
    Height = 13
    Caption = 'Tipo de equipo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 1738751
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel [3]
    Left = 16
    Top = 112
    Width = 30
    Height = 13
    Caption = 'Marca'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 1738751
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel [4]
    Left = 256
    Top = 112
    Width = 77
    Height = 13
    Caption = 'N'#250'mero de serie'
  end
  object Label6: TLabel [5]
    Left = 16
    Top = 160
    Width = 35
    Height = 13
    Caption = 'Modelo'
  end
  object Label7: TLabel [6]
    Left = 16
    Top = 208
    Width = 71
    Height = 13
    Caption = 'Observaciones'
  end
  inherited PanelButton: TPanel
    Top = 312
    TabOrder = 6
    inherited btnAceptar: TSpeedButton
      OnClick = btnAceptarClick
    end
    inherited btnSalir: TSpeedButton
      Visible = False
    end
  end
  inherited PanelHeader: TPanel
    TabOrder = 7
    inherited lInfo: TLabel
      Width = 40
      Caption = 'Equipo'
    end
  end
  object dblcCliente: TDBLookupComboBox
    Left = 16
    Top = 80
    Width = 225
    Height = 21
    DataField = 'cliente_id'
    DataSource = dsDatos
    DropDownRows = 20
    DropDownWidth = 200
    KeyField = 'id_cliente'
    ListField = 'cliente'
    ListSource = dsClientes
    TabOrder = 0
  end
  object dblcTipoEquipo: TDBLookupComboBox
    Left = 256
    Top = 80
    Width = 225
    Height = 21
    DataField = 'tipo_equipo_id'
    DataSource = dsDatos
    DropDownRows = 20
    KeyField = 'id_tipo_equipo'
    ListField = 'equipo'
    ListSource = dsTiposEquipos
    TabOrder = 1
  end
  object dblcMarca: TDBLookupComboBox
    Left = 16
    Top = 128
    Width = 225
    Height = 21
    DataField = 'marca_id'
    DataSource = dsDatos
    DropDownRows = 20
    KeyField = 'id_marca'
    ListField = 'marca'
    ListSource = dsMarcas
    TabOrder = 2
  end
  object dbeNumeroSerie: TDBEdit
    Left = 256
    Top = 128
    Width = 225
    Height = 21
    DataField = 'numero_serie'
    DataSource = dsDatos
    TabOrder = 3
  end
  object dbmObservaciones: TDBMemo
    Left = 16
    Top = 224
    Width = 465
    Height = 73
    DataField = 'observaciones'
    DataSource = dsDatos
    TabOrder = 5
  end
  object dbeModelo: TDBEdit
    Left = 16
    Top = 176
    Width = 225
    Height = 21
    DataField = 'modelo'
    DataSource = dsDatos
    TabOrder = 4
  end
  object dsClientes: TDataSource
    AutoEdit = False
    DataSet = dmEquipos.zroqClientes
    Left = 192
    Top = 80
  end
  object dsDatos: TDataSource
    AutoEdit = False
    DataSet = dmEquipos.zqEquipos
    Left = 416
    Top = 176
  end
  object dsTiposEquipos: TDataSource
    AutoEdit = False
    DataSet = dmEquipos.zroqTiposEquipos
    Left = 432
    Top = 80
  end
  object dsMarcas: TDataSource
    AutoEdit = False
    DataSet = dmEquipos.zroqMarcas
    Left = 192
    Top = 128
  end
end
