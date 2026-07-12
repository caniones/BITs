inherited frmAMOrdenTrabajoRepuesto: TfrmAMOrdenTrabajoRepuesto
  Caption = 'Repuesto de la orden de trabajo'
  ClientHeight = 235
  ClientWidth = 417
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 16
    Top = 72
    Width = 56
    Height = 13
    Caption = 'Descripci'#243'n'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 1738751
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel [1]
    Left = 16
    Top = 120
    Width = 27
    Height = 13
    Caption = 'Costo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 1738751
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  inherited PanelButton: TPanel
    inherited btnAceptar: TSpeedButton
      OnClick = btnAceptarClick
    end
    inherited btnSalir: TSpeedButton
      Visible = False
    end
  end
  inherited PanelHeader: TPanel
    inherited lInfo: TLabel
      Width = 184
      Caption = 'Repuesto de la orden de trabajo'
    end
  end
  object dbeDescripcion: TDBEdit
    Left = 16
    Top = 88
    Width = 257
    Height = 21
    DataField = 'descripcion'
    DataSource = dsDatos
    TabOrder = 2
  end
  object dbeCosto: TDBEdit
    Left = 16
    Top = 136
    Width = 121
    Height = 21
    DataField = 'costo'
    DataSource = dsDatos
    TabOrder = 3
  end
  object dsDatos: TDataSource
    AutoEdit = False
    DataSet = dmOrdenesTrabajos.zqOrdenesRepuestos
    Left = 312
    Top = 88
  end
end
