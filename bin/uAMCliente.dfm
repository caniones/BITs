inherited frmAMCliente: TfrmAMCliente
  Caption = 'Cliente'
  ClientHeight = 376
  ClientWidth = 643
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 8
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
  object Label2: TLabel [1]
    Left = 240
    Top = 64
    Width = 42
    Height = 13
    Caption = 'Tel'#233'fono'
  end
  object Label3: TLabel [2]
    Left = 8
    Top = 112
    Width = 19
    Height = 13
    Caption = 'Mail'
  end
  object Label4: TLabel [3]
    Left = 8
    Top = 160
    Width = 45
    Height = 13
    Caption = 'Direccion'
  end
  object Label5: TLabel [4]
    Left = 8
    Top = 208
    Width = 71
    Height = 13
    Caption = 'Observaciones'
  end
  inherited PanelButton: TPanel
    Top = 312
    TabOrder = 5
    inherited btnAceptar: TSpeedButton
      OnClick = btnAceptarClick
    end
    inherited btnSalir: TSpeedButton
      Visible = False
    end
  end
  inherited PanelHeader: TPanel
    TabOrder = 6
    inherited lInfo: TLabel
      Width = 40
      Caption = 'Cliente'
    end
  end
  object dbeCliente: TDBEdit
    Left = 8
    Top = 80
    Width = 217
    Height = 21
    DataField = 'cliente'
    DataSource = dsDatos
    TabOrder = 0
  end
  object dbeTelefono: TDBEdit
    Left = 240
    Top = 80
    Width = 201
    Height = 21
    DataField = 'telefono'
    DataSource = dsDatos
    TabOrder = 1
  end
  object dbeMail: TDBEdit
    Left = 8
    Top = 128
    Width = 217
    Height = 21
    DataField = 'email'
    DataSource = dsDatos
    TabOrder = 2
  end
  object dbeDireccion: TDBEdit
    Left = 8
    Top = 176
    Width = 217
    Height = 21
    DataField = 'direccion'
    DataSource = dsDatos
    TabOrder = 3
  end
  object dbmObservaciones: TDBMemo
    Left = 8
    Top = 224
    Width = 433
    Height = 73
    DataField = 'observaciones'
    DataSource = dsDatos
    TabOrder = 4
  end
  object GroupBox1: TGroupBox
    Left = 240
    Top = 120
    Width = 201
    Height = 97
    Caption = 'Fechas'
    TabOrder = 7
    object Label6: TLabel
      Left = 8
      Top = 24
      Width = 65
      Height = 13
      Caption = 'Fecha de alta'
    end
    object Label7: TLabel
      Left = 8
      Top = 48
      Width = 68
      Height = 13
      Caption = 'Fecha de baja'
    end
    object dbtFechaAlta: TDBText
      Left = 88
      Top = 24
      Width = 63
      Height = 13
      AutoSize = True
      DataField = 'fecha_alta'
      DataSource = dsDatos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object dbtFechaBaja: TDBText
      Left = 88
      Top = 48
      Width = 66
      Height = 13
      AutoSize = True
      DataField = 'fecha_baja'
      DataSource = dsDatos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object btnRecuperar: TSpeedButton
      Left = 88
      Top = 64
      Width = 65
      Height = 22
      Caption = 'Recuperar'
      Flat = True
      OnClick = btnRecuperarClick
    end
  end
  object dsDatos: TDataSource
    AutoEdit = False
    DataSet = dmClientes.zqClientes
    Left = 504
    Top = 80
  end
end
