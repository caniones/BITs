inherited frmAMOrdenTrabajoDetalle: TfrmAMOrdenTrabajoDetalle
  Left = 540
  Top = 329
  Caption = 'Detalle de la orden de trabajo'
  ClientHeight = 314
  ClientWidth = 544
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 8
    Top = 64
    Width = 30
    Height = 13
    Caption = 'Fecha'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 1738751
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel [1]
    Left = 208
    Top = 64
    Width = 33
    Height = 13
    Caption = 'Estado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 1738751
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel [2]
    Left = 8
    Top = 112
    Width = 35
    Height = 13
    Caption = 'Tiempo'
  end
  object Label4: TLabel [3]
    Left = 8
    Top = 160
    Width = 33
    Height = 13
    Caption = 'Detalle'
  end
  inherited PanelButton: TPanel
    Top = 256
    TabOrder = 4
    inherited btnAceptar: TSpeedButton
      OnClick = btnAceptarClick
    end
    inherited btnSalir: TSpeedButton
      Visible = False
    end
  end
  inherited PanelHeader: TPanel
    TabOrder = 5
    inherited lInfo: TLabel
      Width = 170
      Caption = 'Detalle de la orden de trabajo'
    end
  end
  object dtpFecha: TDateTimePicker
    Left = 8
    Top = 80
    Width = 186
    Height = 21
    Date = 46196.952098182870000000
    Time = 46196.952098182870000000
    TabOrder = 0
  end
  object dtpTiempo: TDateTimePicker
    Left = 8
    Top = 128
    Width = 186
    Height = 21
    Date = 46196.000000000000000000
    Time = 46196.000000000000000000
    Kind = dtkTime
    TabOrder = 2
  end
  object dbmDetalle: TDBMemo
    Left = 8
    Top = 176
    Width = 385
    Height = 65
    DataField = 'detalle'
    DataSource = dsDatos
    TabOrder = 3
  end
  object dblcEstado: TDBLookupComboBox
    Left = 208
    Top = 80
    Width = 201
    Height = 21
    DataField = 'estado_id'
    DataSource = dsDatos
    DropDownRows = 20
    KeyField = 'id_estado'
    ListField = 'estado'
    ListSource = dsEstados
    TabOrder = 1
  end
  object dsDatos: TDataSource
    AutoEdit = False
    DataSet = dmOrdenesTrabajos.zqOrdenesDetalles
    Left = 240
    Top = 192
  end
  object dsEstados: TDataSource
    AutoEdit = False
    DataSet = dmOrdenesTrabajos.zroqEstados
    Left = 360
    Top = 80
  end
end
